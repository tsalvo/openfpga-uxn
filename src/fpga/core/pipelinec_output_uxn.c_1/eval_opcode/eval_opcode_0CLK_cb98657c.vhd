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
entity eval_opcode_0CLK_cb98657c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 opcode : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end eval_opcode_0CLK_cb98657c;
architecture arch of eval_opcode_0CLK_cb98657c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_561b]
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_330c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1000_c2_d84a]
signal result_MUX_uxn_opcodes_h_l1000_c2_d84a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_d84a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_d84a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_d84a_return_output : unsigned(0 downto 0);

-- opc_brk[uxn_opcodes_h_l1000_c34_7557]
signal opc_brk_uxn_opcodes_h_l1000_c34_7557_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_46a6]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_6c68]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_570b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1001_c7_330c]
signal result_MUX_uxn_opcodes_h_l1001_c7_330c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_330c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_330c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_330c_return_output : unsigned(0 downto 0);

-- opc_jci[uxn_opcodes_h_l1001_c39_748b]
signal opc_jci_uxn_opcodes_h_l1001_c39_748b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_748b_stack_index : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_748b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_c92d]
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_b5e4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_db9b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1002_c7_570b]
signal result_MUX_uxn_opcodes_h_l1002_c7_570b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_570b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_570b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_570b_return_output : unsigned(0 downto 0);

-- opc_jmi[uxn_opcodes_h_l1002_c39_2d52]
signal opc_jmi_uxn_opcodes_h_l1002_c39_2d52_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmi_uxn_opcodes_h_l1002_c39_2d52_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_5848]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_7702]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_0f5b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1003_c7_db9b]
signal result_MUX_uxn_opcodes_h_l1003_c7_db9b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_db9b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_db9b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_db9b_return_output : unsigned(0 downto 0);

-- opc_jsi[uxn_opcodes_h_l1003_c39_ba6a]
signal opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_ins : unsigned(7 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_8d4b]
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_45fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_d021]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1004_c7_0f5b]
signal result_MUX_uxn_opcodes_h_l1004_c7_0f5b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_0f5b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_0f5b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_0f5b_return_output : unsigned(0 downto 0);

-- opc_lit[uxn_opcodes_h_l1004_c39_3236]
signal opc_lit_uxn_opcodes_h_l1004_c39_3236_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_3236_stack_index : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_3236_ins : unsigned(7 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_3236_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_a547]
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_2ff8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_1089]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1005_c7_d021]
signal result_MUX_uxn_opcodes_h_l1005_c7_d021_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_d021_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_d021_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_d021_return_output : unsigned(0 downto 0);

-- opc_lit2[uxn_opcodes_h_l1005_c39_de7d]
signal opc_lit2_uxn_opcodes_h_l1005_c39_de7d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_de7d_stack_index : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_de7d_ins : unsigned(7 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_de7d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_df3f]
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_f047]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_35d0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1006_c7_1089]
signal result_MUX_uxn_opcodes_h_l1006_c7_1089_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_1089_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_1089_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_1089_return_output : unsigned(0 downto 0);

-- opc_litr[uxn_opcodes_h_l1006_c39_7215]
signal opc_litr_uxn_opcodes_h_l1006_c39_7215_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_7215_stack_index : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_7215_ins : unsigned(7 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_7215_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_59fa]
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_6d3b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_ec40]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1007_c7_35d0]
signal result_MUX_uxn_opcodes_h_l1007_c7_35d0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_35d0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_35d0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_35d0_return_output : unsigned(0 downto 0);

-- opc_lit2r[uxn_opcodes_h_l1007_c39_5de1]
signal opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_stack_index : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_ins : unsigned(7 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_bf11]
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_12ad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_6cc6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1008_c7_ec40]
signal result_MUX_uxn_opcodes_h_l1008_c7_ec40_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_ec40_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_ec40_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_ec40_return_output : unsigned(0 downto 0);

-- opc_inc[uxn_opcodes_h_l1008_c39_96da]
signal opc_inc_uxn_opcodes_h_l1008_c39_96da_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_96da_stack_index : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_96da_ins : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_96da_k : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_96da_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_6779]
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_9f48]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_92e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1009_c7_6cc6]
signal result_MUX_uxn_opcodes_h_l1009_c7_6cc6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_6cc6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_6cc6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_6cc6_return_output : unsigned(0 downto 0);

-- opc_inc2[uxn_opcodes_h_l1009_c39_2fc4]
signal opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_stack_index : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_ins : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_k : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_2d7c]
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_dc78]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_e581]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1010_c7_92e8]
signal result_MUX_uxn_opcodes_h_l1010_c7_92e8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_92e8_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_92e8_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_92e8_return_output : unsigned(0 downto 0);

-- opc_pop[uxn_opcodes_h_l1010_c39_bbce]
signal opc_pop_uxn_opcodes_h_l1010_c39_bbce_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_bbce_stack_index : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_bbce_ins : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_bbce_k : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_bbce_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_b56c]
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_9b2d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_7e5e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1011_c7_e581]
signal result_MUX_uxn_opcodes_h_l1011_c7_e581_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_e581_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_e581_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_e581_return_output : unsigned(0 downto 0);

-- opc_pop2[uxn_opcodes_h_l1011_c39_8632]
signal opc_pop2_uxn_opcodes_h_l1011_c39_8632_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_8632_stack_index : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_8632_ins : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_8632_k : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_8632_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_46e2]
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_7198]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_2181]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1012_c7_7e5e]
signal result_MUX_uxn_opcodes_h_l1012_c7_7e5e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_7e5e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_7e5e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_7e5e_return_output : unsigned(0 downto 0);

-- opc_nip[uxn_opcodes_h_l1012_c39_f5f2]
signal opc_nip_uxn_opcodes_h_l1012_c39_f5f2_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_f5f2_stack_index : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_f5f2_ins : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_f5f2_k : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_f5f2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_c2b9]
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_d3f5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_039d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1013_c7_2181]
signal result_MUX_uxn_opcodes_h_l1013_c7_2181_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_2181_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_2181_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_2181_return_output : unsigned(0 downto 0);

-- opc_nip2[uxn_opcodes_h_l1013_c39_9591]
signal opc_nip2_uxn_opcodes_h_l1013_c39_9591_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_9591_stack_index : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_9591_ins : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_9591_k : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_9591_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_ef6a]
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_5652]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_c848]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1014_c7_039d]
signal result_MUX_uxn_opcodes_h_l1014_c7_039d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_039d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_039d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_039d_return_output : unsigned(0 downto 0);

-- opc_swp[uxn_opcodes_h_l1014_c39_4c9d]
signal opc_swp_uxn_opcodes_h_l1014_c39_4c9d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_4c9d_stack_index : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_4c9d_ins : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_4c9d_k : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_4c9d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_9800]
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_5325]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_15d0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1015_c7_c848]
signal result_MUX_uxn_opcodes_h_l1015_c7_c848_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_c848_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_c848_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_c848_return_output : unsigned(0 downto 0);

-- opc_swp2[uxn_opcodes_h_l1015_c39_fe14]
signal opc_swp2_uxn_opcodes_h_l1015_c39_fe14_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_fe14_stack_index : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_fe14_ins : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_fe14_k : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_fe14_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_1b2f]
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_0fc1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_dcaf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1016_c7_15d0]
signal result_MUX_uxn_opcodes_h_l1016_c7_15d0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_15d0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_15d0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_15d0_return_output : unsigned(0 downto 0);

-- opc_rot[uxn_opcodes_h_l1016_c39_d840]
signal opc_rot_uxn_opcodes_h_l1016_c39_d840_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_d840_stack_index : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_d840_ins : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_d840_k : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_d840_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_bcf9]
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_7d09]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_a1e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1017_c7_dcaf]
signal result_MUX_uxn_opcodes_h_l1017_c7_dcaf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_dcaf_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_dcaf_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_dcaf_return_output : unsigned(0 downto 0);

-- opc_rot2[uxn_opcodes_h_l1017_c39_191b]
signal opc_rot2_uxn_opcodes_h_l1017_c39_191b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_191b_stack_index : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_191b_ins : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_191b_k : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_191b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_8223]
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_7046]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_7f82]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1018_c7_a1e6]
signal result_MUX_uxn_opcodes_h_l1018_c7_a1e6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_a1e6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_a1e6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_a1e6_return_output : unsigned(0 downto 0);

-- opc_dup[uxn_opcodes_h_l1018_c39_970e]
signal opc_dup_uxn_opcodes_h_l1018_c39_970e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_970e_stack_index : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_970e_ins : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_970e_k : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_970e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_f82a]
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_52f9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_fed0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1019_c7_7f82]
signal result_MUX_uxn_opcodes_h_l1019_c7_7f82_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_7f82_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_7f82_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_7f82_return_output : unsigned(0 downto 0);

-- opc_dup2[uxn_opcodes_h_l1019_c39_1bd0]
signal opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_stack_index : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_ins : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_k : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_52f6]
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_beca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_48ee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1020_c7_fed0]
signal result_MUX_uxn_opcodes_h_l1020_c7_fed0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_fed0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_fed0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_fed0_return_output : unsigned(0 downto 0);

-- opc_ovr[uxn_opcodes_h_l1020_c39_57a1]
signal opc_ovr_uxn_opcodes_h_l1020_c39_57a1_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_57a1_stack_index : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_57a1_ins : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_57a1_k : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_57a1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_37fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_f464]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_0224]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1021_c7_48ee]
signal result_MUX_uxn_opcodes_h_l1021_c7_48ee_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_48ee_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_48ee_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_48ee_return_output : unsigned(0 downto 0);

-- opc_ovr2[uxn_opcodes_h_l1021_c39_fe5e]
signal opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_stack_index : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_ins : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_k : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_b51b]
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_0198]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_3e0c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1022_c7_0224]
signal result_MUX_uxn_opcodes_h_l1022_c7_0224_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_0224_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_0224_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_0224_return_output : unsigned(0 downto 0);

-- opc_equ[uxn_opcodes_h_l1022_c39_435f]
signal opc_equ_uxn_opcodes_h_l1022_c39_435f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_435f_stack_index : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_435f_ins : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_435f_k : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_435f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_f865]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_25c6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_64ab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1023_c7_3e0c]
signal result_MUX_uxn_opcodes_h_l1023_c7_3e0c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_3e0c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_3e0c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_3e0c_return_output : unsigned(0 downto 0);

-- opc_equ2[uxn_opcodes_h_l1023_c39_31ce]
signal opc_equ2_uxn_opcodes_h_l1023_c39_31ce_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_31ce_stack_index : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_31ce_ins : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_31ce_k : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_31ce_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_1fc9]
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_cc25]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_12f4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1024_c7_64ab]
signal result_MUX_uxn_opcodes_h_l1024_c7_64ab_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_64ab_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_64ab_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_64ab_return_output : unsigned(0 downto 0);

-- opc_neq[uxn_opcodes_h_l1024_c39_1e84]
signal opc_neq_uxn_opcodes_h_l1024_c39_1e84_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_1e84_stack_index : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_1e84_ins : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_1e84_k : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_1e84_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_1768]
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_f553]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_78e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1025_c7_12f4]
signal result_MUX_uxn_opcodes_h_l1025_c7_12f4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_12f4_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_12f4_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_12f4_return_output : unsigned(0 downto 0);

-- opc_neq2[uxn_opcodes_h_l1025_c39_e321]
signal opc_neq2_uxn_opcodes_h_l1025_c39_e321_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_e321_stack_index : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_e321_ins : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_e321_k : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_e321_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_17aa]
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_26e5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_5bd6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1026_c7_78e8]
signal result_MUX_uxn_opcodes_h_l1026_c7_78e8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_78e8_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_78e8_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_78e8_return_output : unsigned(0 downto 0);

-- opc_gth[uxn_opcodes_h_l1026_c39_09d0]
signal opc_gth_uxn_opcodes_h_l1026_c39_09d0_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_09d0_stack_index : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_09d0_ins : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_09d0_k : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_09d0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_2652]
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_9b18]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_bee8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1027_c7_5bd6]
signal result_MUX_uxn_opcodes_h_l1027_c7_5bd6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_5bd6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_5bd6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_5bd6_return_output : unsigned(0 downto 0);

-- opc_gth2[uxn_opcodes_h_l1027_c39_1cc0]
signal opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_stack_index : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_ins : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_k : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_94b2]
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_88e7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_7790]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1028_c7_bee8]
signal result_MUX_uxn_opcodes_h_l1028_c7_bee8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_bee8_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_bee8_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_bee8_return_output : unsigned(0 downto 0);

-- opc_lth[uxn_opcodes_h_l1028_c39_de13]
signal opc_lth_uxn_opcodes_h_l1028_c39_de13_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_de13_stack_index : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_de13_ins : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_de13_k : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_de13_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_5cca]
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_ac71]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_6654]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1029_c7_7790]
signal result_MUX_uxn_opcodes_h_l1029_c7_7790_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_7790_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_7790_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_7790_return_output : unsigned(0 downto 0);

-- opc_lth2[uxn_opcodes_h_l1029_c39_cfff]
signal opc_lth2_uxn_opcodes_h_l1029_c39_cfff_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_cfff_stack_index : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_cfff_ins : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_cfff_k : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_cfff_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_af98]
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_6e45]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_503a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1030_c7_6654]
signal result_MUX_uxn_opcodes_h_l1030_c7_6654_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_6654_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_6654_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_6654_return_output : unsigned(0 downto 0);

-- opc_jmp[uxn_opcodes_h_l1030_c39_7910]
signal opc_jmp_uxn_opcodes_h_l1030_c39_7910_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_7910_stack_index : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_7910_ins : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_7910_k : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_7910_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_5f17]
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_7f80]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_aac0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1031_c7_503a]
signal result_MUX_uxn_opcodes_h_l1031_c7_503a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_503a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_503a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_503a_return_output : unsigned(0 downto 0);

-- opc_jmp2[uxn_opcodes_h_l1031_c39_9cbb]
signal opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_stack_index : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_ins : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_k : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_840c]
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_4576]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_fd73]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1032_c7_aac0]
signal result_MUX_uxn_opcodes_h_l1032_c7_aac0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_aac0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_aac0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_aac0_return_output : unsigned(0 downto 0);

-- opc_jcn[uxn_opcodes_h_l1032_c39_d4ae]
signal opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_stack_index : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_ins : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_k : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_44d1]
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_ca7b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_9bd9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1033_c7_fd73]
signal result_MUX_uxn_opcodes_h_l1033_c7_fd73_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_fd73_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_fd73_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_fd73_return_output : unsigned(0 downto 0);

-- opc_jcn2[uxn_opcodes_h_l1033_c39_fb1d]
signal opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_stack_index : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_ins : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_k : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_a923]
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_e34d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_14fa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1034_c7_9bd9]
signal result_MUX_uxn_opcodes_h_l1034_c7_9bd9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_9bd9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_9bd9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_9bd9_return_output : unsigned(0 downto 0);

-- opc_jsr[uxn_opcodes_h_l1034_c39_e8d9]
signal opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_stack_index : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_ins : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_k : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_82ce]
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_50ec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_1dcb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1035_c7_14fa]
signal result_MUX_uxn_opcodes_h_l1035_c7_14fa_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_14fa_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_14fa_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_14fa_return_output : unsigned(0 downto 0);

-- opc_jsr2[uxn_opcodes_h_l1035_c39_2238]
signal opc_jsr2_uxn_opcodes_h_l1035_c39_2238_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_2238_stack_index : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_2238_ins : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_2238_k : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_2238_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_3504]
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_6e51]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_bc14]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1036_c7_1dcb]
signal result_MUX_uxn_opcodes_h_l1036_c7_1dcb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_1dcb_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_1dcb_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_1dcb_return_output : unsigned(0 downto 0);

-- opc_sth[uxn_opcodes_h_l1036_c39_de58]
signal opc_sth_uxn_opcodes_h_l1036_c39_de58_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_de58_stack_index : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_de58_ins : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_de58_k : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_de58_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_f0fe]
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_a911]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_a3f0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1037_c7_bc14]
signal result_MUX_uxn_opcodes_h_l1037_c7_bc14_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_bc14_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_bc14_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_bc14_return_output : unsigned(0 downto 0);

-- opc_sth2[uxn_opcodes_h_l1037_c39_8a61]
signal opc_sth2_uxn_opcodes_h_l1037_c39_8a61_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_8a61_stack_index : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_8a61_ins : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_8a61_k : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_8a61_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_15ff]
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_ede8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_fbd1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1038_c7_a3f0]
signal result_MUX_uxn_opcodes_h_l1038_c7_a3f0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_a3f0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_a3f0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_a3f0_return_output : unsigned(0 downto 0);

-- opc_ldz[uxn_opcodes_h_l1038_c39_063f]
signal opc_ldz_uxn_opcodes_h_l1038_c39_063f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_063f_stack_index : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_063f_ins : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_063f_k : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_063f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_5ff9]
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_5df6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_2e9a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1039_c7_fbd1]
signal result_MUX_uxn_opcodes_h_l1039_c7_fbd1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_fbd1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_fbd1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_fbd1_return_output : unsigned(0 downto 0);

-- opc_ldz2[uxn_opcodes_h_l1039_c39_bd81]
signal opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_stack_index : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_ins : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_k : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_1779]
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_c65c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_6f18]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1040_c7_2e9a]
signal result_MUX_uxn_opcodes_h_l1040_c7_2e9a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_2e9a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_2e9a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_2e9a_return_output : unsigned(0 downto 0);

-- opc_stz[uxn_opcodes_h_l1040_c39_37e9]
signal opc_stz_uxn_opcodes_h_l1040_c39_37e9_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_37e9_stack_index : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_37e9_ins : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_37e9_k : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_37e9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_d704]
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_1d5e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_4e20]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1041_c7_6f18]
signal result_MUX_uxn_opcodes_h_l1041_c7_6f18_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_6f18_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_6f18_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_6f18_return_output : unsigned(0 downto 0);

-- opc_stz2[uxn_opcodes_h_l1041_c39_26f2]
signal opc_stz2_uxn_opcodes_h_l1041_c39_26f2_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_26f2_stack_index : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_26f2_ins : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_26f2_k : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_26f2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_9e38]
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_da38]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_d00f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1042_c7_4e20]
signal result_MUX_uxn_opcodes_h_l1042_c7_4e20_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_4e20_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_4e20_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_4e20_return_output : unsigned(0 downto 0);

-- opc_ldr[uxn_opcodes_h_l1042_c39_f212]
signal opc_ldr_uxn_opcodes_h_l1042_c39_f212_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_f212_stack_index : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_f212_ins : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_f212_k : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_f212_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_0b39]
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_3cb3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_d6be]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1043_c7_d00f]
signal result_MUX_uxn_opcodes_h_l1043_c7_d00f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_d00f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_d00f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_d00f_return_output : unsigned(0 downto 0);

-- opc_ldr2[uxn_opcodes_h_l1043_c39_3860]
signal opc_ldr2_uxn_opcodes_h_l1043_c39_3860_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_3860_stack_index : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_3860_ins : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_3860_k : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_3860_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_128c]
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_b069]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_6655]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1044_c7_d6be]
signal result_MUX_uxn_opcodes_h_l1044_c7_d6be_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_d6be_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_d6be_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_d6be_return_output : unsigned(0 downto 0);

-- opc_str[uxn_opcodes_h_l1044_c39_bab8]
signal opc_str_uxn_opcodes_h_l1044_c39_bab8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_bab8_stack_index : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_bab8_ins : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_bab8_k : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_bab8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_68fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_37fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_f181]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1045_c7_6655]
signal result_MUX_uxn_opcodes_h_l1045_c7_6655_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_6655_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_6655_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_6655_return_output : unsigned(0 downto 0);

-- opc_str2[uxn_opcodes_h_l1045_c39_dfaa]
signal opc_str2_uxn_opcodes_h_l1045_c39_dfaa_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_dfaa_stack_index : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_dfaa_ins : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_dfaa_k : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_dfaa_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_c6ec]
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_438c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_1eda]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1046_c7_f181]
signal result_MUX_uxn_opcodes_h_l1046_c7_f181_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_f181_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_f181_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_f181_return_output : unsigned(0 downto 0);

-- opc_lda[uxn_opcodes_h_l1046_c39_f8fa]
signal opc_lda_uxn_opcodes_h_l1046_c39_f8fa_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_f8fa_stack_index : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_f8fa_ins : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_f8fa_k : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_f8fa_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_5b32]
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_8df1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_4547]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1047_c7_1eda]
signal result_MUX_uxn_opcodes_h_l1047_c7_1eda_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_1eda_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_1eda_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_1eda_return_output : unsigned(0 downto 0);

-- opc_lda2[uxn_opcodes_h_l1047_c39_c237]
signal opc_lda2_uxn_opcodes_h_l1047_c39_c237_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_c237_stack_index : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_c237_ins : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_c237_k : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_c237_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_ff95]
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_e15c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_ef51]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1048_c7_4547]
signal result_MUX_uxn_opcodes_h_l1048_c7_4547_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_4547_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_4547_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_4547_return_output : unsigned(0 downto 0);

-- opc_sta[uxn_opcodes_h_l1048_c39_eb13]
signal opc_sta_uxn_opcodes_h_l1048_c39_eb13_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_eb13_stack_index : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_eb13_ins : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_eb13_k : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_eb13_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_6e44]
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_2c74]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_5874]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1049_c7_ef51]
signal result_MUX_uxn_opcodes_h_l1049_c7_ef51_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_ef51_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_ef51_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_ef51_return_output : unsigned(0 downto 0);

-- opc_sta2[uxn_opcodes_h_l1049_c39_595f]
signal opc_sta2_uxn_opcodes_h_l1049_c39_595f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_595f_stack_index : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_595f_ins : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_595f_k : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_595f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_7236]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_8670]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_ca7b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1050_c7_5874]
signal result_MUX_uxn_opcodes_h_l1050_c7_5874_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_5874_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_5874_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_5874_return_output : unsigned(0 downto 0);

-- opc_dei[uxn_opcodes_h_l1050_c39_4132]
signal opc_dei_uxn_opcodes_h_l1050_c39_4132_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_4132_stack_index : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_4132_ins : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_4132_k : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_4132_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_43c3]
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_55cc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_592e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1051_c7_ca7b]
signal result_MUX_uxn_opcodes_h_l1051_c7_ca7b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_ca7b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_ca7b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_ca7b_return_output : unsigned(0 downto 0);

-- opc_dei2[uxn_opcodes_h_l1051_c39_89d8]
signal opc_dei2_uxn_opcodes_h_l1051_c39_89d8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_89d8_stack_index : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_89d8_ins : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_89d8_k : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_89d8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_9509]
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_603f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_e2a2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1052_c7_592e]
signal result_MUX_uxn_opcodes_h_l1052_c7_592e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_592e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_592e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_592e_return_output : unsigned(0 downto 0);

-- opc_deo[uxn_opcodes_h_l1052_c39_817e]
signal opc_deo_uxn_opcodes_h_l1052_c39_817e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_817e_stack_index : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_817e_ins : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_817e_k : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_817e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_a178]
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_0768]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_65f8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1053_c7_e2a2]
signal result_MUX_uxn_opcodes_h_l1053_c7_e2a2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_e2a2_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_e2a2_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_e2a2_return_output : unsigned(0 downto 0);

-- opc_deo2[uxn_opcodes_h_l1053_c39_d9c5]
signal opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_stack_index : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_ins : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_k : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_718b]
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_d30b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_ddfe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1054_c7_65f8]
signal result_MUX_uxn_opcodes_h_l1054_c7_65f8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_65f8_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_65f8_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_65f8_return_output : unsigned(0 downto 0);

-- opc_add[uxn_opcodes_h_l1054_c39_5242]
signal opc_add_uxn_opcodes_h_l1054_c39_5242_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_5242_stack_index : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_5242_ins : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_5242_k : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_5242_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_8430]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_fd47]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_0f6c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1055_c7_ddfe]
signal result_MUX_uxn_opcodes_h_l1055_c7_ddfe_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_ddfe_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_ddfe_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_ddfe_return_output : unsigned(0 downto 0);

-- opc_add2[uxn_opcodes_h_l1055_c39_7e65]
signal opc_add2_uxn_opcodes_h_l1055_c39_7e65_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_7e65_stack_index : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_7e65_ins : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_7e65_k : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_7e65_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_0d89]
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_c108]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_06f5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1056_c7_0f6c]
signal result_MUX_uxn_opcodes_h_l1056_c7_0f6c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_0f6c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_0f6c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_0f6c_return_output : unsigned(0 downto 0);

-- opc_sub[uxn_opcodes_h_l1056_c39_c606]
signal opc_sub_uxn_opcodes_h_l1056_c39_c606_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_c606_stack_index : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_c606_ins : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_c606_k : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_c606_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_8f93]
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_beac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_20b5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1057_c7_06f5]
signal result_MUX_uxn_opcodes_h_l1057_c7_06f5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_06f5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_06f5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_06f5_return_output : unsigned(0 downto 0);

-- opc_sub2[uxn_opcodes_h_l1057_c39_16bd]
signal opc_sub2_uxn_opcodes_h_l1057_c39_16bd_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_16bd_stack_index : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_16bd_ins : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_16bd_k : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_16bd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_ca1a]
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_fbd3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_936c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1058_c7_20b5]
signal result_MUX_uxn_opcodes_h_l1058_c7_20b5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_20b5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_20b5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_20b5_return_output : unsigned(0 downto 0);

-- opc_mul[uxn_opcodes_h_l1058_c39_b973]
signal opc_mul_uxn_opcodes_h_l1058_c39_b973_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_b973_stack_index : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_b973_ins : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_b973_k : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_b973_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_6ec1]
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_8bcb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_176f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1059_c7_936c]
signal result_MUX_uxn_opcodes_h_l1059_c7_936c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_936c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_936c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_936c_return_output : unsigned(0 downto 0);

-- opc_mul2[uxn_opcodes_h_l1059_c39_ff2a]
signal opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_stack_index : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_ins : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_k : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_13ef]
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_aeb0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_257c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1060_c7_176f]
signal result_MUX_uxn_opcodes_h_l1060_c7_176f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_176f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_176f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_176f_return_output : unsigned(0 downto 0);

-- opc_div[uxn_opcodes_h_l1060_c39_71b7]
signal opc_div_uxn_opcodes_h_l1060_c39_71b7_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_71b7_stack_index : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_71b7_ins : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_71b7_k : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_71b7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_26f0]
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_5f1d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_eceb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1061_c7_257c]
signal result_MUX_uxn_opcodes_h_l1061_c7_257c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_257c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_257c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_257c_return_output : unsigned(0 downto 0);

-- opc_div2[uxn_opcodes_h_l1061_c39_610f]
signal opc_div2_uxn_opcodes_h_l1061_c39_610f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_610f_stack_index : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_610f_ins : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_610f_k : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_610f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_7d29]
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_cc94]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_38f2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1062_c7_eceb]
signal result_MUX_uxn_opcodes_h_l1062_c7_eceb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_eceb_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_eceb_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_eceb_return_output : unsigned(0 downto 0);

-- opc_and[uxn_opcodes_h_l1062_c39_7825]
signal opc_and_uxn_opcodes_h_l1062_c39_7825_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_7825_stack_index : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_7825_ins : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_7825_k : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_7825_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_3a0b]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_b1ce]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_0913]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1063_c7_38f2]
signal result_MUX_uxn_opcodes_h_l1063_c7_38f2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_38f2_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_38f2_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_38f2_return_output : unsigned(0 downto 0);

-- opc_and2[uxn_opcodes_h_l1063_c39_0978]
signal opc_and2_uxn_opcodes_h_l1063_c39_0978_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_0978_stack_index : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_0978_ins : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_0978_k : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_0978_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_cbe5]
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_1485]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_4972]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1064_c7_0913]
signal result_MUX_uxn_opcodes_h_l1064_c7_0913_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_0913_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_0913_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_0913_return_output : unsigned(0 downto 0);

-- opc_ora[uxn_opcodes_h_l1064_c39_3e6d]
signal opc_ora_uxn_opcodes_h_l1064_c39_3e6d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_3e6d_stack_index : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_3e6d_ins : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_3e6d_k : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_3e6d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_446c]
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_c770]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_37b1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1065_c7_4972]
signal result_MUX_uxn_opcodes_h_l1065_c7_4972_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_4972_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_4972_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_4972_return_output : unsigned(0 downto 0);

-- opc_ora2[uxn_opcodes_h_l1065_c39_bc0b]
signal opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_stack_index : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_ins : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_k : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_92d3]
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_a595]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_1642]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1066_c7_37b1]
signal result_MUX_uxn_opcodes_h_l1066_c7_37b1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_37b1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_37b1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_37b1_return_output : unsigned(0 downto 0);

-- opc_eor[uxn_opcodes_h_l1066_c39_0087]
signal opc_eor_uxn_opcodes_h_l1066_c39_0087_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_0087_stack_index : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_0087_ins : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_0087_k : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_0087_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_246a]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_f319]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_39d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1067_c7_1642]
signal result_MUX_uxn_opcodes_h_l1067_c7_1642_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_1642_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_1642_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_1642_return_output : unsigned(0 downto 0);

-- opc_eor2[uxn_opcodes_h_l1067_c39_449e]
signal opc_eor2_uxn_opcodes_h_l1067_c39_449e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_449e_stack_index : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_449e_ins : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_449e_k : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_449e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_6668]
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_74da]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_a791]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1068_c7_39d1]
signal result_MUX_uxn_opcodes_h_l1068_c7_39d1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_39d1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_39d1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_39d1_return_output : unsigned(0 downto 0);

-- opc_sft[uxn_opcodes_h_l1068_c39_0666]
signal opc_sft_uxn_opcodes_h_l1068_c39_0666_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_0666_stack_index : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_0666_ins : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_0666_k : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_0666_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_d509]
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_3875]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1069_c7_a791]
signal result_MUX_uxn_opcodes_h_l1069_c7_a791_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_a791_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_a791_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_a791_return_output : unsigned(0 downto 0);

-- opc_sft2[uxn_opcodes_h_l1069_c39_d3ad]
signal opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_stack_index : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_ins : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_k : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_left,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_right,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_return_output);

-- result_MUX_uxn_opcodes_h_l1000_c2_d84a
result_MUX_uxn_opcodes_h_l1000_c2_d84a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1000_c2_d84a_cond,
result_MUX_uxn_opcodes_h_l1000_c2_d84a_iftrue,
result_MUX_uxn_opcodes_h_l1000_c2_d84a_iffalse,
result_MUX_uxn_opcodes_h_l1000_c2_d84a_return_output);

-- opc_brk_uxn_opcodes_h_l1000_c34_7557
opc_brk_uxn_opcodes_h_l1000_c34_7557 : entity work.opc_brk_0CLK_de264c78 port map (
opc_brk_uxn_opcodes_h_l1000_c34_7557_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_return_output);

-- result_MUX_uxn_opcodes_h_l1001_c7_330c
result_MUX_uxn_opcodes_h_l1001_c7_330c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1001_c7_330c_cond,
result_MUX_uxn_opcodes_h_l1001_c7_330c_iftrue,
result_MUX_uxn_opcodes_h_l1001_c7_330c_iffalse,
result_MUX_uxn_opcodes_h_l1001_c7_330c_return_output);

-- opc_jci_uxn_opcodes_h_l1001_c39_748b
opc_jci_uxn_opcodes_h_l1001_c39_748b : entity work.opc_jci_0CLK_ee22de41 port map (
clk,
opc_jci_uxn_opcodes_h_l1001_c39_748b_CLOCK_ENABLE,
opc_jci_uxn_opcodes_h_l1001_c39_748b_stack_index,
opc_jci_uxn_opcodes_h_l1001_c39_748b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_left,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_right,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_return_output);

-- result_MUX_uxn_opcodes_h_l1002_c7_570b
result_MUX_uxn_opcodes_h_l1002_c7_570b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1002_c7_570b_cond,
result_MUX_uxn_opcodes_h_l1002_c7_570b_iftrue,
result_MUX_uxn_opcodes_h_l1002_c7_570b_iffalse,
result_MUX_uxn_opcodes_h_l1002_c7_570b_return_output);

-- opc_jmi_uxn_opcodes_h_l1002_c39_2d52
opc_jmi_uxn_opcodes_h_l1002_c39_2d52 : entity work.opc_jmi_0CLK_60bac9ed port map (
clk,
opc_jmi_uxn_opcodes_h_l1002_c39_2d52_CLOCK_ENABLE,
opc_jmi_uxn_opcodes_h_l1002_c39_2d52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_return_output);

-- result_MUX_uxn_opcodes_h_l1003_c7_db9b
result_MUX_uxn_opcodes_h_l1003_c7_db9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1003_c7_db9b_cond,
result_MUX_uxn_opcodes_h_l1003_c7_db9b_iftrue,
result_MUX_uxn_opcodes_h_l1003_c7_db9b_iffalse,
result_MUX_uxn_opcodes_h_l1003_c7_db9b_return_output);

-- opc_jsi_uxn_opcodes_h_l1003_c39_ba6a
opc_jsi_uxn_opcodes_h_l1003_c39_ba6a : entity work.opc_jsi_0CLK_5aec3a72 port map (
clk,
opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_CLOCK_ENABLE,
opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_ins,
opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_left,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_right,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_return_output);

-- result_MUX_uxn_opcodes_h_l1004_c7_0f5b
result_MUX_uxn_opcodes_h_l1004_c7_0f5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1004_c7_0f5b_cond,
result_MUX_uxn_opcodes_h_l1004_c7_0f5b_iftrue,
result_MUX_uxn_opcodes_h_l1004_c7_0f5b_iffalse,
result_MUX_uxn_opcodes_h_l1004_c7_0f5b_return_output);

-- opc_lit_uxn_opcodes_h_l1004_c39_3236
opc_lit_uxn_opcodes_h_l1004_c39_3236 : entity work.opc_lit_0CLK_c5ad4252 port map (
clk,
opc_lit_uxn_opcodes_h_l1004_c39_3236_CLOCK_ENABLE,
opc_lit_uxn_opcodes_h_l1004_c39_3236_stack_index,
opc_lit_uxn_opcodes_h_l1004_c39_3236_ins,
opc_lit_uxn_opcodes_h_l1004_c39_3236_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_left,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_right,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_return_output);

-- result_MUX_uxn_opcodes_h_l1005_c7_d021
result_MUX_uxn_opcodes_h_l1005_c7_d021 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1005_c7_d021_cond,
result_MUX_uxn_opcodes_h_l1005_c7_d021_iftrue,
result_MUX_uxn_opcodes_h_l1005_c7_d021_iffalse,
result_MUX_uxn_opcodes_h_l1005_c7_d021_return_output);

-- opc_lit2_uxn_opcodes_h_l1005_c39_de7d
opc_lit2_uxn_opcodes_h_l1005_c39_de7d : entity work.opc_lit2_0CLK_6bd75774 port map (
clk,
opc_lit2_uxn_opcodes_h_l1005_c39_de7d_CLOCK_ENABLE,
opc_lit2_uxn_opcodes_h_l1005_c39_de7d_stack_index,
opc_lit2_uxn_opcodes_h_l1005_c39_de7d_ins,
opc_lit2_uxn_opcodes_h_l1005_c39_de7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_left,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_right,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_return_output);

-- result_MUX_uxn_opcodes_h_l1006_c7_1089
result_MUX_uxn_opcodes_h_l1006_c7_1089 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1006_c7_1089_cond,
result_MUX_uxn_opcodes_h_l1006_c7_1089_iftrue,
result_MUX_uxn_opcodes_h_l1006_c7_1089_iffalse,
result_MUX_uxn_opcodes_h_l1006_c7_1089_return_output);

-- opc_litr_uxn_opcodes_h_l1006_c39_7215
opc_litr_uxn_opcodes_h_l1006_c39_7215 : entity work.opc_litr_0CLK_c5ad4252 port map (
clk,
opc_litr_uxn_opcodes_h_l1006_c39_7215_CLOCK_ENABLE,
opc_litr_uxn_opcodes_h_l1006_c39_7215_stack_index,
opc_litr_uxn_opcodes_h_l1006_c39_7215_ins,
opc_litr_uxn_opcodes_h_l1006_c39_7215_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_left,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_right,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_return_output);

-- result_MUX_uxn_opcodes_h_l1007_c7_35d0
result_MUX_uxn_opcodes_h_l1007_c7_35d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1007_c7_35d0_cond,
result_MUX_uxn_opcodes_h_l1007_c7_35d0_iftrue,
result_MUX_uxn_opcodes_h_l1007_c7_35d0_iffalse,
result_MUX_uxn_opcodes_h_l1007_c7_35d0_return_output);

-- opc_lit2r_uxn_opcodes_h_l1007_c39_5de1
opc_lit2r_uxn_opcodes_h_l1007_c39_5de1 : entity work.opc_lit2r_0CLK_6bd75774 port map (
clk,
opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_CLOCK_ENABLE,
opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_stack_index,
opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_ins,
opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_left,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_right,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_return_output);

-- result_MUX_uxn_opcodes_h_l1008_c7_ec40
result_MUX_uxn_opcodes_h_l1008_c7_ec40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1008_c7_ec40_cond,
result_MUX_uxn_opcodes_h_l1008_c7_ec40_iftrue,
result_MUX_uxn_opcodes_h_l1008_c7_ec40_iffalse,
result_MUX_uxn_opcodes_h_l1008_c7_ec40_return_output);

-- opc_inc_uxn_opcodes_h_l1008_c39_96da
opc_inc_uxn_opcodes_h_l1008_c39_96da : entity work.opc_inc_0CLK_acbe7875 port map (
clk,
opc_inc_uxn_opcodes_h_l1008_c39_96da_CLOCK_ENABLE,
opc_inc_uxn_opcodes_h_l1008_c39_96da_stack_index,
opc_inc_uxn_opcodes_h_l1008_c39_96da_ins,
opc_inc_uxn_opcodes_h_l1008_c39_96da_k,
opc_inc_uxn_opcodes_h_l1008_c39_96da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_left,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_right,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_return_output);

-- result_MUX_uxn_opcodes_h_l1009_c7_6cc6
result_MUX_uxn_opcodes_h_l1009_c7_6cc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1009_c7_6cc6_cond,
result_MUX_uxn_opcodes_h_l1009_c7_6cc6_iftrue,
result_MUX_uxn_opcodes_h_l1009_c7_6cc6_iffalse,
result_MUX_uxn_opcodes_h_l1009_c7_6cc6_return_output);

-- opc_inc2_uxn_opcodes_h_l1009_c39_2fc4
opc_inc2_uxn_opcodes_h_l1009_c39_2fc4 : entity work.opc_inc2_0CLK_9fd64849 port map (
clk,
opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_CLOCK_ENABLE,
opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_stack_index,
opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_ins,
opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_k,
opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_left,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_right,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_return_output);

-- result_MUX_uxn_opcodes_h_l1010_c7_92e8
result_MUX_uxn_opcodes_h_l1010_c7_92e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1010_c7_92e8_cond,
result_MUX_uxn_opcodes_h_l1010_c7_92e8_iftrue,
result_MUX_uxn_opcodes_h_l1010_c7_92e8_iffalse,
result_MUX_uxn_opcodes_h_l1010_c7_92e8_return_output);

-- opc_pop_uxn_opcodes_h_l1010_c39_bbce
opc_pop_uxn_opcodes_h_l1010_c39_bbce : entity work.opc_pop_0CLK_b2d4f88a port map (
clk,
opc_pop_uxn_opcodes_h_l1010_c39_bbce_CLOCK_ENABLE,
opc_pop_uxn_opcodes_h_l1010_c39_bbce_stack_index,
opc_pop_uxn_opcodes_h_l1010_c39_bbce_ins,
opc_pop_uxn_opcodes_h_l1010_c39_bbce_k,
opc_pop_uxn_opcodes_h_l1010_c39_bbce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_left,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_right,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_return_output);

-- result_MUX_uxn_opcodes_h_l1011_c7_e581
result_MUX_uxn_opcodes_h_l1011_c7_e581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1011_c7_e581_cond,
result_MUX_uxn_opcodes_h_l1011_c7_e581_iftrue,
result_MUX_uxn_opcodes_h_l1011_c7_e581_iffalse,
result_MUX_uxn_opcodes_h_l1011_c7_e581_return_output);

-- opc_pop2_uxn_opcodes_h_l1011_c39_8632
opc_pop2_uxn_opcodes_h_l1011_c39_8632 : entity work.opc_pop2_0CLK_b2d4f88a port map (
clk,
opc_pop2_uxn_opcodes_h_l1011_c39_8632_CLOCK_ENABLE,
opc_pop2_uxn_opcodes_h_l1011_c39_8632_stack_index,
opc_pop2_uxn_opcodes_h_l1011_c39_8632_ins,
opc_pop2_uxn_opcodes_h_l1011_c39_8632_k,
opc_pop2_uxn_opcodes_h_l1011_c39_8632_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_left,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_right,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_return_output);

-- result_MUX_uxn_opcodes_h_l1012_c7_7e5e
result_MUX_uxn_opcodes_h_l1012_c7_7e5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1012_c7_7e5e_cond,
result_MUX_uxn_opcodes_h_l1012_c7_7e5e_iftrue,
result_MUX_uxn_opcodes_h_l1012_c7_7e5e_iffalse,
result_MUX_uxn_opcodes_h_l1012_c7_7e5e_return_output);

-- opc_nip_uxn_opcodes_h_l1012_c39_f5f2
opc_nip_uxn_opcodes_h_l1012_c39_f5f2 : entity work.opc_nip_0CLK_a587bd5a port map (
clk,
opc_nip_uxn_opcodes_h_l1012_c39_f5f2_CLOCK_ENABLE,
opc_nip_uxn_opcodes_h_l1012_c39_f5f2_stack_index,
opc_nip_uxn_opcodes_h_l1012_c39_f5f2_ins,
opc_nip_uxn_opcodes_h_l1012_c39_f5f2_k,
opc_nip_uxn_opcodes_h_l1012_c39_f5f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_left,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_right,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_return_output);

-- result_MUX_uxn_opcodes_h_l1013_c7_2181
result_MUX_uxn_opcodes_h_l1013_c7_2181 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1013_c7_2181_cond,
result_MUX_uxn_opcodes_h_l1013_c7_2181_iftrue,
result_MUX_uxn_opcodes_h_l1013_c7_2181_iffalse,
result_MUX_uxn_opcodes_h_l1013_c7_2181_return_output);

-- opc_nip2_uxn_opcodes_h_l1013_c39_9591
opc_nip2_uxn_opcodes_h_l1013_c39_9591 : entity work.opc_nip2_0CLK_359b21ec port map (
clk,
opc_nip2_uxn_opcodes_h_l1013_c39_9591_CLOCK_ENABLE,
opc_nip2_uxn_opcodes_h_l1013_c39_9591_stack_index,
opc_nip2_uxn_opcodes_h_l1013_c39_9591_ins,
opc_nip2_uxn_opcodes_h_l1013_c39_9591_k,
opc_nip2_uxn_opcodes_h_l1013_c39_9591_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_left,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_right,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_return_output);

-- result_MUX_uxn_opcodes_h_l1014_c7_039d
result_MUX_uxn_opcodes_h_l1014_c7_039d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1014_c7_039d_cond,
result_MUX_uxn_opcodes_h_l1014_c7_039d_iftrue,
result_MUX_uxn_opcodes_h_l1014_c7_039d_iffalse,
result_MUX_uxn_opcodes_h_l1014_c7_039d_return_output);

-- opc_swp_uxn_opcodes_h_l1014_c39_4c9d
opc_swp_uxn_opcodes_h_l1014_c39_4c9d : entity work.opc_swp_0CLK_670da08e port map (
clk,
opc_swp_uxn_opcodes_h_l1014_c39_4c9d_CLOCK_ENABLE,
opc_swp_uxn_opcodes_h_l1014_c39_4c9d_stack_index,
opc_swp_uxn_opcodes_h_l1014_c39_4c9d_ins,
opc_swp_uxn_opcodes_h_l1014_c39_4c9d_k,
opc_swp_uxn_opcodes_h_l1014_c39_4c9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_left,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_right,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_return_output);

-- result_MUX_uxn_opcodes_h_l1015_c7_c848
result_MUX_uxn_opcodes_h_l1015_c7_c848 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1015_c7_c848_cond,
result_MUX_uxn_opcodes_h_l1015_c7_c848_iftrue,
result_MUX_uxn_opcodes_h_l1015_c7_c848_iffalse,
result_MUX_uxn_opcodes_h_l1015_c7_c848_return_output);

-- opc_swp2_uxn_opcodes_h_l1015_c39_fe14
opc_swp2_uxn_opcodes_h_l1015_c39_fe14 : entity work.opc_swp2_0CLK_636e671d port map (
clk,
opc_swp2_uxn_opcodes_h_l1015_c39_fe14_CLOCK_ENABLE,
opc_swp2_uxn_opcodes_h_l1015_c39_fe14_stack_index,
opc_swp2_uxn_opcodes_h_l1015_c39_fe14_ins,
opc_swp2_uxn_opcodes_h_l1015_c39_fe14_k,
opc_swp2_uxn_opcodes_h_l1015_c39_fe14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_left,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_right,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_return_output);

-- result_MUX_uxn_opcodes_h_l1016_c7_15d0
result_MUX_uxn_opcodes_h_l1016_c7_15d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1016_c7_15d0_cond,
result_MUX_uxn_opcodes_h_l1016_c7_15d0_iftrue,
result_MUX_uxn_opcodes_h_l1016_c7_15d0_iffalse,
result_MUX_uxn_opcodes_h_l1016_c7_15d0_return_output);

-- opc_rot_uxn_opcodes_h_l1016_c39_d840
opc_rot_uxn_opcodes_h_l1016_c39_d840 : entity work.opc_rot_0CLK_9a305e2b port map (
clk,
opc_rot_uxn_opcodes_h_l1016_c39_d840_CLOCK_ENABLE,
opc_rot_uxn_opcodes_h_l1016_c39_d840_stack_index,
opc_rot_uxn_opcodes_h_l1016_c39_d840_ins,
opc_rot_uxn_opcodes_h_l1016_c39_d840_k,
opc_rot_uxn_opcodes_h_l1016_c39_d840_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_left,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_right,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_return_output);

-- result_MUX_uxn_opcodes_h_l1017_c7_dcaf
result_MUX_uxn_opcodes_h_l1017_c7_dcaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1017_c7_dcaf_cond,
result_MUX_uxn_opcodes_h_l1017_c7_dcaf_iftrue,
result_MUX_uxn_opcodes_h_l1017_c7_dcaf_iffalse,
result_MUX_uxn_opcodes_h_l1017_c7_dcaf_return_output);

-- opc_rot2_uxn_opcodes_h_l1017_c39_191b
opc_rot2_uxn_opcodes_h_l1017_c39_191b : entity work.opc_rot2_0CLK_ae51d40b port map (
clk,
opc_rot2_uxn_opcodes_h_l1017_c39_191b_CLOCK_ENABLE,
opc_rot2_uxn_opcodes_h_l1017_c39_191b_stack_index,
opc_rot2_uxn_opcodes_h_l1017_c39_191b_ins,
opc_rot2_uxn_opcodes_h_l1017_c39_191b_k,
opc_rot2_uxn_opcodes_h_l1017_c39_191b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_left,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_right,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_return_output);

-- result_MUX_uxn_opcodes_h_l1018_c7_a1e6
result_MUX_uxn_opcodes_h_l1018_c7_a1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1018_c7_a1e6_cond,
result_MUX_uxn_opcodes_h_l1018_c7_a1e6_iftrue,
result_MUX_uxn_opcodes_h_l1018_c7_a1e6_iffalse,
result_MUX_uxn_opcodes_h_l1018_c7_a1e6_return_output);

-- opc_dup_uxn_opcodes_h_l1018_c39_970e
opc_dup_uxn_opcodes_h_l1018_c39_970e : entity work.opc_dup_0CLK_908f9b38 port map (
clk,
opc_dup_uxn_opcodes_h_l1018_c39_970e_CLOCK_ENABLE,
opc_dup_uxn_opcodes_h_l1018_c39_970e_stack_index,
opc_dup_uxn_opcodes_h_l1018_c39_970e_ins,
opc_dup_uxn_opcodes_h_l1018_c39_970e_k,
opc_dup_uxn_opcodes_h_l1018_c39_970e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_left,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_right,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_return_output);

-- result_MUX_uxn_opcodes_h_l1019_c7_7f82
result_MUX_uxn_opcodes_h_l1019_c7_7f82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1019_c7_7f82_cond,
result_MUX_uxn_opcodes_h_l1019_c7_7f82_iftrue,
result_MUX_uxn_opcodes_h_l1019_c7_7f82_iffalse,
result_MUX_uxn_opcodes_h_l1019_c7_7f82_return_output);

-- opc_dup2_uxn_opcodes_h_l1019_c39_1bd0
opc_dup2_uxn_opcodes_h_l1019_c39_1bd0 : entity work.opc_dup2_0CLK_21524061 port map (
clk,
opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_CLOCK_ENABLE,
opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_stack_index,
opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_ins,
opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_k,
opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_left,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_right,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_return_output);

-- result_MUX_uxn_opcodes_h_l1020_c7_fed0
result_MUX_uxn_opcodes_h_l1020_c7_fed0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1020_c7_fed0_cond,
result_MUX_uxn_opcodes_h_l1020_c7_fed0_iftrue,
result_MUX_uxn_opcodes_h_l1020_c7_fed0_iffalse,
result_MUX_uxn_opcodes_h_l1020_c7_fed0_return_output);

-- opc_ovr_uxn_opcodes_h_l1020_c39_57a1
opc_ovr_uxn_opcodes_h_l1020_c39_57a1 : entity work.opc_ovr_0CLK_673d166e port map (
clk,
opc_ovr_uxn_opcodes_h_l1020_c39_57a1_CLOCK_ENABLE,
opc_ovr_uxn_opcodes_h_l1020_c39_57a1_stack_index,
opc_ovr_uxn_opcodes_h_l1020_c39_57a1_ins,
opc_ovr_uxn_opcodes_h_l1020_c39_57a1_k,
opc_ovr_uxn_opcodes_h_l1020_c39_57a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_return_output);

-- result_MUX_uxn_opcodes_h_l1021_c7_48ee
result_MUX_uxn_opcodes_h_l1021_c7_48ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1021_c7_48ee_cond,
result_MUX_uxn_opcodes_h_l1021_c7_48ee_iftrue,
result_MUX_uxn_opcodes_h_l1021_c7_48ee_iffalse,
result_MUX_uxn_opcodes_h_l1021_c7_48ee_return_output);

-- opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e
opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e : entity work.opc_ovr2_0CLK_2ea0cacc port map (
clk,
opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_CLOCK_ENABLE,
opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_stack_index,
opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_ins,
opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_k,
opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_left,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_right,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_return_output);

-- result_MUX_uxn_opcodes_h_l1022_c7_0224
result_MUX_uxn_opcodes_h_l1022_c7_0224 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1022_c7_0224_cond,
result_MUX_uxn_opcodes_h_l1022_c7_0224_iftrue,
result_MUX_uxn_opcodes_h_l1022_c7_0224_iffalse,
result_MUX_uxn_opcodes_h_l1022_c7_0224_return_output);

-- opc_equ_uxn_opcodes_h_l1022_c39_435f
opc_equ_uxn_opcodes_h_l1022_c39_435f : entity work.opc_equ_0CLK_c1e3bf98 port map (
clk,
opc_equ_uxn_opcodes_h_l1022_c39_435f_CLOCK_ENABLE,
opc_equ_uxn_opcodes_h_l1022_c39_435f_stack_index,
opc_equ_uxn_opcodes_h_l1022_c39_435f_ins,
opc_equ_uxn_opcodes_h_l1022_c39_435f_k,
opc_equ_uxn_opcodes_h_l1022_c39_435f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_return_output);

-- result_MUX_uxn_opcodes_h_l1023_c7_3e0c
result_MUX_uxn_opcodes_h_l1023_c7_3e0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1023_c7_3e0c_cond,
result_MUX_uxn_opcodes_h_l1023_c7_3e0c_iftrue,
result_MUX_uxn_opcodes_h_l1023_c7_3e0c_iffalse,
result_MUX_uxn_opcodes_h_l1023_c7_3e0c_return_output);

-- opc_equ2_uxn_opcodes_h_l1023_c39_31ce
opc_equ2_uxn_opcodes_h_l1023_c39_31ce : entity work.opc_equ2_0CLK_684a88a9 port map (
clk,
opc_equ2_uxn_opcodes_h_l1023_c39_31ce_CLOCK_ENABLE,
opc_equ2_uxn_opcodes_h_l1023_c39_31ce_stack_index,
opc_equ2_uxn_opcodes_h_l1023_c39_31ce_ins,
opc_equ2_uxn_opcodes_h_l1023_c39_31ce_k,
opc_equ2_uxn_opcodes_h_l1023_c39_31ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_left,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_right,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_return_output);

-- result_MUX_uxn_opcodes_h_l1024_c7_64ab
result_MUX_uxn_opcodes_h_l1024_c7_64ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1024_c7_64ab_cond,
result_MUX_uxn_opcodes_h_l1024_c7_64ab_iftrue,
result_MUX_uxn_opcodes_h_l1024_c7_64ab_iffalse,
result_MUX_uxn_opcodes_h_l1024_c7_64ab_return_output);

-- opc_neq_uxn_opcodes_h_l1024_c39_1e84
opc_neq_uxn_opcodes_h_l1024_c39_1e84 : entity work.opc_neq_0CLK_c1e3bf98 port map (
clk,
opc_neq_uxn_opcodes_h_l1024_c39_1e84_CLOCK_ENABLE,
opc_neq_uxn_opcodes_h_l1024_c39_1e84_stack_index,
opc_neq_uxn_opcodes_h_l1024_c39_1e84_ins,
opc_neq_uxn_opcodes_h_l1024_c39_1e84_k,
opc_neq_uxn_opcodes_h_l1024_c39_1e84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_left,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_right,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_return_output);

-- result_MUX_uxn_opcodes_h_l1025_c7_12f4
result_MUX_uxn_opcodes_h_l1025_c7_12f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1025_c7_12f4_cond,
result_MUX_uxn_opcodes_h_l1025_c7_12f4_iftrue,
result_MUX_uxn_opcodes_h_l1025_c7_12f4_iffalse,
result_MUX_uxn_opcodes_h_l1025_c7_12f4_return_output);

-- opc_neq2_uxn_opcodes_h_l1025_c39_e321
opc_neq2_uxn_opcodes_h_l1025_c39_e321 : entity work.opc_neq2_0CLK_684a88a9 port map (
clk,
opc_neq2_uxn_opcodes_h_l1025_c39_e321_CLOCK_ENABLE,
opc_neq2_uxn_opcodes_h_l1025_c39_e321_stack_index,
opc_neq2_uxn_opcodes_h_l1025_c39_e321_ins,
opc_neq2_uxn_opcodes_h_l1025_c39_e321_k,
opc_neq2_uxn_opcodes_h_l1025_c39_e321_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_left,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_right,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_return_output);

-- result_MUX_uxn_opcodes_h_l1026_c7_78e8
result_MUX_uxn_opcodes_h_l1026_c7_78e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1026_c7_78e8_cond,
result_MUX_uxn_opcodes_h_l1026_c7_78e8_iftrue,
result_MUX_uxn_opcodes_h_l1026_c7_78e8_iffalse,
result_MUX_uxn_opcodes_h_l1026_c7_78e8_return_output);

-- opc_gth_uxn_opcodes_h_l1026_c39_09d0
opc_gth_uxn_opcodes_h_l1026_c39_09d0 : entity work.opc_gth_0CLK_c1e3bf98 port map (
clk,
opc_gth_uxn_opcodes_h_l1026_c39_09d0_CLOCK_ENABLE,
opc_gth_uxn_opcodes_h_l1026_c39_09d0_stack_index,
opc_gth_uxn_opcodes_h_l1026_c39_09d0_ins,
opc_gth_uxn_opcodes_h_l1026_c39_09d0_k,
opc_gth_uxn_opcodes_h_l1026_c39_09d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_left,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_right,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_return_output);

-- result_MUX_uxn_opcodes_h_l1027_c7_5bd6
result_MUX_uxn_opcodes_h_l1027_c7_5bd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1027_c7_5bd6_cond,
result_MUX_uxn_opcodes_h_l1027_c7_5bd6_iftrue,
result_MUX_uxn_opcodes_h_l1027_c7_5bd6_iffalse,
result_MUX_uxn_opcodes_h_l1027_c7_5bd6_return_output);

-- opc_gth2_uxn_opcodes_h_l1027_c39_1cc0
opc_gth2_uxn_opcodes_h_l1027_c39_1cc0 : entity work.opc_gth2_0CLK_684a88a9 port map (
clk,
opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_CLOCK_ENABLE,
opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_stack_index,
opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_ins,
opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_k,
opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_left,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_right,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_return_output);

-- result_MUX_uxn_opcodes_h_l1028_c7_bee8
result_MUX_uxn_opcodes_h_l1028_c7_bee8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1028_c7_bee8_cond,
result_MUX_uxn_opcodes_h_l1028_c7_bee8_iftrue,
result_MUX_uxn_opcodes_h_l1028_c7_bee8_iffalse,
result_MUX_uxn_opcodes_h_l1028_c7_bee8_return_output);

-- opc_lth_uxn_opcodes_h_l1028_c39_de13
opc_lth_uxn_opcodes_h_l1028_c39_de13 : entity work.opc_lth_0CLK_c1e3bf98 port map (
clk,
opc_lth_uxn_opcodes_h_l1028_c39_de13_CLOCK_ENABLE,
opc_lth_uxn_opcodes_h_l1028_c39_de13_stack_index,
opc_lth_uxn_opcodes_h_l1028_c39_de13_ins,
opc_lth_uxn_opcodes_h_l1028_c39_de13_k,
opc_lth_uxn_opcodes_h_l1028_c39_de13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_left,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_right,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_return_output);

-- result_MUX_uxn_opcodes_h_l1029_c7_7790
result_MUX_uxn_opcodes_h_l1029_c7_7790 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1029_c7_7790_cond,
result_MUX_uxn_opcodes_h_l1029_c7_7790_iftrue,
result_MUX_uxn_opcodes_h_l1029_c7_7790_iffalse,
result_MUX_uxn_opcodes_h_l1029_c7_7790_return_output);

-- opc_lth2_uxn_opcodes_h_l1029_c39_cfff
opc_lth2_uxn_opcodes_h_l1029_c39_cfff : entity work.opc_lth2_0CLK_684a88a9 port map (
clk,
opc_lth2_uxn_opcodes_h_l1029_c39_cfff_CLOCK_ENABLE,
opc_lth2_uxn_opcodes_h_l1029_c39_cfff_stack_index,
opc_lth2_uxn_opcodes_h_l1029_c39_cfff_ins,
opc_lth2_uxn_opcodes_h_l1029_c39_cfff_k,
opc_lth2_uxn_opcodes_h_l1029_c39_cfff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_left,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_right,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_return_output);

-- result_MUX_uxn_opcodes_h_l1030_c7_6654
result_MUX_uxn_opcodes_h_l1030_c7_6654 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1030_c7_6654_cond,
result_MUX_uxn_opcodes_h_l1030_c7_6654_iftrue,
result_MUX_uxn_opcodes_h_l1030_c7_6654_iffalse,
result_MUX_uxn_opcodes_h_l1030_c7_6654_return_output);

-- opc_jmp_uxn_opcodes_h_l1030_c39_7910
opc_jmp_uxn_opcodes_h_l1030_c39_7910 : entity work.opc_jmp_0CLK_cdb1f341 port map (
clk,
opc_jmp_uxn_opcodes_h_l1030_c39_7910_CLOCK_ENABLE,
opc_jmp_uxn_opcodes_h_l1030_c39_7910_stack_index,
opc_jmp_uxn_opcodes_h_l1030_c39_7910_ins,
opc_jmp_uxn_opcodes_h_l1030_c39_7910_k,
opc_jmp_uxn_opcodes_h_l1030_c39_7910_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_left,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_right,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_return_output);

-- result_MUX_uxn_opcodes_h_l1031_c7_503a
result_MUX_uxn_opcodes_h_l1031_c7_503a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1031_c7_503a_cond,
result_MUX_uxn_opcodes_h_l1031_c7_503a_iftrue,
result_MUX_uxn_opcodes_h_l1031_c7_503a_iffalse,
result_MUX_uxn_opcodes_h_l1031_c7_503a_return_output);

-- opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb
opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb : entity work.opc_jmp2_0CLK_9f354cb5 port map (
clk,
opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_CLOCK_ENABLE,
opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_stack_index,
opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_ins,
opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_k,
opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_left,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_right,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_return_output);

-- result_MUX_uxn_opcodes_h_l1032_c7_aac0
result_MUX_uxn_opcodes_h_l1032_c7_aac0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1032_c7_aac0_cond,
result_MUX_uxn_opcodes_h_l1032_c7_aac0_iftrue,
result_MUX_uxn_opcodes_h_l1032_c7_aac0_iffalse,
result_MUX_uxn_opcodes_h_l1032_c7_aac0_return_output);

-- opc_jcn_uxn_opcodes_h_l1032_c39_d4ae
opc_jcn_uxn_opcodes_h_l1032_c39_d4ae : entity work.opc_jcn_0CLK_cd4fa2e1 port map (
clk,
opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_CLOCK_ENABLE,
opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_stack_index,
opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_ins,
opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_k,
opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_left,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_right,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_return_output);

-- result_MUX_uxn_opcodes_h_l1033_c7_fd73
result_MUX_uxn_opcodes_h_l1033_c7_fd73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1033_c7_fd73_cond,
result_MUX_uxn_opcodes_h_l1033_c7_fd73_iftrue,
result_MUX_uxn_opcodes_h_l1033_c7_fd73_iffalse,
result_MUX_uxn_opcodes_h_l1033_c7_fd73_return_output);

-- opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d
opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d : entity work.opc_jcn2_0CLK_e549db80 port map (
clk,
opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_CLOCK_ENABLE,
opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_stack_index,
opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_ins,
opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_k,
opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_left,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_right,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_return_output);

-- result_MUX_uxn_opcodes_h_l1034_c7_9bd9
result_MUX_uxn_opcodes_h_l1034_c7_9bd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1034_c7_9bd9_cond,
result_MUX_uxn_opcodes_h_l1034_c7_9bd9_iftrue,
result_MUX_uxn_opcodes_h_l1034_c7_9bd9_iffalse,
result_MUX_uxn_opcodes_h_l1034_c7_9bd9_return_output);

-- opc_jsr_uxn_opcodes_h_l1034_c39_e8d9
opc_jsr_uxn_opcodes_h_l1034_c39_e8d9 : entity work.opc_jsr_0CLK_f400e5c5 port map (
clk,
opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_CLOCK_ENABLE,
opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_stack_index,
opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_ins,
opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_k,
opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_left,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_right,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_return_output);

-- result_MUX_uxn_opcodes_h_l1035_c7_14fa
result_MUX_uxn_opcodes_h_l1035_c7_14fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1035_c7_14fa_cond,
result_MUX_uxn_opcodes_h_l1035_c7_14fa_iftrue,
result_MUX_uxn_opcodes_h_l1035_c7_14fa_iffalse,
result_MUX_uxn_opcodes_h_l1035_c7_14fa_return_output);

-- opc_jsr2_uxn_opcodes_h_l1035_c39_2238
opc_jsr2_uxn_opcodes_h_l1035_c39_2238 : entity work.opc_jsr2_0CLK_d1618179 port map (
clk,
opc_jsr2_uxn_opcodes_h_l1035_c39_2238_CLOCK_ENABLE,
opc_jsr2_uxn_opcodes_h_l1035_c39_2238_stack_index,
opc_jsr2_uxn_opcodes_h_l1035_c39_2238_ins,
opc_jsr2_uxn_opcodes_h_l1035_c39_2238_k,
opc_jsr2_uxn_opcodes_h_l1035_c39_2238_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_left,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_right,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_return_output);

-- result_MUX_uxn_opcodes_h_l1036_c7_1dcb
result_MUX_uxn_opcodes_h_l1036_c7_1dcb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1036_c7_1dcb_cond,
result_MUX_uxn_opcodes_h_l1036_c7_1dcb_iftrue,
result_MUX_uxn_opcodes_h_l1036_c7_1dcb_iffalse,
result_MUX_uxn_opcodes_h_l1036_c7_1dcb_return_output);

-- opc_sth_uxn_opcodes_h_l1036_c39_de58
opc_sth_uxn_opcodes_h_l1036_c39_de58 : entity work.opc_sth_0CLK_40fc940d port map (
clk,
opc_sth_uxn_opcodes_h_l1036_c39_de58_CLOCK_ENABLE,
opc_sth_uxn_opcodes_h_l1036_c39_de58_stack_index,
opc_sth_uxn_opcodes_h_l1036_c39_de58_ins,
opc_sth_uxn_opcodes_h_l1036_c39_de58_k,
opc_sth_uxn_opcodes_h_l1036_c39_de58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_left,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_right,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_return_output);

-- result_MUX_uxn_opcodes_h_l1037_c7_bc14
result_MUX_uxn_opcodes_h_l1037_c7_bc14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1037_c7_bc14_cond,
result_MUX_uxn_opcodes_h_l1037_c7_bc14_iftrue,
result_MUX_uxn_opcodes_h_l1037_c7_bc14_iffalse,
result_MUX_uxn_opcodes_h_l1037_c7_bc14_return_output);

-- opc_sth2_uxn_opcodes_h_l1037_c39_8a61
opc_sth2_uxn_opcodes_h_l1037_c39_8a61 : entity work.opc_sth2_0CLK_f0bb6b87 port map (
clk,
opc_sth2_uxn_opcodes_h_l1037_c39_8a61_CLOCK_ENABLE,
opc_sth2_uxn_opcodes_h_l1037_c39_8a61_stack_index,
opc_sth2_uxn_opcodes_h_l1037_c39_8a61_ins,
opc_sth2_uxn_opcodes_h_l1037_c39_8a61_k,
opc_sth2_uxn_opcodes_h_l1037_c39_8a61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_left,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_right,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_return_output);

-- result_MUX_uxn_opcodes_h_l1038_c7_a3f0
result_MUX_uxn_opcodes_h_l1038_c7_a3f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1038_c7_a3f0_cond,
result_MUX_uxn_opcodes_h_l1038_c7_a3f0_iftrue,
result_MUX_uxn_opcodes_h_l1038_c7_a3f0_iffalse,
result_MUX_uxn_opcodes_h_l1038_c7_a3f0_return_output);

-- opc_ldz_uxn_opcodes_h_l1038_c39_063f
opc_ldz_uxn_opcodes_h_l1038_c39_063f : entity work.opc_ldz_0CLK_03fba68a port map (
clk,
opc_ldz_uxn_opcodes_h_l1038_c39_063f_CLOCK_ENABLE,
opc_ldz_uxn_opcodes_h_l1038_c39_063f_stack_index,
opc_ldz_uxn_opcodes_h_l1038_c39_063f_ins,
opc_ldz_uxn_opcodes_h_l1038_c39_063f_k,
opc_ldz_uxn_opcodes_h_l1038_c39_063f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_left,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_right,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_return_output);

-- result_MUX_uxn_opcodes_h_l1039_c7_fbd1
result_MUX_uxn_opcodes_h_l1039_c7_fbd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1039_c7_fbd1_cond,
result_MUX_uxn_opcodes_h_l1039_c7_fbd1_iftrue,
result_MUX_uxn_opcodes_h_l1039_c7_fbd1_iffalse,
result_MUX_uxn_opcodes_h_l1039_c7_fbd1_return_output);

-- opc_ldz2_uxn_opcodes_h_l1039_c39_bd81
opc_ldz2_uxn_opcodes_h_l1039_c39_bd81 : entity work.opc_ldz2_0CLK_e4eccf8d port map (
clk,
opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_CLOCK_ENABLE,
opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_stack_index,
opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_ins,
opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_k,
opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_left,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_right,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_return_output);

-- result_MUX_uxn_opcodes_h_l1040_c7_2e9a
result_MUX_uxn_opcodes_h_l1040_c7_2e9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1040_c7_2e9a_cond,
result_MUX_uxn_opcodes_h_l1040_c7_2e9a_iftrue,
result_MUX_uxn_opcodes_h_l1040_c7_2e9a_iffalse,
result_MUX_uxn_opcodes_h_l1040_c7_2e9a_return_output);

-- opc_stz_uxn_opcodes_h_l1040_c39_37e9
opc_stz_uxn_opcodes_h_l1040_c39_37e9 : entity work.opc_stz_0CLK_bd9499a8 port map (
clk,
opc_stz_uxn_opcodes_h_l1040_c39_37e9_CLOCK_ENABLE,
opc_stz_uxn_opcodes_h_l1040_c39_37e9_stack_index,
opc_stz_uxn_opcodes_h_l1040_c39_37e9_ins,
opc_stz_uxn_opcodes_h_l1040_c39_37e9_k,
opc_stz_uxn_opcodes_h_l1040_c39_37e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_left,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_right,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_return_output);

-- result_MUX_uxn_opcodes_h_l1041_c7_6f18
result_MUX_uxn_opcodes_h_l1041_c7_6f18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1041_c7_6f18_cond,
result_MUX_uxn_opcodes_h_l1041_c7_6f18_iftrue,
result_MUX_uxn_opcodes_h_l1041_c7_6f18_iffalse,
result_MUX_uxn_opcodes_h_l1041_c7_6f18_return_output);

-- opc_stz2_uxn_opcodes_h_l1041_c39_26f2
opc_stz2_uxn_opcodes_h_l1041_c39_26f2 : entity work.opc_stz2_0CLK_48a066f5 port map (
clk,
opc_stz2_uxn_opcodes_h_l1041_c39_26f2_CLOCK_ENABLE,
opc_stz2_uxn_opcodes_h_l1041_c39_26f2_stack_index,
opc_stz2_uxn_opcodes_h_l1041_c39_26f2_ins,
opc_stz2_uxn_opcodes_h_l1041_c39_26f2_k,
opc_stz2_uxn_opcodes_h_l1041_c39_26f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_left,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_right,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_return_output);

-- result_MUX_uxn_opcodes_h_l1042_c7_4e20
result_MUX_uxn_opcodes_h_l1042_c7_4e20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1042_c7_4e20_cond,
result_MUX_uxn_opcodes_h_l1042_c7_4e20_iftrue,
result_MUX_uxn_opcodes_h_l1042_c7_4e20_iffalse,
result_MUX_uxn_opcodes_h_l1042_c7_4e20_return_output);

-- opc_ldr_uxn_opcodes_h_l1042_c39_f212
opc_ldr_uxn_opcodes_h_l1042_c39_f212 : entity work.opc_ldr_0CLK_c7765de7 port map (
clk,
opc_ldr_uxn_opcodes_h_l1042_c39_f212_CLOCK_ENABLE,
opc_ldr_uxn_opcodes_h_l1042_c39_f212_stack_index,
opc_ldr_uxn_opcodes_h_l1042_c39_f212_ins,
opc_ldr_uxn_opcodes_h_l1042_c39_f212_k,
opc_ldr_uxn_opcodes_h_l1042_c39_f212_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_left,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_right,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_return_output);

-- result_MUX_uxn_opcodes_h_l1043_c7_d00f
result_MUX_uxn_opcodes_h_l1043_c7_d00f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1043_c7_d00f_cond,
result_MUX_uxn_opcodes_h_l1043_c7_d00f_iftrue,
result_MUX_uxn_opcodes_h_l1043_c7_d00f_iffalse,
result_MUX_uxn_opcodes_h_l1043_c7_d00f_return_output);

-- opc_ldr2_uxn_opcodes_h_l1043_c39_3860
opc_ldr2_uxn_opcodes_h_l1043_c39_3860 : entity work.opc_ldr2_0CLK_c22e6928 port map (
clk,
opc_ldr2_uxn_opcodes_h_l1043_c39_3860_CLOCK_ENABLE,
opc_ldr2_uxn_opcodes_h_l1043_c39_3860_stack_index,
opc_ldr2_uxn_opcodes_h_l1043_c39_3860_ins,
opc_ldr2_uxn_opcodes_h_l1043_c39_3860_k,
opc_ldr2_uxn_opcodes_h_l1043_c39_3860_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_left,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_right,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_return_output);

-- result_MUX_uxn_opcodes_h_l1044_c7_d6be
result_MUX_uxn_opcodes_h_l1044_c7_d6be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1044_c7_d6be_cond,
result_MUX_uxn_opcodes_h_l1044_c7_d6be_iftrue,
result_MUX_uxn_opcodes_h_l1044_c7_d6be_iffalse,
result_MUX_uxn_opcodes_h_l1044_c7_d6be_return_output);

-- opc_str_uxn_opcodes_h_l1044_c39_bab8
opc_str_uxn_opcodes_h_l1044_c39_bab8 : entity work.opc_str_0CLK_9a0153e3 port map (
clk,
opc_str_uxn_opcodes_h_l1044_c39_bab8_CLOCK_ENABLE,
opc_str_uxn_opcodes_h_l1044_c39_bab8_stack_index,
opc_str_uxn_opcodes_h_l1044_c39_bab8_ins,
opc_str_uxn_opcodes_h_l1044_c39_bab8_k,
opc_str_uxn_opcodes_h_l1044_c39_bab8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_return_output);

-- result_MUX_uxn_opcodes_h_l1045_c7_6655
result_MUX_uxn_opcodes_h_l1045_c7_6655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1045_c7_6655_cond,
result_MUX_uxn_opcodes_h_l1045_c7_6655_iftrue,
result_MUX_uxn_opcodes_h_l1045_c7_6655_iffalse,
result_MUX_uxn_opcodes_h_l1045_c7_6655_return_output);

-- opc_str2_uxn_opcodes_h_l1045_c39_dfaa
opc_str2_uxn_opcodes_h_l1045_c39_dfaa : entity work.opc_str2_0CLK_547d10ef port map (
clk,
opc_str2_uxn_opcodes_h_l1045_c39_dfaa_CLOCK_ENABLE,
opc_str2_uxn_opcodes_h_l1045_c39_dfaa_stack_index,
opc_str2_uxn_opcodes_h_l1045_c39_dfaa_ins,
opc_str2_uxn_opcodes_h_l1045_c39_dfaa_k,
opc_str2_uxn_opcodes_h_l1045_c39_dfaa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_left,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_right,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_return_output);

-- result_MUX_uxn_opcodes_h_l1046_c7_f181
result_MUX_uxn_opcodes_h_l1046_c7_f181 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1046_c7_f181_cond,
result_MUX_uxn_opcodes_h_l1046_c7_f181_iftrue,
result_MUX_uxn_opcodes_h_l1046_c7_f181_iffalse,
result_MUX_uxn_opcodes_h_l1046_c7_f181_return_output);

-- opc_lda_uxn_opcodes_h_l1046_c39_f8fa
opc_lda_uxn_opcodes_h_l1046_c39_f8fa : entity work.opc_lda_0CLK_a0a93af0 port map (
clk,
opc_lda_uxn_opcodes_h_l1046_c39_f8fa_CLOCK_ENABLE,
opc_lda_uxn_opcodes_h_l1046_c39_f8fa_stack_index,
opc_lda_uxn_opcodes_h_l1046_c39_f8fa_ins,
opc_lda_uxn_opcodes_h_l1046_c39_f8fa_k,
opc_lda_uxn_opcodes_h_l1046_c39_f8fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_left,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_right,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_return_output);

-- result_MUX_uxn_opcodes_h_l1047_c7_1eda
result_MUX_uxn_opcodes_h_l1047_c7_1eda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1047_c7_1eda_cond,
result_MUX_uxn_opcodes_h_l1047_c7_1eda_iftrue,
result_MUX_uxn_opcodes_h_l1047_c7_1eda_iffalse,
result_MUX_uxn_opcodes_h_l1047_c7_1eda_return_output);

-- opc_lda2_uxn_opcodes_h_l1047_c39_c237
opc_lda2_uxn_opcodes_h_l1047_c39_c237 : entity work.opc_lda2_0CLK_a0a93af0 port map (
clk,
opc_lda2_uxn_opcodes_h_l1047_c39_c237_CLOCK_ENABLE,
opc_lda2_uxn_opcodes_h_l1047_c39_c237_stack_index,
opc_lda2_uxn_opcodes_h_l1047_c39_c237_ins,
opc_lda2_uxn_opcodes_h_l1047_c39_c237_k,
opc_lda2_uxn_opcodes_h_l1047_c39_c237_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_left,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_right,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_return_output);

-- result_MUX_uxn_opcodes_h_l1048_c7_4547
result_MUX_uxn_opcodes_h_l1048_c7_4547 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1048_c7_4547_cond,
result_MUX_uxn_opcodes_h_l1048_c7_4547_iftrue,
result_MUX_uxn_opcodes_h_l1048_c7_4547_iffalse,
result_MUX_uxn_opcodes_h_l1048_c7_4547_return_output);

-- opc_sta_uxn_opcodes_h_l1048_c39_eb13
opc_sta_uxn_opcodes_h_l1048_c39_eb13 : entity work.opc_sta_0CLK_3009eef4 port map (
clk,
opc_sta_uxn_opcodes_h_l1048_c39_eb13_CLOCK_ENABLE,
opc_sta_uxn_opcodes_h_l1048_c39_eb13_stack_index,
opc_sta_uxn_opcodes_h_l1048_c39_eb13_ins,
opc_sta_uxn_opcodes_h_l1048_c39_eb13_k,
opc_sta_uxn_opcodes_h_l1048_c39_eb13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_left,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_right,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_return_output);

-- result_MUX_uxn_opcodes_h_l1049_c7_ef51
result_MUX_uxn_opcodes_h_l1049_c7_ef51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1049_c7_ef51_cond,
result_MUX_uxn_opcodes_h_l1049_c7_ef51_iftrue,
result_MUX_uxn_opcodes_h_l1049_c7_ef51_iffalse,
result_MUX_uxn_opcodes_h_l1049_c7_ef51_return_output);

-- opc_sta2_uxn_opcodes_h_l1049_c39_595f
opc_sta2_uxn_opcodes_h_l1049_c39_595f : entity work.opc_sta2_0CLK_2d6e9de2 port map (
clk,
opc_sta2_uxn_opcodes_h_l1049_c39_595f_CLOCK_ENABLE,
opc_sta2_uxn_opcodes_h_l1049_c39_595f_stack_index,
opc_sta2_uxn_opcodes_h_l1049_c39_595f_ins,
opc_sta2_uxn_opcodes_h_l1049_c39_595f_k,
opc_sta2_uxn_opcodes_h_l1049_c39_595f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_return_output);

-- result_MUX_uxn_opcodes_h_l1050_c7_5874
result_MUX_uxn_opcodes_h_l1050_c7_5874 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1050_c7_5874_cond,
result_MUX_uxn_opcodes_h_l1050_c7_5874_iftrue,
result_MUX_uxn_opcodes_h_l1050_c7_5874_iffalse,
result_MUX_uxn_opcodes_h_l1050_c7_5874_return_output);

-- opc_dei_uxn_opcodes_h_l1050_c39_4132
opc_dei_uxn_opcodes_h_l1050_c39_4132 : entity work.opc_dei_0CLK_eb748efe port map (
clk,
opc_dei_uxn_opcodes_h_l1050_c39_4132_CLOCK_ENABLE,
opc_dei_uxn_opcodes_h_l1050_c39_4132_stack_index,
opc_dei_uxn_opcodes_h_l1050_c39_4132_ins,
opc_dei_uxn_opcodes_h_l1050_c39_4132_k,
opc_dei_uxn_opcodes_h_l1050_c39_4132_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_left,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_right,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_return_output);

-- result_MUX_uxn_opcodes_h_l1051_c7_ca7b
result_MUX_uxn_opcodes_h_l1051_c7_ca7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1051_c7_ca7b_cond,
result_MUX_uxn_opcodes_h_l1051_c7_ca7b_iftrue,
result_MUX_uxn_opcodes_h_l1051_c7_ca7b_iffalse,
result_MUX_uxn_opcodes_h_l1051_c7_ca7b_return_output);

-- opc_dei2_uxn_opcodes_h_l1051_c39_89d8
opc_dei2_uxn_opcodes_h_l1051_c39_89d8 : entity work.opc_dei2_0CLK_f9ff42a4 port map (
clk,
opc_dei2_uxn_opcodes_h_l1051_c39_89d8_CLOCK_ENABLE,
opc_dei2_uxn_opcodes_h_l1051_c39_89d8_stack_index,
opc_dei2_uxn_opcodes_h_l1051_c39_89d8_ins,
opc_dei2_uxn_opcodes_h_l1051_c39_89d8_k,
opc_dei2_uxn_opcodes_h_l1051_c39_89d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_left,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_right,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_return_output);

-- result_MUX_uxn_opcodes_h_l1052_c7_592e
result_MUX_uxn_opcodes_h_l1052_c7_592e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1052_c7_592e_cond,
result_MUX_uxn_opcodes_h_l1052_c7_592e_iftrue,
result_MUX_uxn_opcodes_h_l1052_c7_592e_iffalse,
result_MUX_uxn_opcodes_h_l1052_c7_592e_return_output);

-- opc_deo_uxn_opcodes_h_l1052_c39_817e
opc_deo_uxn_opcodes_h_l1052_c39_817e : entity work.opc_deo_0CLK_7e6b2bc4 port map (
clk,
opc_deo_uxn_opcodes_h_l1052_c39_817e_CLOCK_ENABLE,
opc_deo_uxn_opcodes_h_l1052_c39_817e_stack_index,
opc_deo_uxn_opcodes_h_l1052_c39_817e_ins,
opc_deo_uxn_opcodes_h_l1052_c39_817e_k,
opc_deo_uxn_opcodes_h_l1052_c39_817e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_left,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_right,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_return_output);

-- result_MUX_uxn_opcodes_h_l1053_c7_e2a2
result_MUX_uxn_opcodes_h_l1053_c7_e2a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1053_c7_e2a2_cond,
result_MUX_uxn_opcodes_h_l1053_c7_e2a2_iftrue,
result_MUX_uxn_opcodes_h_l1053_c7_e2a2_iffalse,
result_MUX_uxn_opcodes_h_l1053_c7_e2a2_return_output);

-- opc_deo2_uxn_opcodes_h_l1053_c39_d9c5
opc_deo2_uxn_opcodes_h_l1053_c39_d9c5 : entity work.opc_deo2_0CLK_2d08c99d port map (
clk,
opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_CLOCK_ENABLE,
opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_stack_index,
opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_ins,
opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_k,
opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_left,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_right,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_return_output);

-- result_MUX_uxn_opcodes_h_l1054_c7_65f8
result_MUX_uxn_opcodes_h_l1054_c7_65f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1054_c7_65f8_cond,
result_MUX_uxn_opcodes_h_l1054_c7_65f8_iftrue,
result_MUX_uxn_opcodes_h_l1054_c7_65f8_iffalse,
result_MUX_uxn_opcodes_h_l1054_c7_65f8_return_output);

-- opc_add_uxn_opcodes_h_l1054_c39_5242
opc_add_uxn_opcodes_h_l1054_c39_5242 : entity work.opc_add_0CLK_e7dc975a port map (
clk,
opc_add_uxn_opcodes_h_l1054_c39_5242_CLOCK_ENABLE,
opc_add_uxn_opcodes_h_l1054_c39_5242_stack_index,
opc_add_uxn_opcodes_h_l1054_c39_5242_ins,
opc_add_uxn_opcodes_h_l1054_c39_5242_k,
opc_add_uxn_opcodes_h_l1054_c39_5242_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_return_output);

-- result_MUX_uxn_opcodes_h_l1055_c7_ddfe
result_MUX_uxn_opcodes_h_l1055_c7_ddfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1055_c7_ddfe_cond,
result_MUX_uxn_opcodes_h_l1055_c7_ddfe_iftrue,
result_MUX_uxn_opcodes_h_l1055_c7_ddfe_iffalse,
result_MUX_uxn_opcodes_h_l1055_c7_ddfe_return_output);

-- opc_add2_uxn_opcodes_h_l1055_c39_7e65
opc_add2_uxn_opcodes_h_l1055_c39_7e65 : entity work.opc_add2_0CLK_da5cf890 port map (
clk,
opc_add2_uxn_opcodes_h_l1055_c39_7e65_CLOCK_ENABLE,
opc_add2_uxn_opcodes_h_l1055_c39_7e65_stack_index,
opc_add2_uxn_opcodes_h_l1055_c39_7e65_ins,
opc_add2_uxn_opcodes_h_l1055_c39_7e65_k,
opc_add2_uxn_opcodes_h_l1055_c39_7e65_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_left,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_right,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_return_output);

-- result_MUX_uxn_opcodes_h_l1056_c7_0f6c
result_MUX_uxn_opcodes_h_l1056_c7_0f6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1056_c7_0f6c_cond,
result_MUX_uxn_opcodes_h_l1056_c7_0f6c_iftrue,
result_MUX_uxn_opcodes_h_l1056_c7_0f6c_iffalse,
result_MUX_uxn_opcodes_h_l1056_c7_0f6c_return_output);

-- opc_sub_uxn_opcodes_h_l1056_c39_c606
opc_sub_uxn_opcodes_h_l1056_c39_c606 : entity work.opc_sub_0CLK_e7dc975a port map (
clk,
opc_sub_uxn_opcodes_h_l1056_c39_c606_CLOCK_ENABLE,
opc_sub_uxn_opcodes_h_l1056_c39_c606_stack_index,
opc_sub_uxn_opcodes_h_l1056_c39_c606_ins,
opc_sub_uxn_opcodes_h_l1056_c39_c606_k,
opc_sub_uxn_opcodes_h_l1056_c39_c606_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_left,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_right,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_return_output);

-- result_MUX_uxn_opcodes_h_l1057_c7_06f5
result_MUX_uxn_opcodes_h_l1057_c7_06f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1057_c7_06f5_cond,
result_MUX_uxn_opcodes_h_l1057_c7_06f5_iftrue,
result_MUX_uxn_opcodes_h_l1057_c7_06f5_iffalse,
result_MUX_uxn_opcodes_h_l1057_c7_06f5_return_output);

-- opc_sub2_uxn_opcodes_h_l1057_c39_16bd
opc_sub2_uxn_opcodes_h_l1057_c39_16bd : entity work.opc_sub2_0CLK_da5cf890 port map (
clk,
opc_sub2_uxn_opcodes_h_l1057_c39_16bd_CLOCK_ENABLE,
opc_sub2_uxn_opcodes_h_l1057_c39_16bd_stack_index,
opc_sub2_uxn_opcodes_h_l1057_c39_16bd_ins,
opc_sub2_uxn_opcodes_h_l1057_c39_16bd_k,
opc_sub2_uxn_opcodes_h_l1057_c39_16bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_left,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_right,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_return_output);

-- result_MUX_uxn_opcodes_h_l1058_c7_20b5
result_MUX_uxn_opcodes_h_l1058_c7_20b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1058_c7_20b5_cond,
result_MUX_uxn_opcodes_h_l1058_c7_20b5_iftrue,
result_MUX_uxn_opcodes_h_l1058_c7_20b5_iffalse,
result_MUX_uxn_opcodes_h_l1058_c7_20b5_return_output);

-- opc_mul_uxn_opcodes_h_l1058_c39_b973
opc_mul_uxn_opcodes_h_l1058_c39_b973 : entity work.opc_mul_0CLK_e7dc975a port map (
clk,
opc_mul_uxn_opcodes_h_l1058_c39_b973_CLOCK_ENABLE,
opc_mul_uxn_opcodes_h_l1058_c39_b973_stack_index,
opc_mul_uxn_opcodes_h_l1058_c39_b973_ins,
opc_mul_uxn_opcodes_h_l1058_c39_b973_k,
opc_mul_uxn_opcodes_h_l1058_c39_b973_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_left,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_right,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_return_output);

-- result_MUX_uxn_opcodes_h_l1059_c7_936c
result_MUX_uxn_opcodes_h_l1059_c7_936c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1059_c7_936c_cond,
result_MUX_uxn_opcodes_h_l1059_c7_936c_iftrue,
result_MUX_uxn_opcodes_h_l1059_c7_936c_iffalse,
result_MUX_uxn_opcodes_h_l1059_c7_936c_return_output);

-- opc_mul2_uxn_opcodes_h_l1059_c39_ff2a
opc_mul2_uxn_opcodes_h_l1059_c39_ff2a : entity work.opc_mul2_0CLK_da5cf890 port map (
clk,
opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_CLOCK_ENABLE,
opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_stack_index,
opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_ins,
opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_k,
opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_left,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_right,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_return_output);

-- result_MUX_uxn_opcodes_h_l1060_c7_176f
result_MUX_uxn_opcodes_h_l1060_c7_176f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1060_c7_176f_cond,
result_MUX_uxn_opcodes_h_l1060_c7_176f_iftrue,
result_MUX_uxn_opcodes_h_l1060_c7_176f_iffalse,
result_MUX_uxn_opcodes_h_l1060_c7_176f_return_output);

-- opc_div_uxn_opcodes_h_l1060_c39_71b7
opc_div_uxn_opcodes_h_l1060_c39_71b7 : entity work.opc_div_0CLK_e3da4cdb port map (
clk,
opc_div_uxn_opcodes_h_l1060_c39_71b7_CLOCK_ENABLE,
opc_div_uxn_opcodes_h_l1060_c39_71b7_stack_index,
opc_div_uxn_opcodes_h_l1060_c39_71b7_ins,
opc_div_uxn_opcodes_h_l1060_c39_71b7_k,
opc_div_uxn_opcodes_h_l1060_c39_71b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_left,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_right,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_return_output);

-- result_MUX_uxn_opcodes_h_l1061_c7_257c
result_MUX_uxn_opcodes_h_l1061_c7_257c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1061_c7_257c_cond,
result_MUX_uxn_opcodes_h_l1061_c7_257c_iftrue,
result_MUX_uxn_opcodes_h_l1061_c7_257c_iffalse,
result_MUX_uxn_opcodes_h_l1061_c7_257c_return_output);

-- opc_div2_uxn_opcodes_h_l1061_c39_610f
opc_div2_uxn_opcodes_h_l1061_c39_610f : entity work.opc_div2_0CLK_c32ac445 port map (
clk,
opc_div2_uxn_opcodes_h_l1061_c39_610f_CLOCK_ENABLE,
opc_div2_uxn_opcodes_h_l1061_c39_610f_stack_index,
opc_div2_uxn_opcodes_h_l1061_c39_610f_ins,
opc_div2_uxn_opcodes_h_l1061_c39_610f_k,
opc_div2_uxn_opcodes_h_l1061_c39_610f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_left,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_right,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_return_output);

-- result_MUX_uxn_opcodes_h_l1062_c7_eceb
result_MUX_uxn_opcodes_h_l1062_c7_eceb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1062_c7_eceb_cond,
result_MUX_uxn_opcodes_h_l1062_c7_eceb_iftrue,
result_MUX_uxn_opcodes_h_l1062_c7_eceb_iffalse,
result_MUX_uxn_opcodes_h_l1062_c7_eceb_return_output);

-- opc_and_uxn_opcodes_h_l1062_c39_7825
opc_and_uxn_opcodes_h_l1062_c39_7825 : entity work.opc_and_0CLK_e7dc975a port map (
clk,
opc_and_uxn_opcodes_h_l1062_c39_7825_CLOCK_ENABLE,
opc_and_uxn_opcodes_h_l1062_c39_7825_stack_index,
opc_and_uxn_opcodes_h_l1062_c39_7825_ins,
opc_and_uxn_opcodes_h_l1062_c39_7825_k,
opc_and_uxn_opcodes_h_l1062_c39_7825_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_return_output);

-- result_MUX_uxn_opcodes_h_l1063_c7_38f2
result_MUX_uxn_opcodes_h_l1063_c7_38f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1063_c7_38f2_cond,
result_MUX_uxn_opcodes_h_l1063_c7_38f2_iftrue,
result_MUX_uxn_opcodes_h_l1063_c7_38f2_iffalse,
result_MUX_uxn_opcodes_h_l1063_c7_38f2_return_output);

-- opc_and2_uxn_opcodes_h_l1063_c39_0978
opc_and2_uxn_opcodes_h_l1063_c39_0978 : entity work.opc_and2_0CLK_da5cf890 port map (
clk,
opc_and2_uxn_opcodes_h_l1063_c39_0978_CLOCK_ENABLE,
opc_and2_uxn_opcodes_h_l1063_c39_0978_stack_index,
opc_and2_uxn_opcodes_h_l1063_c39_0978_ins,
opc_and2_uxn_opcodes_h_l1063_c39_0978_k,
opc_and2_uxn_opcodes_h_l1063_c39_0978_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_left,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_right,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_return_output);

-- result_MUX_uxn_opcodes_h_l1064_c7_0913
result_MUX_uxn_opcodes_h_l1064_c7_0913 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1064_c7_0913_cond,
result_MUX_uxn_opcodes_h_l1064_c7_0913_iftrue,
result_MUX_uxn_opcodes_h_l1064_c7_0913_iffalse,
result_MUX_uxn_opcodes_h_l1064_c7_0913_return_output);

-- opc_ora_uxn_opcodes_h_l1064_c39_3e6d
opc_ora_uxn_opcodes_h_l1064_c39_3e6d : entity work.opc_ora_0CLK_e7dc975a port map (
clk,
opc_ora_uxn_opcodes_h_l1064_c39_3e6d_CLOCK_ENABLE,
opc_ora_uxn_opcodes_h_l1064_c39_3e6d_stack_index,
opc_ora_uxn_opcodes_h_l1064_c39_3e6d_ins,
opc_ora_uxn_opcodes_h_l1064_c39_3e6d_k,
opc_ora_uxn_opcodes_h_l1064_c39_3e6d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_left,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_right,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_return_output);

-- result_MUX_uxn_opcodes_h_l1065_c7_4972
result_MUX_uxn_opcodes_h_l1065_c7_4972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1065_c7_4972_cond,
result_MUX_uxn_opcodes_h_l1065_c7_4972_iftrue,
result_MUX_uxn_opcodes_h_l1065_c7_4972_iffalse,
result_MUX_uxn_opcodes_h_l1065_c7_4972_return_output);

-- opc_ora2_uxn_opcodes_h_l1065_c39_bc0b
opc_ora2_uxn_opcodes_h_l1065_c39_bc0b : entity work.opc_ora2_0CLK_da5cf890 port map (
clk,
opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_CLOCK_ENABLE,
opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_stack_index,
opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_ins,
opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_k,
opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_left,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_right,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_return_output);

-- result_MUX_uxn_opcodes_h_l1066_c7_37b1
result_MUX_uxn_opcodes_h_l1066_c7_37b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1066_c7_37b1_cond,
result_MUX_uxn_opcodes_h_l1066_c7_37b1_iftrue,
result_MUX_uxn_opcodes_h_l1066_c7_37b1_iffalse,
result_MUX_uxn_opcodes_h_l1066_c7_37b1_return_output);

-- opc_eor_uxn_opcodes_h_l1066_c39_0087
opc_eor_uxn_opcodes_h_l1066_c39_0087 : entity work.opc_eor_0CLK_e7dc975a port map (
clk,
opc_eor_uxn_opcodes_h_l1066_c39_0087_CLOCK_ENABLE,
opc_eor_uxn_opcodes_h_l1066_c39_0087_stack_index,
opc_eor_uxn_opcodes_h_l1066_c39_0087_ins,
opc_eor_uxn_opcodes_h_l1066_c39_0087_k,
opc_eor_uxn_opcodes_h_l1066_c39_0087_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_return_output);

-- result_MUX_uxn_opcodes_h_l1067_c7_1642
result_MUX_uxn_opcodes_h_l1067_c7_1642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1067_c7_1642_cond,
result_MUX_uxn_opcodes_h_l1067_c7_1642_iftrue,
result_MUX_uxn_opcodes_h_l1067_c7_1642_iffalse,
result_MUX_uxn_opcodes_h_l1067_c7_1642_return_output);

-- opc_eor2_uxn_opcodes_h_l1067_c39_449e
opc_eor2_uxn_opcodes_h_l1067_c39_449e : entity work.opc_eor2_0CLK_da5cf890 port map (
clk,
opc_eor2_uxn_opcodes_h_l1067_c39_449e_CLOCK_ENABLE,
opc_eor2_uxn_opcodes_h_l1067_c39_449e_stack_index,
opc_eor2_uxn_opcodes_h_l1067_c39_449e_ins,
opc_eor2_uxn_opcodes_h_l1067_c39_449e_k,
opc_eor2_uxn_opcodes_h_l1067_c39_449e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_left,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_right,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_return_output);

-- result_MUX_uxn_opcodes_h_l1068_c7_39d1
result_MUX_uxn_opcodes_h_l1068_c7_39d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1068_c7_39d1_cond,
result_MUX_uxn_opcodes_h_l1068_c7_39d1_iftrue,
result_MUX_uxn_opcodes_h_l1068_c7_39d1_iffalse,
result_MUX_uxn_opcodes_h_l1068_c7_39d1_return_output);

-- opc_sft_uxn_opcodes_h_l1068_c39_0666
opc_sft_uxn_opcodes_h_l1068_c39_0666 : entity work.opc_sft_0CLK_7ec81cd9 port map (
clk,
opc_sft_uxn_opcodes_h_l1068_c39_0666_CLOCK_ENABLE,
opc_sft_uxn_opcodes_h_l1068_c39_0666_stack_index,
opc_sft_uxn_opcodes_h_l1068_c39_0666_ins,
opc_sft_uxn_opcodes_h_l1068_c39_0666_k,
opc_sft_uxn_opcodes_h_l1068_c39_0666_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_left,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_right,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_return_output);

-- result_MUX_uxn_opcodes_h_l1069_c7_a791
result_MUX_uxn_opcodes_h_l1069_c7_a791 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1069_c7_a791_cond,
result_MUX_uxn_opcodes_h_l1069_c7_a791_iftrue,
result_MUX_uxn_opcodes_h_l1069_c7_a791_iffalse,
result_MUX_uxn_opcodes_h_l1069_c7_a791_return_output);

-- opc_sft2_uxn_opcodes_h_l1069_c39_d3ad
opc_sft2_uxn_opcodes_h_l1069_c39_d3ad : entity work.opc_sft2_0CLK_745e5a6e port map (
clk,
opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_CLOCK_ENABLE,
opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_stack_index,
opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_ins,
opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_k,
opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_return_output,
 result_MUX_uxn_opcodes_h_l1000_c2_d84a_return_output,
 opc_brk_uxn_opcodes_h_l1000_c34_7557_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_return_output,
 result_MUX_uxn_opcodes_h_l1001_c7_330c_return_output,
 opc_jci_uxn_opcodes_h_l1001_c39_748b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_return_output,
 result_MUX_uxn_opcodes_h_l1002_c7_570b_return_output,
 opc_jmi_uxn_opcodes_h_l1002_c39_2d52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_return_output,
 result_MUX_uxn_opcodes_h_l1003_c7_db9b_return_output,
 opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_return_output,
 result_MUX_uxn_opcodes_h_l1004_c7_0f5b_return_output,
 opc_lit_uxn_opcodes_h_l1004_c39_3236_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_return_output,
 result_MUX_uxn_opcodes_h_l1005_c7_d021_return_output,
 opc_lit2_uxn_opcodes_h_l1005_c39_de7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_return_output,
 result_MUX_uxn_opcodes_h_l1006_c7_1089_return_output,
 opc_litr_uxn_opcodes_h_l1006_c39_7215_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_return_output,
 result_MUX_uxn_opcodes_h_l1007_c7_35d0_return_output,
 opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_return_output,
 result_MUX_uxn_opcodes_h_l1008_c7_ec40_return_output,
 opc_inc_uxn_opcodes_h_l1008_c39_96da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_return_output,
 result_MUX_uxn_opcodes_h_l1009_c7_6cc6_return_output,
 opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_return_output,
 result_MUX_uxn_opcodes_h_l1010_c7_92e8_return_output,
 opc_pop_uxn_opcodes_h_l1010_c39_bbce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_return_output,
 result_MUX_uxn_opcodes_h_l1011_c7_e581_return_output,
 opc_pop2_uxn_opcodes_h_l1011_c39_8632_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_return_output,
 result_MUX_uxn_opcodes_h_l1012_c7_7e5e_return_output,
 opc_nip_uxn_opcodes_h_l1012_c39_f5f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_return_output,
 result_MUX_uxn_opcodes_h_l1013_c7_2181_return_output,
 opc_nip2_uxn_opcodes_h_l1013_c39_9591_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_return_output,
 result_MUX_uxn_opcodes_h_l1014_c7_039d_return_output,
 opc_swp_uxn_opcodes_h_l1014_c39_4c9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_return_output,
 result_MUX_uxn_opcodes_h_l1015_c7_c848_return_output,
 opc_swp2_uxn_opcodes_h_l1015_c39_fe14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_return_output,
 result_MUX_uxn_opcodes_h_l1016_c7_15d0_return_output,
 opc_rot_uxn_opcodes_h_l1016_c39_d840_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_return_output,
 result_MUX_uxn_opcodes_h_l1017_c7_dcaf_return_output,
 opc_rot2_uxn_opcodes_h_l1017_c39_191b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_return_output,
 result_MUX_uxn_opcodes_h_l1018_c7_a1e6_return_output,
 opc_dup_uxn_opcodes_h_l1018_c39_970e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_return_output,
 result_MUX_uxn_opcodes_h_l1019_c7_7f82_return_output,
 opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_return_output,
 result_MUX_uxn_opcodes_h_l1020_c7_fed0_return_output,
 opc_ovr_uxn_opcodes_h_l1020_c39_57a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_return_output,
 result_MUX_uxn_opcodes_h_l1021_c7_48ee_return_output,
 opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_return_output,
 result_MUX_uxn_opcodes_h_l1022_c7_0224_return_output,
 opc_equ_uxn_opcodes_h_l1022_c39_435f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_return_output,
 result_MUX_uxn_opcodes_h_l1023_c7_3e0c_return_output,
 opc_equ2_uxn_opcodes_h_l1023_c39_31ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_return_output,
 result_MUX_uxn_opcodes_h_l1024_c7_64ab_return_output,
 opc_neq_uxn_opcodes_h_l1024_c39_1e84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_return_output,
 result_MUX_uxn_opcodes_h_l1025_c7_12f4_return_output,
 opc_neq2_uxn_opcodes_h_l1025_c39_e321_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_return_output,
 result_MUX_uxn_opcodes_h_l1026_c7_78e8_return_output,
 opc_gth_uxn_opcodes_h_l1026_c39_09d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_return_output,
 result_MUX_uxn_opcodes_h_l1027_c7_5bd6_return_output,
 opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_return_output,
 result_MUX_uxn_opcodes_h_l1028_c7_bee8_return_output,
 opc_lth_uxn_opcodes_h_l1028_c39_de13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_return_output,
 result_MUX_uxn_opcodes_h_l1029_c7_7790_return_output,
 opc_lth2_uxn_opcodes_h_l1029_c39_cfff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_return_output,
 result_MUX_uxn_opcodes_h_l1030_c7_6654_return_output,
 opc_jmp_uxn_opcodes_h_l1030_c39_7910_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_return_output,
 result_MUX_uxn_opcodes_h_l1031_c7_503a_return_output,
 opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_return_output,
 result_MUX_uxn_opcodes_h_l1032_c7_aac0_return_output,
 opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_return_output,
 result_MUX_uxn_opcodes_h_l1033_c7_fd73_return_output,
 opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_return_output,
 result_MUX_uxn_opcodes_h_l1034_c7_9bd9_return_output,
 opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_return_output,
 result_MUX_uxn_opcodes_h_l1035_c7_14fa_return_output,
 opc_jsr2_uxn_opcodes_h_l1035_c39_2238_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_return_output,
 result_MUX_uxn_opcodes_h_l1036_c7_1dcb_return_output,
 opc_sth_uxn_opcodes_h_l1036_c39_de58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_return_output,
 result_MUX_uxn_opcodes_h_l1037_c7_bc14_return_output,
 opc_sth2_uxn_opcodes_h_l1037_c39_8a61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_return_output,
 result_MUX_uxn_opcodes_h_l1038_c7_a3f0_return_output,
 opc_ldz_uxn_opcodes_h_l1038_c39_063f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_return_output,
 result_MUX_uxn_opcodes_h_l1039_c7_fbd1_return_output,
 opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_return_output,
 result_MUX_uxn_opcodes_h_l1040_c7_2e9a_return_output,
 opc_stz_uxn_opcodes_h_l1040_c39_37e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_return_output,
 result_MUX_uxn_opcodes_h_l1041_c7_6f18_return_output,
 opc_stz2_uxn_opcodes_h_l1041_c39_26f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_return_output,
 result_MUX_uxn_opcodes_h_l1042_c7_4e20_return_output,
 opc_ldr_uxn_opcodes_h_l1042_c39_f212_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_return_output,
 result_MUX_uxn_opcodes_h_l1043_c7_d00f_return_output,
 opc_ldr2_uxn_opcodes_h_l1043_c39_3860_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_return_output,
 result_MUX_uxn_opcodes_h_l1044_c7_d6be_return_output,
 opc_str_uxn_opcodes_h_l1044_c39_bab8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_return_output,
 result_MUX_uxn_opcodes_h_l1045_c7_6655_return_output,
 opc_str2_uxn_opcodes_h_l1045_c39_dfaa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_return_output,
 result_MUX_uxn_opcodes_h_l1046_c7_f181_return_output,
 opc_lda_uxn_opcodes_h_l1046_c39_f8fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_return_output,
 result_MUX_uxn_opcodes_h_l1047_c7_1eda_return_output,
 opc_lda2_uxn_opcodes_h_l1047_c39_c237_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_return_output,
 result_MUX_uxn_opcodes_h_l1048_c7_4547_return_output,
 opc_sta_uxn_opcodes_h_l1048_c39_eb13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_return_output,
 result_MUX_uxn_opcodes_h_l1049_c7_ef51_return_output,
 opc_sta2_uxn_opcodes_h_l1049_c39_595f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_return_output,
 result_MUX_uxn_opcodes_h_l1050_c7_5874_return_output,
 opc_dei_uxn_opcodes_h_l1050_c39_4132_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_return_output,
 result_MUX_uxn_opcodes_h_l1051_c7_ca7b_return_output,
 opc_dei2_uxn_opcodes_h_l1051_c39_89d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_return_output,
 result_MUX_uxn_opcodes_h_l1052_c7_592e_return_output,
 opc_deo_uxn_opcodes_h_l1052_c39_817e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_return_output,
 result_MUX_uxn_opcodes_h_l1053_c7_e2a2_return_output,
 opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_return_output,
 result_MUX_uxn_opcodes_h_l1054_c7_65f8_return_output,
 opc_add_uxn_opcodes_h_l1054_c39_5242_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_return_output,
 result_MUX_uxn_opcodes_h_l1055_c7_ddfe_return_output,
 opc_add2_uxn_opcodes_h_l1055_c39_7e65_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_return_output,
 result_MUX_uxn_opcodes_h_l1056_c7_0f6c_return_output,
 opc_sub_uxn_opcodes_h_l1056_c39_c606_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_return_output,
 result_MUX_uxn_opcodes_h_l1057_c7_06f5_return_output,
 opc_sub2_uxn_opcodes_h_l1057_c39_16bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_return_output,
 result_MUX_uxn_opcodes_h_l1058_c7_20b5_return_output,
 opc_mul_uxn_opcodes_h_l1058_c39_b973_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_return_output,
 result_MUX_uxn_opcodes_h_l1059_c7_936c_return_output,
 opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_return_output,
 result_MUX_uxn_opcodes_h_l1060_c7_176f_return_output,
 opc_div_uxn_opcodes_h_l1060_c39_71b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_return_output,
 result_MUX_uxn_opcodes_h_l1061_c7_257c_return_output,
 opc_div2_uxn_opcodes_h_l1061_c39_610f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_return_output,
 result_MUX_uxn_opcodes_h_l1062_c7_eceb_return_output,
 opc_and_uxn_opcodes_h_l1062_c39_7825_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_return_output,
 result_MUX_uxn_opcodes_h_l1063_c7_38f2_return_output,
 opc_and2_uxn_opcodes_h_l1063_c39_0978_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_return_output,
 result_MUX_uxn_opcodes_h_l1064_c7_0913_return_output,
 opc_ora_uxn_opcodes_h_l1064_c39_3e6d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_return_output,
 result_MUX_uxn_opcodes_h_l1065_c7_4972_return_output,
 opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_return_output,
 result_MUX_uxn_opcodes_h_l1066_c7_37b1_return_output,
 opc_eor_uxn_opcodes_h_l1066_c39_0087_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_return_output,
 result_MUX_uxn_opcodes_h_l1067_c7_1642_return_output,
 opc_eor2_uxn_opcodes_h_l1067_c39_449e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_return_output,
 result_MUX_uxn_opcodes_h_l1068_c7_39d1_return_output,
 opc_sft_uxn_opcodes_h_l1068_c39_0666_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_return_output,
 result_MUX_uxn_opcodes_h_l1069_c7_a791_return_output,
 opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_opcode : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_d84a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_d84a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_330c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_d84a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_d84a_cond : unsigned(0 downto 0);
 variable VAR_opc_brk_uxn_opcodes_h_l1000_c34_7557_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_330c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_330c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_570b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_330c_cond : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_748b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_748b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_748b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_570b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_570b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_db9b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_570b_cond : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_2d52_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_2d52_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_db9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_db9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_0f5b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_db9b_cond : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_ins : unsigned(7 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_0f5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_0f5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_d021_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_0f5b_cond : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_3236_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_3236_ins : unsigned(7 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_3236_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_3236_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_d021_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_d021_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_1089_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_d021_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_de7d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_de7d_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_de7d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_de7d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_1089_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_1089_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_35d0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_1089_cond : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_7215_stack_index : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_7215_ins : unsigned(7 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_7215_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_7215_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_35d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_35d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_ec40_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_35d0_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_ec40_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_ec40_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_6cc6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_ec40_cond : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_96da_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_96da_ins : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_96da_k : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_96da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_96da_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_6cc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_6cc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_92e8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_6cc6_cond : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_ins : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_k : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_92e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_92e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_e581_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_92e8_cond : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_bbce_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_bbce_ins : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_bbce_k : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_bbce_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_bbce_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_e581_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_e581_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_7e5e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_e581_cond : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8632_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8632_ins : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8632_k : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8632_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8632_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_7e5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_7e5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_2181_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_7e5e_cond : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_f5f2_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_f5f2_ins : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_f5f2_k : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_f5f2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_f5f2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_2181_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_2181_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_039d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_2181_cond : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9591_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9591_ins : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9591_k : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9591_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9591_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_039d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_039d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_c848_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_039d_cond : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_4c9d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_4c9d_ins : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_4c9d_k : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_4c9d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_4c9d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_c848_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_c848_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_15d0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_c848_cond : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_fe14_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_fe14_ins : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_fe14_k : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_fe14_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_fe14_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_15d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_15d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_dcaf_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_15d0_cond : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_d840_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_d840_ins : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_d840_k : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_d840_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_d840_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_dcaf_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_dcaf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_a1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_dcaf_cond : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_191b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_191b_ins : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_191b_k : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_191b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_191b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_a1e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_a1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_7f82_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_a1e6_cond : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_970e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_970e_ins : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_970e_k : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_970e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_970e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_7f82_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_7f82_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_fed0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_7f82_cond : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_ins : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_k : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_fed0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_fed0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_48ee_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_fed0_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_57a1_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_57a1_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_57a1_k : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_57a1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_57a1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_48ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_48ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_0224_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_48ee_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_k : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_0224_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_0224_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_3e0c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_0224_cond : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_435f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_435f_ins : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_435f_k : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_435f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_435f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_3e0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_3e0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_64ab_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_3e0c_cond : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_31ce_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_31ce_ins : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_31ce_k : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_31ce_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_31ce_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_64ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_64ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_12f4_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_64ab_cond : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_1e84_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_1e84_ins : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_1e84_k : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_1e84_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_1e84_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_12f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_12f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_78e8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_12f4_cond : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e321_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e321_ins : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e321_k : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e321_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e321_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_78e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_78e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_5bd6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_78e8_cond : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_09d0_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_09d0_ins : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_09d0_k : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_09d0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_09d0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_5bd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_5bd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_bee8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_5bd6_cond : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_ins : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_k : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_bee8_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_bee8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_7790_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_bee8_cond : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_de13_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_de13_ins : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_de13_k : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_de13_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_de13_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_7790_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_7790_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_6654_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_7790_cond : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_cfff_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_cfff_ins : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_cfff_k : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_cfff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_cfff_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_6654_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_6654_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_503a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_6654_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_7910_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_7910_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_7910_k : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_7910_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_7910_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_503a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_503a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_aac0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_503a_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_k : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_aac0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_aac0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_fd73_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_aac0_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_k : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_fd73_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_fd73_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_9bd9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_fd73_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_k : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_9bd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_9bd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_14fa_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_9bd9_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_k : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_14fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_14fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_1dcb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_14fa_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_2238_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_2238_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_2238_k : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_2238_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_2238_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_1dcb_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_1dcb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_bc14_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_1dcb_cond : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_de58_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_de58_ins : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_de58_k : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_de58_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_de58_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_bc14_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_bc14_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_a3f0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_bc14_cond : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_8a61_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_8a61_ins : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_8a61_k : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_8a61_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_8a61_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_a3f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_a3f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_fbd1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_a3f0_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_063f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_063f_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_063f_k : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_063f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_063f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_fbd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_fbd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_2e9a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_fbd1_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_k : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_2e9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_2e9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_6f18_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_2e9a_cond : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_37e9_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_37e9_ins : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_37e9_k : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_37e9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_37e9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_6f18_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_6f18_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_4e20_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_6f18_cond : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_26f2_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_26f2_ins : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_26f2_k : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_26f2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_26f2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_4e20_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_4e20_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_d00f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_4e20_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_f212_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_f212_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_f212_k : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_f212_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_f212_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_d00f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_d00f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_d6be_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_d00f_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_3860_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_3860_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_3860_k : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_3860_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_3860_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_d6be_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_d6be_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_6655_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_d6be_cond : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_bab8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_bab8_ins : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_bab8_k : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_bab8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_bab8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_6655_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_6655_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_f181_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_6655_cond : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_dfaa_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_dfaa_ins : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_dfaa_k : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_dfaa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_dfaa_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_f181_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_f181_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_1eda_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_f181_cond : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_f8fa_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_f8fa_ins : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_f8fa_k : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_f8fa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_f8fa_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_1eda_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_1eda_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_4547_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_1eda_cond : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_c237_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_c237_ins : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_c237_k : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_c237_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_c237_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_4547_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_4547_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_ef51_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_4547_cond : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_eb13_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_eb13_ins : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_eb13_k : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_eb13_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_eb13_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_ef51_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_ef51_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_5874_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_ef51_cond : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_595f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_595f_ins : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_595f_k : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_595f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_595f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_5874_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_5874_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_ca7b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_5874_cond : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_4132_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_4132_ins : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_4132_k : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_4132_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_4132_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_ca7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_ca7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_592e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_ca7b_cond : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_89d8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_89d8_ins : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_89d8_k : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_89d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_89d8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_592e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_592e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_e2a2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_592e_cond : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_817e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_817e_ins : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_817e_k : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_817e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_817e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_e2a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_e2a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_65f8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_e2a2_cond : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_ins : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_k : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_65f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_65f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_ddfe_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_65f8_cond : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_5242_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_5242_ins : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_5242_k : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_5242_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_5242_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_ddfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_ddfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_0f6c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_ddfe_cond : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_7e65_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_7e65_ins : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_7e65_k : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_7e65_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_7e65_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_0f6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_0f6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_06f5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_0f6c_cond : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_c606_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_c606_ins : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_c606_k : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_c606_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_c606_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_06f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_06f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_20b5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_06f5_cond : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_16bd_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_16bd_ins : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_16bd_k : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_16bd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_16bd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_20b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_20b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_936c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_20b5_cond : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_b973_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_b973_ins : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_b973_k : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_b973_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_b973_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_936c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_936c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_176f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_936c_cond : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_ins : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_k : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_176f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_176f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_257c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_176f_cond : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_71b7_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_71b7_ins : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_71b7_k : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_71b7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_71b7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_257c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_257c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_eceb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_257c_cond : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_610f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_610f_ins : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_610f_k : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_610f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_610f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_eceb_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_eceb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_38f2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_eceb_cond : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_7825_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_7825_ins : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_7825_k : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_7825_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_7825_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_38f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_38f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_0913_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_38f2_cond : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_0978_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_0978_ins : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_0978_k : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_0978_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_0978_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_0913_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_0913_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_4972_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_0913_cond : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_3e6d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_3e6d_ins : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_3e6d_k : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_3e6d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_3e6d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_4972_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_4972_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_37b1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_4972_cond : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_ins : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_k : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_37b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_37b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_1642_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_37b1_cond : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_0087_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_0087_ins : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_0087_k : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_0087_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_0087_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_1642_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_1642_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_39d1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_1642_cond : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_449e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_449e_ins : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_449e_k : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_449e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_449e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_39d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_39d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_a791_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_39d1_cond : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_0666_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_0666_ins : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_0666_k : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_0666_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_0666_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_a791_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_a791_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_a791_cond : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_ins : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_k : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_return_output : unsigned(0 downto 0);
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_right := to_unsigned(250, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_right := to_unsigned(62, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_right := to_unsigned(59, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_right := to_unsigned(30, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_right := to_unsigned(18, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_right := to_unsigned(35, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_right := to_unsigned(20, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_right := to_unsigned(16, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_right := to_unsigned(34, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_right := to_unsigned(48, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_right := to_unsigned(61, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_right := to_unsigned(55, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_right := to_unsigned(255, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_right := to_unsigned(13, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_right := to_unsigned(17, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_right := to_unsigned(29, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_right := to_unsigned(249, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_right := to_unsigned(43, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_right := to_unsigned(253, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_right := to_unsigned(27, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_right := to_unsigned(52, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_right := to_unsigned(42, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_right := to_unsigned(56, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_right := to_unsigned(53, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_right := to_unsigned(40, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_right := to_unsigned(41, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_right := to_unsigned(21, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_right := to_unsigned(254, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_right := to_unsigned(57, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_right := to_unsigned(51, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_right := to_unsigned(54, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_right := to_unsigned(252, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_right := to_unsigned(44, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_right := to_unsigned(24, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_right := to_unsigned(46, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_right := to_unsigned(47, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_right := to_unsigned(36, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_right := to_unsigned(50, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_right := to_unsigned(251, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_right := to_unsigned(45, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_right := to_unsigned(28, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_right := to_unsigned(23, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_right := to_unsigned(10, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_right := to_unsigned(60, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_right := to_unsigned(63, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_right := to_unsigned(39, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_right := to_unsigned(37, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_right := to_unsigned(33, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_right := to_unsigned(26, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_right := to_unsigned(38, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_a791_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_iffalse := VAR_CLOCK_ENABLE;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_7e65_ins := VAR_ins;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_5242_ins := VAR_ins;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_0978_ins := VAR_ins;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_7825_ins := VAR_ins;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_89d8_ins := VAR_ins;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_4132_ins := VAR_ins;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_ins := VAR_ins;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_817e_ins := VAR_ins;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_610f_ins := VAR_ins;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_71b7_ins := VAR_ins;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_ins := VAR_ins;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_970e_ins := VAR_ins;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_449e_ins := VAR_ins;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_0087_ins := VAR_ins;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_31ce_ins := VAR_ins;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_435f_ins := VAR_ins;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_ins := VAR_ins;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_09d0_ins := VAR_ins;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_ins := VAR_ins;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_96da_ins := VAR_ins;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_ins := VAR_ins;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_ins := VAR_ins;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_ins := VAR_ins;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_7910_ins := VAR_ins;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_ins := VAR_ins;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_2238_ins := VAR_ins;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_ins := VAR_ins;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_c237_ins := VAR_ins;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_f8fa_ins := VAR_ins;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_3860_ins := VAR_ins;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_f212_ins := VAR_ins;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_ins := VAR_ins;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_063f_ins := VAR_ins;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_de7d_ins := VAR_ins;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_ins := VAR_ins;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_3236_ins := VAR_ins;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_7215_ins := VAR_ins;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_cfff_ins := VAR_ins;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_de13_ins := VAR_ins;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_ins := VAR_ins;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_b973_ins := VAR_ins;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e321_ins := VAR_ins;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_1e84_ins := VAR_ins;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9591_ins := VAR_ins;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_f5f2_ins := VAR_ins;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_ins := VAR_ins;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_3e6d_ins := VAR_ins;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_ins := VAR_ins;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_57a1_ins := VAR_ins;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8632_ins := VAR_ins;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_bbce_ins := VAR_ins;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_191b_ins := VAR_ins;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_d840_ins := VAR_ins;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_ins := VAR_ins;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_0666_ins := VAR_ins;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_595f_ins := VAR_ins;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_eb13_ins := VAR_ins;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_8a61_ins := VAR_ins;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_de58_ins := VAR_ins;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_dfaa_ins := VAR_ins;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_bab8_ins := VAR_ins;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_26f2_ins := VAR_ins;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_37e9_ins := VAR_ins;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_16bd_ins := VAR_ins;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_c606_ins := VAR_ins;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_fe14_ins := VAR_ins;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_4c9d_ins := VAR_ins;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_7e65_k := VAR_k;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_5242_k := VAR_k;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_0978_k := VAR_k;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_7825_k := VAR_k;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_89d8_k := VAR_k;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_4132_k := VAR_k;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_k := VAR_k;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_817e_k := VAR_k;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_610f_k := VAR_k;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_71b7_k := VAR_k;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_k := VAR_k;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_970e_k := VAR_k;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_449e_k := VAR_k;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_0087_k := VAR_k;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_31ce_k := VAR_k;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_435f_k := VAR_k;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_k := VAR_k;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_09d0_k := VAR_k;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_k := VAR_k;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_96da_k := VAR_k;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_k := VAR_k;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_k := VAR_k;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_k := VAR_k;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_7910_k := VAR_k;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_2238_k := VAR_k;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_k := VAR_k;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_c237_k := VAR_k;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_f8fa_k := VAR_k;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_3860_k := VAR_k;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_f212_k := VAR_k;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_k := VAR_k;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_063f_k := VAR_k;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_cfff_k := VAR_k;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_de13_k := VAR_k;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_k := VAR_k;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_b973_k := VAR_k;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e321_k := VAR_k;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_1e84_k := VAR_k;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9591_k := VAR_k;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_f5f2_k := VAR_k;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_k := VAR_k;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_3e6d_k := VAR_k;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_k := VAR_k;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_57a1_k := VAR_k;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8632_k := VAR_k;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_bbce_k := VAR_k;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_191b_k := VAR_k;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_d840_k := VAR_k;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_k := VAR_k;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_0666_k := VAR_k;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_595f_k := VAR_k;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_eb13_k := VAR_k;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_8a61_k := VAR_k;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_de58_k := VAR_k;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_dfaa_k := VAR_k;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_bab8_k := VAR_k;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_26f2_k := VAR_k;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_37e9_k := VAR_k;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_16bd_k := VAR_k;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_c606_k := VAR_k;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_fe14_k := VAR_k;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_4c9d_k := VAR_k;
     REG_VAR_l16 := l16;
     REG_VAR_l8 := l8;
     REG_VAR_n16 := n16;
     REG_VAR_n8 := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_left := VAR_opcode;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_7e65_stack_index := VAR_stack_index;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_5242_stack_index := VAR_stack_index;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_0978_stack_index := VAR_stack_index;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_7825_stack_index := VAR_stack_index;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_89d8_stack_index := VAR_stack_index;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_4132_stack_index := VAR_stack_index;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_stack_index := VAR_stack_index;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_817e_stack_index := VAR_stack_index;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_610f_stack_index := VAR_stack_index;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_71b7_stack_index := VAR_stack_index;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_stack_index := VAR_stack_index;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_970e_stack_index := VAR_stack_index;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_449e_stack_index := VAR_stack_index;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_0087_stack_index := VAR_stack_index;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_31ce_stack_index := VAR_stack_index;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_435f_stack_index := VAR_stack_index;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_stack_index := VAR_stack_index;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_09d0_stack_index := VAR_stack_index;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_stack_index := VAR_stack_index;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_96da_stack_index := VAR_stack_index;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_748b_stack_index := VAR_stack_index;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_stack_index := VAR_stack_index;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_stack_index := VAR_stack_index;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_stack_index := VAR_stack_index;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_7910_stack_index := VAR_stack_index;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_2238_stack_index := VAR_stack_index;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_stack_index := VAR_stack_index;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_c237_stack_index := VAR_stack_index;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_f8fa_stack_index := VAR_stack_index;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_3860_stack_index := VAR_stack_index;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_f212_stack_index := VAR_stack_index;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_stack_index := VAR_stack_index;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_063f_stack_index := VAR_stack_index;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_de7d_stack_index := VAR_stack_index;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_stack_index := VAR_stack_index;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_3236_stack_index := VAR_stack_index;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_7215_stack_index := VAR_stack_index;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_cfff_stack_index := VAR_stack_index;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_de13_stack_index := VAR_stack_index;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_stack_index := VAR_stack_index;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_b973_stack_index := VAR_stack_index;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e321_stack_index := VAR_stack_index;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_1e84_stack_index := VAR_stack_index;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9591_stack_index := VAR_stack_index;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_f5f2_stack_index := VAR_stack_index;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_stack_index := VAR_stack_index;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_3e6d_stack_index := VAR_stack_index;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_stack_index := VAR_stack_index;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_57a1_stack_index := VAR_stack_index;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8632_stack_index := VAR_stack_index;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_bbce_stack_index := VAR_stack_index;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_191b_stack_index := VAR_stack_index;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_d840_stack_index := VAR_stack_index;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_stack_index := VAR_stack_index;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_0666_stack_index := VAR_stack_index;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_595f_stack_index := VAR_stack_index;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_eb13_stack_index := VAR_stack_index;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_8a61_stack_index := VAR_stack_index;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_de58_stack_index := VAR_stack_index;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_dfaa_stack_index := VAR_stack_index;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_bab8_stack_index := VAR_stack_index;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_26f2_stack_index := VAR_stack_index;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_37e9_stack_index := VAR_stack_index;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_16bd_stack_index := VAR_stack_index;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_c606_stack_index := VAR_stack_index;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_fe14_stack_index := VAR_stack_index;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_4c9d_stack_index := VAR_stack_index;
     REG_VAR_t16 := t16;
     REG_VAR_t8 := t8;
     REG_VAR_tmp16 := tmp16;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_17aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_af98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_left;
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_return_output := BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_ff95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_left;
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_return_output := BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_37fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_8223] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_left;
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_return_output := BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_46a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_43c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_13ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_ef6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_b56c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_df3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_5848] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_6e44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_left;
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_return_output := BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_718b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_840c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_bf11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_left;
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_return_output := BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_c92d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_2652] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_left;
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_return_output := BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_8430] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_46e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_52f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_bcf9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_1779] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_left;
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_return_output := BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_1b2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_6668] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_left;
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_return_output := BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_2d7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_68fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_561b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_128c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_a547] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_left;
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_return_output := BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_5cca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_94b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_a923] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_left;
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_return_output := BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_246a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_3504] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_left;
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_return_output := BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_5b32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_left;
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_return_output := BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_44d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_f82a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_0b39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_left;
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_return_output := BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_15ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_c6ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_8d4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_cbe5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_5f17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_left;
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_return_output := BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_26f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_446c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_6ec1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_9e38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_left;
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_return_output := BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_d509] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_left;
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_return_output := BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_a178] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_left;
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_return_output := BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_ca1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_0d89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_left;
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_return_output := BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_82ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_1fc9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_3a0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_92d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_1768] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_left;
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_return_output := BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_5ff9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_b51b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_d704] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_left;
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_return_output := BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_6779] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_left;
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_return_output := BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_f0fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_f865] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_c2b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_59fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_9800] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_left;
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_return_output := BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_8f93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_left;
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_return_output := BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_9509] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_left;
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_return_output := BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_return_output;

     -- opc_brk[uxn_opcodes_h_l1000_c34_7557] LATENCY=0
     -- Inputs
     -- Outputs
     VAR_opc_brk_uxn_opcodes_h_l1000_c34_7557_return_output := opc_brk_uxn_opcodes_h_l1000_c34_7557_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_7d29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_left;
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_return_output := BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_7236] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_d84a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_561b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_330c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_46a6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_570b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c92d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_db9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_5848_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_0f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_8d4b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_d021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_a547_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_1089_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_df3f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_35d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_59fa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_ec40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_bf11_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_6cc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_6779_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_92e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_2d7c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_e581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_b56c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_7e5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_46e2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_2181_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_c2b9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_039d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_ef6a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_c848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_9800_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_15d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_1b2f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_dcaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_bcf9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_a1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_8223_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_7f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f82a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_fed0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_52f6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_48ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_37fc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_0224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_b51b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_3e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_f865_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_64ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1fc9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_12f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1768_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_78e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_17aa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_5bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_2652_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_bee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_94b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_7790_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_5cca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_6654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_af98_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_503a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_5f17_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_aac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_840c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_fd73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_44d1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_9bd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_a923_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_14fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_82ce_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_1dcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_3504_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_bc14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_f0fe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_a3f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_15ff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_fbd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_5ff9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_2e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_1779_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_6f18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_d704_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_4e20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_9e38_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_d00f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_0b39_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_d6be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_128c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_6655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_68fc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_f181_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_c6ec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_1eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_5b32_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_4547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff95_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_ef51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_6e44_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_5874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_7236_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_ca7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_43c3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_592e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_9509_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_e2a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_a178_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_65f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_718b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_ddfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_8430_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_0f6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_0d89_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_06f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8f93_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_20b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_ca1a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_936c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_6ec1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_176f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_13ef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_257c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_26f0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_eceb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_7d29_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_38f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_3a0b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_0913_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_cbe5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_4972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_446c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_37b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_92d3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_1642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_246a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_39d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6668_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_a791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_d509_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_d84a_iftrue := VAR_opc_brk_uxn_opcodes_h_l1000_c34_7557_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_330c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_330c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_570b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_6c68] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_570b_return_output;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_748b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_6c68_return_output;
     -- opc_jci[uxn_opcodes_h_l1001_c39_748b] LATENCY=0
     -- Clock enable
     opc_jci_uxn_opcodes_h_l1001_c39_748b_CLOCK_ENABLE <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_748b_CLOCK_ENABLE;
     -- Inputs
     opc_jci_uxn_opcodes_h_l1001_c39_748b_stack_index <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_748b_stack_index;
     -- Outputs
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_748b_return_output := opc_jci_uxn_opcodes_h_l1001_c39_748b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_db9b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_b5e4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_db9b_return_output;
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_2d52_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_b5e4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_330c_iftrue := VAR_opc_jci_uxn_opcodes_h_l1001_c39_748b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_0f5b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_return_output;

     -- opc_jmi[uxn_opcodes_h_l1002_c39_2d52] LATENCY=0
     -- Clock enable
     opc_jmi_uxn_opcodes_h_l1002_c39_2d52_CLOCK_ENABLE <= VAR_opc_jmi_uxn_opcodes_h_l1002_c39_2d52_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_2d52_return_output := opc_jmi_uxn_opcodes_h_l1002_c39_2d52_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_7702] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_0f5b_return_output;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_7702_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_570b_iftrue := VAR_opc_jmi_uxn_opcodes_h_l1002_c39_2d52_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_45fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_return_output;

     -- opc_jsi[uxn_opcodes_h_l1003_c39_ba6a] LATENCY=0
     -- Clock enable
     opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_CLOCK_ENABLE <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_CLOCK_ENABLE;
     -- Inputs
     opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_ins <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_ins;
     -- Outputs
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_return_output := opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_d021] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_d021_return_output;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_3236_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45fb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_db9b_iftrue := VAR_opc_jsi_uxn_opcodes_h_l1003_c39_ba6a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_2ff8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_1089] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_return_output;

     -- opc_lit[uxn_opcodes_h_l1004_c39_3236] LATENCY=0
     -- Clock enable
     opc_lit_uxn_opcodes_h_l1004_c39_3236_CLOCK_ENABLE <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_3236_CLOCK_ENABLE;
     -- Inputs
     opc_lit_uxn_opcodes_h_l1004_c39_3236_stack_index <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_3236_stack_index;
     opc_lit_uxn_opcodes_h_l1004_c39_3236_ins <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_3236_ins;
     -- Outputs
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_3236_return_output := opc_lit_uxn_opcodes_h_l1004_c39_3236_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_1089_return_output;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_de7d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_2ff8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_0f5b_iftrue := VAR_opc_lit_uxn_opcodes_h_l1004_c39_3236_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_35d0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_return_output;

     -- opc_lit2[uxn_opcodes_h_l1005_c39_de7d] LATENCY=0
     -- Clock enable
     opc_lit2_uxn_opcodes_h_l1005_c39_de7d_CLOCK_ENABLE <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_de7d_CLOCK_ENABLE;
     -- Inputs
     opc_lit2_uxn_opcodes_h_l1005_c39_de7d_stack_index <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_de7d_stack_index;
     opc_lit2_uxn_opcodes_h_l1005_c39_de7d_ins <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_de7d_ins;
     -- Outputs
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_de7d_return_output := opc_lit2_uxn_opcodes_h_l1005_c39_de7d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_f047] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_35d0_return_output;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_7215_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_f047_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_d021_iftrue := VAR_opc_lit2_uxn_opcodes_h_l1005_c39_de7d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_6d3b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_return_output;

     -- opc_litr[uxn_opcodes_h_l1006_c39_7215] LATENCY=0
     -- Clock enable
     opc_litr_uxn_opcodes_h_l1006_c39_7215_CLOCK_ENABLE <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_7215_CLOCK_ENABLE;
     -- Inputs
     opc_litr_uxn_opcodes_h_l1006_c39_7215_stack_index <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_7215_stack_index;
     opc_litr_uxn_opcodes_h_l1006_c39_7215_ins <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_7215_ins;
     -- Outputs
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_7215_return_output := opc_litr_uxn_opcodes_h_l1006_c39_7215_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_ec40] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_ec40_return_output;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_6d3b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_1089_iftrue := VAR_opc_litr_uxn_opcodes_h_l1006_c39_7215_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_6cc6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_12ad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_return_output;

     -- opc_lit2r[uxn_opcodes_h_l1007_c39_5de1] LATENCY=0
     -- Clock enable
     opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_CLOCK_ENABLE <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_CLOCK_ENABLE;
     -- Inputs
     opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_stack_index <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_stack_index;
     opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_ins <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_ins;
     -- Outputs
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_return_output := opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_6cc6_return_output;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_96da_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_12ad_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_35d0_iftrue := VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_5de1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_92e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_9f48] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_return_output;

     -- opc_inc[uxn_opcodes_h_l1008_c39_96da] LATENCY=0
     -- Clock enable
     opc_inc_uxn_opcodes_h_l1008_c39_96da_CLOCK_ENABLE <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_96da_CLOCK_ENABLE;
     -- Inputs
     opc_inc_uxn_opcodes_h_l1008_c39_96da_stack_index <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_96da_stack_index;
     opc_inc_uxn_opcodes_h_l1008_c39_96da_ins <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_96da_ins;
     opc_inc_uxn_opcodes_h_l1008_c39_96da_k <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_96da_k;
     -- Outputs
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_96da_return_output := opc_inc_uxn_opcodes_h_l1008_c39_96da_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_92e8_return_output;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_9f48_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_ec40_iftrue := VAR_opc_inc_uxn_opcodes_h_l1008_c39_96da_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_dc78] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_return_output;

     -- opc_inc2[uxn_opcodes_h_l1009_c39_2fc4] LATENCY=0
     -- Clock enable
     opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_CLOCK_ENABLE <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_CLOCK_ENABLE;
     -- Inputs
     opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_stack_index <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_stack_index;
     opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_ins <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_ins;
     opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_k <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_k;
     -- Outputs
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_return_output := opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_e581] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_e581_return_output;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_bbce_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_dc78_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_6cc6_iftrue := VAR_opc_inc2_uxn_opcodes_h_l1009_c39_2fc4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_9b2d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_7e5e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_return_output;

     -- opc_pop[uxn_opcodes_h_l1010_c39_bbce] LATENCY=0
     -- Clock enable
     opc_pop_uxn_opcodes_h_l1010_c39_bbce_CLOCK_ENABLE <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_bbce_CLOCK_ENABLE;
     -- Inputs
     opc_pop_uxn_opcodes_h_l1010_c39_bbce_stack_index <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_bbce_stack_index;
     opc_pop_uxn_opcodes_h_l1010_c39_bbce_ins <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_bbce_ins;
     opc_pop_uxn_opcodes_h_l1010_c39_bbce_k <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_bbce_k;
     -- Outputs
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_bbce_return_output := opc_pop_uxn_opcodes_h_l1010_c39_bbce_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_7e5e_return_output;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8632_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_9b2d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_92e8_iftrue := VAR_opc_pop_uxn_opcodes_h_l1010_c39_bbce_return_output;
     -- opc_pop2[uxn_opcodes_h_l1011_c39_8632] LATENCY=0
     -- Clock enable
     opc_pop2_uxn_opcodes_h_l1011_c39_8632_CLOCK_ENABLE <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8632_CLOCK_ENABLE;
     -- Inputs
     opc_pop2_uxn_opcodes_h_l1011_c39_8632_stack_index <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8632_stack_index;
     opc_pop2_uxn_opcodes_h_l1011_c39_8632_ins <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8632_ins;
     opc_pop2_uxn_opcodes_h_l1011_c39_8632_k <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8632_k;
     -- Outputs
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8632_return_output := opc_pop2_uxn_opcodes_h_l1011_c39_8632_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_7198] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_2181] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_2181_return_output;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_f5f2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_7198_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_e581_iftrue := VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8632_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_039d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_d3f5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_return_output;

     -- opc_nip[uxn_opcodes_h_l1012_c39_f5f2] LATENCY=0
     -- Clock enable
     opc_nip_uxn_opcodes_h_l1012_c39_f5f2_CLOCK_ENABLE <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_f5f2_CLOCK_ENABLE;
     -- Inputs
     opc_nip_uxn_opcodes_h_l1012_c39_f5f2_stack_index <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_f5f2_stack_index;
     opc_nip_uxn_opcodes_h_l1012_c39_f5f2_ins <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_f5f2_ins;
     opc_nip_uxn_opcodes_h_l1012_c39_f5f2_k <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_f5f2_k;
     -- Outputs
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_f5f2_return_output := opc_nip_uxn_opcodes_h_l1012_c39_f5f2_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_039d_return_output;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9591_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_d3f5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_7e5e_iftrue := VAR_opc_nip_uxn_opcodes_h_l1012_c39_f5f2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_5652] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_return_output;

     -- opc_nip2[uxn_opcodes_h_l1013_c39_9591] LATENCY=0
     -- Clock enable
     opc_nip2_uxn_opcodes_h_l1013_c39_9591_CLOCK_ENABLE <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9591_CLOCK_ENABLE;
     -- Inputs
     opc_nip2_uxn_opcodes_h_l1013_c39_9591_stack_index <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9591_stack_index;
     opc_nip2_uxn_opcodes_h_l1013_c39_9591_ins <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9591_ins;
     opc_nip2_uxn_opcodes_h_l1013_c39_9591_k <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9591_k;
     -- Outputs
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9591_return_output := opc_nip2_uxn_opcodes_h_l1013_c39_9591_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_c848] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_c848_return_output;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_4c9d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_5652_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_2181_iftrue := VAR_opc_nip2_uxn_opcodes_h_l1013_c39_9591_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_15d0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_5325] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_return_output;

     -- opc_swp[uxn_opcodes_h_l1014_c39_4c9d] LATENCY=0
     -- Clock enable
     opc_swp_uxn_opcodes_h_l1014_c39_4c9d_CLOCK_ENABLE <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_4c9d_CLOCK_ENABLE;
     -- Inputs
     opc_swp_uxn_opcodes_h_l1014_c39_4c9d_stack_index <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_4c9d_stack_index;
     opc_swp_uxn_opcodes_h_l1014_c39_4c9d_ins <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_4c9d_ins;
     opc_swp_uxn_opcodes_h_l1014_c39_4c9d_k <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_4c9d_k;
     -- Outputs
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_4c9d_return_output := opc_swp_uxn_opcodes_h_l1014_c39_4c9d_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_15d0_return_output;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_fe14_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_5325_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_039d_iftrue := VAR_opc_swp_uxn_opcodes_h_l1014_c39_4c9d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_dcaf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_return_output;

     -- opc_swp2[uxn_opcodes_h_l1015_c39_fe14] LATENCY=0
     -- Clock enable
     opc_swp2_uxn_opcodes_h_l1015_c39_fe14_CLOCK_ENABLE <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_fe14_CLOCK_ENABLE;
     -- Inputs
     opc_swp2_uxn_opcodes_h_l1015_c39_fe14_stack_index <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_fe14_stack_index;
     opc_swp2_uxn_opcodes_h_l1015_c39_fe14_ins <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_fe14_ins;
     opc_swp2_uxn_opcodes_h_l1015_c39_fe14_k <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_fe14_k;
     -- Outputs
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_fe14_return_output := opc_swp2_uxn_opcodes_h_l1015_c39_fe14_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_0fc1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dcaf_return_output;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_d840_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_0fc1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_c848_iftrue := VAR_opc_swp2_uxn_opcodes_h_l1015_c39_fe14_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_a1e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_7d09] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_return_output;

     -- opc_rot[uxn_opcodes_h_l1016_c39_d840] LATENCY=0
     -- Clock enable
     opc_rot_uxn_opcodes_h_l1016_c39_d840_CLOCK_ENABLE <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_d840_CLOCK_ENABLE;
     -- Inputs
     opc_rot_uxn_opcodes_h_l1016_c39_d840_stack_index <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_d840_stack_index;
     opc_rot_uxn_opcodes_h_l1016_c39_d840_ins <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_d840_ins;
     opc_rot_uxn_opcodes_h_l1016_c39_d840_k <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_d840_k;
     -- Outputs
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_d840_return_output := opc_rot_uxn_opcodes_h_l1016_c39_d840_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_a1e6_return_output;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_191b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_7d09_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_15d0_iftrue := VAR_opc_rot_uxn_opcodes_h_l1016_c39_d840_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_7046] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_7f82] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_return_output;

     -- opc_rot2[uxn_opcodes_h_l1017_c39_191b] LATENCY=0
     -- Clock enable
     opc_rot2_uxn_opcodes_h_l1017_c39_191b_CLOCK_ENABLE <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_191b_CLOCK_ENABLE;
     -- Inputs
     opc_rot2_uxn_opcodes_h_l1017_c39_191b_stack_index <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_191b_stack_index;
     opc_rot2_uxn_opcodes_h_l1017_c39_191b_ins <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_191b_ins;
     opc_rot2_uxn_opcodes_h_l1017_c39_191b_k <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_191b_k;
     -- Outputs
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_191b_return_output := opc_rot2_uxn_opcodes_h_l1017_c39_191b_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_7f82_return_output;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_970e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_7046_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_dcaf_iftrue := VAR_opc_rot2_uxn_opcodes_h_l1017_c39_191b_return_output;
     -- opc_dup[uxn_opcodes_h_l1018_c39_970e] LATENCY=0
     -- Clock enable
     opc_dup_uxn_opcodes_h_l1018_c39_970e_CLOCK_ENABLE <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_970e_CLOCK_ENABLE;
     -- Inputs
     opc_dup_uxn_opcodes_h_l1018_c39_970e_stack_index <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_970e_stack_index;
     opc_dup_uxn_opcodes_h_l1018_c39_970e_ins <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_970e_ins;
     opc_dup_uxn_opcodes_h_l1018_c39_970e_k <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_970e_k;
     -- Outputs
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_970e_return_output := opc_dup_uxn_opcodes_h_l1018_c39_970e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_52f9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_fed0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_fed0_return_output;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_52f9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_a1e6_iftrue := VAR_opc_dup_uxn_opcodes_h_l1018_c39_970e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_beca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_48ee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_return_output;

     -- opc_dup2[uxn_opcodes_h_l1019_c39_1bd0] LATENCY=0
     -- Clock enable
     opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_CLOCK_ENABLE <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_CLOCK_ENABLE;
     -- Inputs
     opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_stack_index <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_stack_index;
     opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_ins <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_ins;
     opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_k <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_k;
     -- Outputs
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_return_output := opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_48ee_return_output;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_57a1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_beca_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_7f82_iftrue := VAR_opc_dup2_uxn_opcodes_h_l1019_c39_1bd0_return_output;
     -- opc_ovr[uxn_opcodes_h_l1020_c39_57a1] LATENCY=0
     -- Clock enable
     opc_ovr_uxn_opcodes_h_l1020_c39_57a1_CLOCK_ENABLE <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_57a1_CLOCK_ENABLE;
     -- Inputs
     opc_ovr_uxn_opcodes_h_l1020_c39_57a1_stack_index <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_57a1_stack_index;
     opc_ovr_uxn_opcodes_h_l1020_c39_57a1_ins <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_57a1_ins;
     opc_ovr_uxn_opcodes_h_l1020_c39_57a1_k <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_57a1_k;
     -- Outputs
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_57a1_return_output := opc_ovr_uxn_opcodes_h_l1020_c39_57a1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_0224] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_f464] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_0224_return_output;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_f464_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_fed0_iftrue := VAR_opc_ovr_uxn_opcodes_h_l1020_c39_57a1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_0198] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_return_output;

     -- opc_ovr2[uxn_opcodes_h_l1021_c39_fe5e] LATENCY=0
     -- Clock enable
     opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_CLOCK_ENABLE <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_CLOCK_ENABLE;
     -- Inputs
     opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_stack_index <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_stack_index;
     opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_ins <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_ins;
     opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_k <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_k;
     -- Outputs
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_return_output := opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_3e0c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_3e0c_return_output;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_435f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0198_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_48ee_iftrue := VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_fe5e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_64ab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_return_output;

     -- opc_equ[uxn_opcodes_h_l1022_c39_435f] LATENCY=0
     -- Clock enable
     opc_equ_uxn_opcodes_h_l1022_c39_435f_CLOCK_ENABLE <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_435f_CLOCK_ENABLE;
     -- Inputs
     opc_equ_uxn_opcodes_h_l1022_c39_435f_stack_index <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_435f_stack_index;
     opc_equ_uxn_opcodes_h_l1022_c39_435f_ins <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_435f_ins;
     opc_equ_uxn_opcodes_h_l1022_c39_435f_k <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_435f_k;
     -- Outputs
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_435f_return_output := opc_equ_uxn_opcodes_h_l1022_c39_435f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_25c6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64ab_return_output;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_31ce_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_25c6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_0224_iftrue := VAR_opc_equ_uxn_opcodes_h_l1022_c39_435f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_12f4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_cc25] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_return_output;

     -- opc_equ2[uxn_opcodes_h_l1023_c39_31ce] LATENCY=0
     -- Clock enable
     opc_equ2_uxn_opcodes_h_l1023_c39_31ce_CLOCK_ENABLE <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_31ce_CLOCK_ENABLE;
     -- Inputs
     opc_equ2_uxn_opcodes_h_l1023_c39_31ce_stack_index <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_31ce_stack_index;
     opc_equ2_uxn_opcodes_h_l1023_c39_31ce_ins <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_31ce_ins;
     opc_equ2_uxn_opcodes_h_l1023_c39_31ce_k <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_31ce_k;
     -- Outputs
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_31ce_return_output := opc_equ2_uxn_opcodes_h_l1023_c39_31ce_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_12f4_return_output;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_1e84_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_cc25_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_3e0c_iftrue := VAR_opc_equ2_uxn_opcodes_h_l1023_c39_31ce_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_f553] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_78e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_return_output;

     -- opc_neq[uxn_opcodes_h_l1024_c39_1e84] LATENCY=0
     -- Clock enable
     opc_neq_uxn_opcodes_h_l1024_c39_1e84_CLOCK_ENABLE <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_1e84_CLOCK_ENABLE;
     -- Inputs
     opc_neq_uxn_opcodes_h_l1024_c39_1e84_stack_index <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_1e84_stack_index;
     opc_neq_uxn_opcodes_h_l1024_c39_1e84_ins <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_1e84_ins;
     opc_neq_uxn_opcodes_h_l1024_c39_1e84_k <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_1e84_k;
     -- Outputs
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_1e84_return_output := opc_neq_uxn_opcodes_h_l1024_c39_1e84_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_78e8_return_output;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e321_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_f553_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_64ab_iftrue := VAR_opc_neq_uxn_opcodes_h_l1024_c39_1e84_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_5bd6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_return_output;

     -- opc_neq2[uxn_opcodes_h_l1025_c39_e321] LATENCY=0
     -- Clock enable
     opc_neq2_uxn_opcodes_h_l1025_c39_e321_CLOCK_ENABLE <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e321_CLOCK_ENABLE;
     -- Inputs
     opc_neq2_uxn_opcodes_h_l1025_c39_e321_stack_index <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e321_stack_index;
     opc_neq2_uxn_opcodes_h_l1025_c39_e321_ins <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e321_ins;
     opc_neq2_uxn_opcodes_h_l1025_c39_e321_k <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e321_k;
     -- Outputs
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e321_return_output := opc_neq2_uxn_opcodes_h_l1025_c39_e321_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_26e5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_5bd6_return_output;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_09d0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_26e5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_12f4_iftrue := VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e321_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_bee8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_return_output;

     -- opc_gth[uxn_opcodes_h_l1026_c39_09d0] LATENCY=0
     -- Clock enable
     opc_gth_uxn_opcodes_h_l1026_c39_09d0_CLOCK_ENABLE <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_09d0_CLOCK_ENABLE;
     -- Inputs
     opc_gth_uxn_opcodes_h_l1026_c39_09d0_stack_index <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_09d0_stack_index;
     opc_gth_uxn_opcodes_h_l1026_c39_09d0_ins <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_09d0_ins;
     opc_gth_uxn_opcodes_h_l1026_c39_09d0_k <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_09d0_k;
     -- Outputs
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_09d0_return_output := opc_gth_uxn_opcodes_h_l1026_c39_09d0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_9b18] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_bee8_return_output;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9b18_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_78e8_iftrue := VAR_opc_gth_uxn_opcodes_h_l1026_c39_09d0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_88e7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_7790] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_return_output;

     -- opc_gth2[uxn_opcodes_h_l1027_c39_1cc0] LATENCY=0
     -- Clock enable
     opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_CLOCK_ENABLE <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_CLOCK_ENABLE;
     -- Inputs
     opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_stack_index <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_stack_index;
     opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_ins <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_ins;
     opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_k <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_k;
     -- Outputs
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_return_output := opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7790_return_output;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_de13_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_88e7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_5bd6_iftrue := VAR_opc_gth2_uxn_opcodes_h_l1027_c39_1cc0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_6654] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_ac71] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_return_output;

     -- opc_lth[uxn_opcodes_h_l1028_c39_de13] LATENCY=0
     -- Clock enable
     opc_lth_uxn_opcodes_h_l1028_c39_de13_CLOCK_ENABLE <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_de13_CLOCK_ENABLE;
     -- Inputs
     opc_lth_uxn_opcodes_h_l1028_c39_de13_stack_index <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_de13_stack_index;
     opc_lth_uxn_opcodes_h_l1028_c39_de13_ins <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_de13_ins;
     opc_lth_uxn_opcodes_h_l1028_c39_de13_k <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_de13_k;
     -- Outputs
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_de13_return_output := opc_lth_uxn_opcodes_h_l1028_c39_de13_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_6654_return_output;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_cfff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_ac71_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_bee8_iftrue := VAR_opc_lth_uxn_opcodes_h_l1028_c39_de13_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_6e45] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_503a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_return_output;

     -- opc_lth2[uxn_opcodes_h_l1029_c39_cfff] LATENCY=0
     -- Clock enable
     opc_lth2_uxn_opcodes_h_l1029_c39_cfff_CLOCK_ENABLE <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_cfff_CLOCK_ENABLE;
     -- Inputs
     opc_lth2_uxn_opcodes_h_l1029_c39_cfff_stack_index <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_cfff_stack_index;
     opc_lth2_uxn_opcodes_h_l1029_c39_cfff_ins <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_cfff_ins;
     opc_lth2_uxn_opcodes_h_l1029_c39_cfff_k <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_cfff_k;
     -- Outputs
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_cfff_return_output := opc_lth2_uxn_opcodes_h_l1029_c39_cfff_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_503a_return_output;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_7910_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_6e45_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_7790_iftrue := VAR_opc_lth2_uxn_opcodes_h_l1029_c39_cfff_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_aac0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_return_output;

     -- opc_jmp[uxn_opcodes_h_l1030_c39_7910] LATENCY=0
     -- Clock enable
     opc_jmp_uxn_opcodes_h_l1030_c39_7910_CLOCK_ENABLE <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_7910_CLOCK_ENABLE;
     -- Inputs
     opc_jmp_uxn_opcodes_h_l1030_c39_7910_stack_index <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_7910_stack_index;
     opc_jmp_uxn_opcodes_h_l1030_c39_7910_ins <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_7910_ins;
     opc_jmp_uxn_opcodes_h_l1030_c39_7910_k <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_7910_k;
     -- Outputs
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_7910_return_output := opc_jmp_uxn_opcodes_h_l1030_c39_7910_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_7f80] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_aac0_return_output;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_7f80_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_6654_iftrue := VAR_opc_jmp_uxn_opcodes_h_l1030_c39_7910_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_fd73] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_4576] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_return_output;

     -- opc_jmp2[uxn_opcodes_h_l1031_c39_9cbb] LATENCY=0
     -- Clock enable
     opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_CLOCK_ENABLE <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_CLOCK_ENABLE;
     -- Inputs
     opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_stack_index <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_stack_index;
     opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_ins <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_ins;
     opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_k <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_k;
     -- Outputs
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_return_output := opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_fd73_return_output;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4576_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_503a_iftrue := VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_9cbb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_ca7b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_9bd9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_return_output;

     -- opc_jcn[uxn_opcodes_h_l1032_c39_d4ae] LATENCY=0
     -- Clock enable
     opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_CLOCK_ENABLE <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_CLOCK_ENABLE;
     -- Inputs
     opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_stack_index <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_stack_index;
     opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_ins <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_ins;
     opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_k <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_k;
     -- Outputs
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_return_output := opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_9bd9_return_output;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_ca7b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_aac0_iftrue := VAR_opc_jcn_uxn_opcodes_h_l1032_c39_d4ae_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_e34d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_return_output;

     -- opc_jcn2[uxn_opcodes_h_l1033_c39_fb1d] LATENCY=0
     -- Clock enable
     opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_CLOCK_ENABLE <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_CLOCK_ENABLE;
     -- Inputs
     opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_stack_index <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_stack_index;
     opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_ins <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_ins;
     opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_k <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_k;
     -- Outputs
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_return_output := opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_14fa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_14fa_return_output;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_e34d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_fd73_iftrue := VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_fb1d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_50ec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_1dcb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_return_output;

     -- opc_jsr[uxn_opcodes_h_l1034_c39_e8d9] LATENCY=0
     -- Clock enable
     opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_CLOCK_ENABLE <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_CLOCK_ENABLE;
     -- Inputs
     opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_stack_index <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_stack_index;
     opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_ins <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_ins;
     opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_k <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_k;
     -- Outputs
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_return_output := opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_1dcb_return_output;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_2238_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_50ec_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_9bd9_iftrue := VAR_opc_jsr_uxn_opcodes_h_l1034_c39_e8d9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_6e51] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_return_output;

     -- opc_jsr2[uxn_opcodes_h_l1035_c39_2238] LATENCY=0
     -- Clock enable
     opc_jsr2_uxn_opcodes_h_l1035_c39_2238_CLOCK_ENABLE <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_2238_CLOCK_ENABLE;
     -- Inputs
     opc_jsr2_uxn_opcodes_h_l1035_c39_2238_stack_index <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_2238_stack_index;
     opc_jsr2_uxn_opcodes_h_l1035_c39_2238_ins <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_2238_ins;
     opc_jsr2_uxn_opcodes_h_l1035_c39_2238_k <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_2238_k;
     -- Outputs
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_2238_return_output := opc_jsr2_uxn_opcodes_h_l1035_c39_2238_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_bc14] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_bc14_return_output;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_de58_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_6e51_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_14fa_iftrue := VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_2238_return_output;
     -- opc_sth[uxn_opcodes_h_l1036_c39_de58] LATENCY=0
     -- Clock enable
     opc_sth_uxn_opcodes_h_l1036_c39_de58_CLOCK_ENABLE <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_de58_CLOCK_ENABLE;
     -- Inputs
     opc_sth_uxn_opcodes_h_l1036_c39_de58_stack_index <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_de58_stack_index;
     opc_sth_uxn_opcodes_h_l1036_c39_de58_ins <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_de58_ins;
     opc_sth_uxn_opcodes_h_l1036_c39_de58_k <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_de58_k;
     -- Outputs
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_de58_return_output := opc_sth_uxn_opcodes_h_l1036_c39_de58_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_a3f0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_a911] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_a3f0_return_output;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_8a61_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_a911_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_1dcb_iftrue := VAR_opc_sth_uxn_opcodes_h_l1036_c39_de58_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_ede8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_fbd1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_return_output;

     -- opc_sth2[uxn_opcodes_h_l1037_c39_8a61] LATENCY=0
     -- Clock enable
     opc_sth2_uxn_opcodes_h_l1037_c39_8a61_CLOCK_ENABLE <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_8a61_CLOCK_ENABLE;
     -- Inputs
     opc_sth2_uxn_opcodes_h_l1037_c39_8a61_stack_index <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_8a61_stack_index;
     opc_sth2_uxn_opcodes_h_l1037_c39_8a61_ins <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_8a61_ins;
     opc_sth2_uxn_opcodes_h_l1037_c39_8a61_k <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_8a61_k;
     -- Outputs
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_8a61_return_output := opc_sth2_uxn_opcodes_h_l1037_c39_8a61_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_fbd1_return_output;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_063f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_ede8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_bc14_iftrue := VAR_opc_sth2_uxn_opcodes_h_l1037_c39_8a61_return_output;
     -- opc_ldz[uxn_opcodes_h_l1038_c39_063f] LATENCY=0
     -- Clock enable
     opc_ldz_uxn_opcodes_h_l1038_c39_063f_CLOCK_ENABLE <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_063f_CLOCK_ENABLE;
     -- Inputs
     opc_ldz_uxn_opcodes_h_l1038_c39_063f_stack_index <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_063f_stack_index;
     opc_ldz_uxn_opcodes_h_l1038_c39_063f_ins <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_063f_ins;
     opc_ldz_uxn_opcodes_h_l1038_c39_063f_k <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_063f_k;
     -- Outputs
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_063f_return_output := opc_ldz_uxn_opcodes_h_l1038_c39_063f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_2e9a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_5df6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_2e9a_return_output;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_5df6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_a3f0_iftrue := VAR_opc_ldz_uxn_opcodes_h_l1038_c39_063f_return_output;
     -- opc_ldz2[uxn_opcodes_h_l1039_c39_bd81] LATENCY=0
     -- Clock enable
     opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_CLOCK_ENABLE <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_CLOCK_ENABLE;
     -- Inputs
     opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_stack_index <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_stack_index;
     opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_ins <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_ins;
     opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_k <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_k;
     -- Outputs
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_return_output := opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_c65c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_6f18] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_6f18_return_output;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_37e9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_c65c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_fbd1_iftrue := VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_bd81_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_4e20] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_1d5e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_return_output;

     -- opc_stz[uxn_opcodes_h_l1040_c39_37e9] LATENCY=0
     -- Clock enable
     opc_stz_uxn_opcodes_h_l1040_c39_37e9_CLOCK_ENABLE <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_37e9_CLOCK_ENABLE;
     -- Inputs
     opc_stz_uxn_opcodes_h_l1040_c39_37e9_stack_index <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_37e9_stack_index;
     opc_stz_uxn_opcodes_h_l1040_c39_37e9_ins <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_37e9_ins;
     opc_stz_uxn_opcodes_h_l1040_c39_37e9_k <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_37e9_k;
     -- Outputs
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_37e9_return_output := opc_stz_uxn_opcodes_h_l1040_c39_37e9_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_4e20_return_output;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_26f2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_1d5e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_2e9a_iftrue := VAR_opc_stz_uxn_opcodes_h_l1040_c39_37e9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_da38] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_return_output;

     -- opc_stz2[uxn_opcodes_h_l1041_c39_26f2] LATENCY=0
     -- Clock enable
     opc_stz2_uxn_opcodes_h_l1041_c39_26f2_CLOCK_ENABLE <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_26f2_CLOCK_ENABLE;
     -- Inputs
     opc_stz2_uxn_opcodes_h_l1041_c39_26f2_stack_index <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_26f2_stack_index;
     opc_stz2_uxn_opcodes_h_l1041_c39_26f2_ins <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_26f2_ins;
     opc_stz2_uxn_opcodes_h_l1041_c39_26f2_k <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_26f2_k;
     -- Outputs
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_26f2_return_output := opc_stz2_uxn_opcodes_h_l1041_c39_26f2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_d00f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_d00f_return_output;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_f212_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_da38_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_6f18_iftrue := VAR_opc_stz2_uxn_opcodes_h_l1041_c39_26f2_return_output;
     -- opc_ldr[uxn_opcodes_h_l1042_c39_f212] LATENCY=0
     -- Clock enable
     opc_ldr_uxn_opcodes_h_l1042_c39_f212_CLOCK_ENABLE <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_f212_CLOCK_ENABLE;
     -- Inputs
     opc_ldr_uxn_opcodes_h_l1042_c39_f212_stack_index <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_f212_stack_index;
     opc_ldr_uxn_opcodes_h_l1042_c39_f212_ins <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_f212_ins;
     opc_ldr_uxn_opcodes_h_l1042_c39_f212_k <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_f212_k;
     -- Outputs
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_f212_return_output := opc_ldr_uxn_opcodes_h_l1042_c39_f212_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_d6be] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_3cb3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_d6be_return_output;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_3860_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3cb3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_4e20_iftrue := VAR_opc_ldr_uxn_opcodes_h_l1042_c39_f212_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_b069] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_6655] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_return_output;

     -- opc_ldr2[uxn_opcodes_h_l1043_c39_3860] LATENCY=0
     -- Clock enable
     opc_ldr2_uxn_opcodes_h_l1043_c39_3860_CLOCK_ENABLE <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_3860_CLOCK_ENABLE;
     -- Inputs
     opc_ldr2_uxn_opcodes_h_l1043_c39_3860_stack_index <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_3860_stack_index;
     opc_ldr2_uxn_opcodes_h_l1043_c39_3860_ins <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_3860_ins;
     opc_ldr2_uxn_opcodes_h_l1043_c39_3860_k <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_3860_k;
     -- Outputs
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_3860_return_output := opc_ldr2_uxn_opcodes_h_l1043_c39_3860_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_6655_return_output;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_bab8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_b069_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_d00f_iftrue := VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_3860_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_37fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_f181] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_return_output;

     -- opc_str[uxn_opcodes_h_l1044_c39_bab8] LATENCY=0
     -- Clock enable
     opc_str_uxn_opcodes_h_l1044_c39_bab8_CLOCK_ENABLE <= VAR_opc_str_uxn_opcodes_h_l1044_c39_bab8_CLOCK_ENABLE;
     -- Inputs
     opc_str_uxn_opcodes_h_l1044_c39_bab8_stack_index <= VAR_opc_str_uxn_opcodes_h_l1044_c39_bab8_stack_index;
     opc_str_uxn_opcodes_h_l1044_c39_bab8_ins <= VAR_opc_str_uxn_opcodes_h_l1044_c39_bab8_ins;
     opc_str_uxn_opcodes_h_l1044_c39_bab8_k <= VAR_opc_str_uxn_opcodes_h_l1044_c39_bab8_k;
     -- Outputs
     VAR_opc_str_uxn_opcodes_h_l1044_c39_bab8_return_output := opc_str_uxn_opcodes_h_l1044_c39_bab8_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_f181_return_output;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_dfaa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_37fb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_d6be_iftrue := VAR_opc_str_uxn_opcodes_h_l1044_c39_bab8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_438c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_1eda] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_return_output;

     -- opc_str2[uxn_opcodes_h_l1045_c39_dfaa] LATENCY=0
     -- Clock enable
     opc_str2_uxn_opcodes_h_l1045_c39_dfaa_CLOCK_ENABLE <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_dfaa_CLOCK_ENABLE;
     -- Inputs
     opc_str2_uxn_opcodes_h_l1045_c39_dfaa_stack_index <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_dfaa_stack_index;
     opc_str2_uxn_opcodes_h_l1045_c39_dfaa_ins <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_dfaa_ins;
     opc_str2_uxn_opcodes_h_l1045_c39_dfaa_k <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_dfaa_k;
     -- Outputs
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_dfaa_return_output := opc_str2_uxn_opcodes_h_l1045_c39_dfaa_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_1eda_return_output;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_f8fa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_438c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_6655_iftrue := VAR_opc_str2_uxn_opcodes_h_l1045_c39_dfaa_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_8df1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_4547] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_return_output;

     -- opc_lda[uxn_opcodes_h_l1046_c39_f8fa] LATENCY=0
     -- Clock enable
     opc_lda_uxn_opcodes_h_l1046_c39_f8fa_CLOCK_ENABLE <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_f8fa_CLOCK_ENABLE;
     -- Inputs
     opc_lda_uxn_opcodes_h_l1046_c39_f8fa_stack_index <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_f8fa_stack_index;
     opc_lda_uxn_opcodes_h_l1046_c39_f8fa_ins <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_f8fa_ins;
     opc_lda_uxn_opcodes_h_l1046_c39_f8fa_k <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_f8fa_k;
     -- Outputs
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_f8fa_return_output := opc_lda_uxn_opcodes_h_l1046_c39_f8fa_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_4547_return_output;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_c237_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_8df1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_f181_iftrue := VAR_opc_lda_uxn_opcodes_h_l1046_c39_f8fa_return_output;
     -- opc_lda2[uxn_opcodes_h_l1047_c39_c237] LATENCY=0
     -- Clock enable
     opc_lda2_uxn_opcodes_h_l1047_c39_c237_CLOCK_ENABLE <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_c237_CLOCK_ENABLE;
     -- Inputs
     opc_lda2_uxn_opcodes_h_l1047_c39_c237_stack_index <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_c237_stack_index;
     opc_lda2_uxn_opcodes_h_l1047_c39_c237_ins <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_c237_ins;
     opc_lda2_uxn_opcodes_h_l1047_c39_c237_k <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_c237_k;
     -- Outputs
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_c237_return_output := opc_lda2_uxn_opcodes_h_l1047_c39_c237_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_e15c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_ef51] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_ef51_return_output;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_eb13_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_e15c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_1eda_iftrue := VAR_opc_lda2_uxn_opcodes_h_l1047_c39_c237_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_2c74] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_5874] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_return_output;

     -- opc_sta[uxn_opcodes_h_l1048_c39_eb13] LATENCY=0
     -- Clock enable
     opc_sta_uxn_opcodes_h_l1048_c39_eb13_CLOCK_ENABLE <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_eb13_CLOCK_ENABLE;
     -- Inputs
     opc_sta_uxn_opcodes_h_l1048_c39_eb13_stack_index <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_eb13_stack_index;
     opc_sta_uxn_opcodes_h_l1048_c39_eb13_ins <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_eb13_ins;
     opc_sta_uxn_opcodes_h_l1048_c39_eb13_k <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_eb13_k;
     -- Outputs
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_eb13_return_output := opc_sta_uxn_opcodes_h_l1048_c39_eb13_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_5874_return_output;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_595f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_2c74_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_4547_iftrue := VAR_opc_sta_uxn_opcodes_h_l1048_c39_eb13_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_ca7b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_return_output;

     -- opc_sta2[uxn_opcodes_h_l1049_c39_595f] LATENCY=0
     -- Clock enable
     opc_sta2_uxn_opcodes_h_l1049_c39_595f_CLOCK_ENABLE <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_595f_CLOCK_ENABLE;
     -- Inputs
     opc_sta2_uxn_opcodes_h_l1049_c39_595f_stack_index <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_595f_stack_index;
     opc_sta2_uxn_opcodes_h_l1049_c39_595f_ins <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_595f_ins;
     opc_sta2_uxn_opcodes_h_l1049_c39_595f_k <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_595f_k;
     -- Outputs
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_595f_return_output := opc_sta2_uxn_opcodes_h_l1049_c39_595f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_8670] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_ca7b_return_output;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_4132_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_8670_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_ef51_iftrue := VAR_opc_sta2_uxn_opcodes_h_l1049_c39_595f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_55cc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_return_output;

     -- opc_dei[uxn_opcodes_h_l1050_c39_4132] LATENCY=0
     -- Clock enable
     opc_dei_uxn_opcodes_h_l1050_c39_4132_CLOCK_ENABLE <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_4132_CLOCK_ENABLE;
     -- Inputs
     opc_dei_uxn_opcodes_h_l1050_c39_4132_stack_index <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_4132_stack_index;
     opc_dei_uxn_opcodes_h_l1050_c39_4132_ins <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_4132_ins;
     opc_dei_uxn_opcodes_h_l1050_c39_4132_k <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_4132_k;
     -- Outputs
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_4132_return_output := opc_dei_uxn_opcodes_h_l1050_c39_4132_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_592e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_592e_return_output;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_89d8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_55cc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_5874_iftrue := VAR_opc_dei_uxn_opcodes_h_l1050_c39_4132_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_e2a2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_return_output;

     -- opc_dei2[uxn_opcodes_h_l1051_c39_89d8] LATENCY=0
     -- Clock enable
     opc_dei2_uxn_opcodes_h_l1051_c39_89d8_CLOCK_ENABLE <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_89d8_CLOCK_ENABLE;
     -- Inputs
     opc_dei2_uxn_opcodes_h_l1051_c39_89d8_stack_index <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_89d8_stack_index;
     opc_dei2_uxn_opcodes_h_l1051_c39_89d8_ins <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_89d8_ins;
     opc_dei2_uxn_opcodes_h_l1051_c39_89d8_k <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_89d8_k;
     -- Outputs
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_89d8_return_output := opc_dei2_uxn_opcodes_h_l1051_c39_89d8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_603f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_e2a2_return_output;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_817e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_603f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_ca7b_iftrue := VAR_opc_dei2_uxn_opcodes_h_l1051_c39_89d8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_0768] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_return_output;

     -- opc_deo[uxn_opcodes_h_l1052_c39_817e] LATENCY=0
     -- Clock enable
     opc_deo_uxn_opcodes_h_l1052_c39_817e_CLOCK_ENABLE <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_817e_CLOCK_ENABLE;
     -- Inputs
     opc_deo_uxn_opcodes_h_l1052_c39_817e_stack_index <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_817e_stack_index;
     opc_deo_uxn_opcodes_h_l1052_c39_817e_ins <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_817e_ins;
     opc_deo_uxn_opcodes_h_l1052_c39_817e_k <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_817e_k;
     -- Outputs
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_817e_return_output := opc_deo_uxn_opcodes_h_l1052_c39_817e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_65f8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_65f8_return_output;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_0768_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_592e_iftrue := VAR_opc_deo_uxn_opcodes_h_l1052_c39_817e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_ddfe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_d30b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_return_output;

     -- opc_deo2[uxn_opcodes_h_l1053_c39_d9c5] LATENCY=0
     -- Clock enable
     opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_CLOCK_ENABLE <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_CLOCK_ENABLE;
     -- Inputs
     opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_stack_index <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_stack_index;
     opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_ins <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_ins;
     opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_k <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_k;
     -- Outputs
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_return_output := opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_ddfe_return_output;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_5242_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_d30b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_e2a2_iftrue := VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d9c5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_0f6c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_return_output;

     -- opc_add[uxn_opcodes_h_l1054_c39_5242] LATENCY=0
     -- Clock enable
     opc_add_uxn_opcodes_h_l1054_c39_5242_CLOCK_ENABLE <= VAR_opc_add_uxn_opcodes_h_l1054_c39_5242_CLOCK_ENABLE;
     -- Inputs
     opc_add_uxn_opcodes_h_l1054_c39_5242_stack_index <= VAR_opc_add_uxn_opcodes_h_l1054_c39_5242_stack_index;
     opc_add_uxn_opcodes_h_l1054_c39_5242_ins <= VAR_opc_add_uxn_opcodes_h_l1054_c39_5242_ins;
     opc_add_uxn_opcodes_h_l1054_c39_5242_k <= VAR_opc_add_uxn_opcodes_h_l1054_c39_5242_k;
     -- Outputs
     VAR_opc_add_uxn_opcodes_h_l1054_c39_5242_return_output := opc_add_uxn_opcodes_h_l1054_c39_5242_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_fd47] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_0f6c_return_output;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_7e65_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_fd47_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_65f8_iftrue := VAR_opc_add_uxn_opcodes_h_l1054_c39_5242_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_c108] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_06f5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_return_output;

     -- opc_add2[uxn_opcodes_h_l1055_c39_7e65] LATENCY=0
     -- Clock enable
     opc_add2_uxn_opcodes_h_l1055_c39_7e65_CLOCK_ENABLE <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_7e65_CLOCK_ENABLE;
     -- Inputs
     opc_add2_uxn_opcodes_h_l1055_c39_7e65_stack_index <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_7e65_stack_index;
     opc_add2_uxn_opcodes_h_l1055_c39_7e65_ins <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_7e65_ins;
     opc_add2_uxn_opcodes_h_l1055_c39_7e65_k <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_7e65_k;
     -- Outputs
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_7e65_return_output := opc_add2_uxn_opcodes_h_l1055_c39_7e65_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_06f5_return_output;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_c606_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_c108_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_ddfe_iftrue := VAR_opc_add2_uxn_opcodes_h_l1055_c39_7e65_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_beac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_return_output;

     -- opc_sub[uxn_opcodes_h_l1056_c39_c606] LATENCY=0
     -- Clock enable
     opc_sub_uxn_opcodes_h_l1056_c39_c606_CLOCK_ENABLE <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_c606_CLOCK_ENABLE;
     -- Inputs
     opc_sub_uxn_opcodes_h_l1056_c39_c606_stack_index <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_c606_stack_index;
     opc_sub_uxn_opcodes_h_l1056_c39_c606_ins <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_c606_ins;
     opc_sub_uxn_opcodes_h_l1056_c39_c606_k <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_c606_k;
     -- Outputs
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_c606_return_output := opc_sub_uxn_opcodes_h_l1056_c39_c606_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_20b5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_20b5_return_output;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_16bd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_beac_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_0f6c_iftrue := VAR_opc_sub_uxn_opcodes_h_l1056_c39_c606_return_output;
     -- opc_sub2[uxn_opcodes_h_l1057_c39_16bd] LATENCY=0
     -- Clock enable
     opc_sub2_uxn_opcodes_h_l1057_c39_16bd_CLOCK_ENABLE <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_16bd_CLOCK_ENABLE;
     -- Inputs
     opc_sub2_uxn_opcodes_h_l1057_c39_16bd_stack_index <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_16bd_stack_index;
     opc_sub2_uxn_opcodes_h_l1057_c39_16bd_ins <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_16bd_ins;
     opc_sub2_uxn_opcodes_h_l1057_c39_16bd_k <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_16bd_k;
     -- Outputs
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_16bd_return_output := opc_sub2_uxn_opcodes_h_l1057_c39_16bd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_fbd3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_936c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_936c_return_output;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_b973_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_fbd3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_06f5_iftrue := VAR_opc_sub2_uxn_opcodes_h_l1057_c39_16bd_return_output;
     -- opc_mul[uxn_opcodes_h_l1058_c39_b973] LATENCY=0
     -- Clock enable
     opc_mul_uxn_opcodes_h_l1058_c39_b973_CLOCK_ENABLE <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_b973_CLOCK_ENABLE;
     -- Inputs
     opc_mul_uxn_opcodes_h_l1058_c39_b973_stack_index <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_b973_stack_index;
     opc_mul_uxn_opcodes_h_l1058_c39_b973_ins <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_b973_ins;
     opc_mul_uxn_opcodes_h_l1058_c39_b973_k <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_b973_k;
     -- Outputs
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_b973_return_output := opc_mul_uxn_opcodes_h_l1058_c39_b973_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_8bcb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_176f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_176f_return_output;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_8bcb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_20b5_iftrue := VAR_opc_mul_uxn_opcodes_h_l1058_c39_b973_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_aeb0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_return_output;

     -- opc_mul2[uxn_opcodes_h_l1059_c39_ff2a] LATENCY=0
     -- Clock enable
     opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_CLOCK_ENABLE <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_CLOCK_ENABLE;
     -- Inputs
     opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_stack_index <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_stack_index;
     opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_ins <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_ins;
     opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_k <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_k;
     -- Outputs
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_return_output := opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_257c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_257c_return_output;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_71b7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_aeb0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_936c_iftrue := VAR_opc_mul2_uxn_opcodes_h_l1059_c39_ff2a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_5f1d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_eceb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_return_output;

     -- opc_div[uxn_opcodes_h_l1060_c39_71b7] LATENCY=0
     -- Clock enable
     opc_div_uxn_opcodes_h_l1060_c39_71b7_CLOCK_ENABLE <= VAR_opc_div_uxn_opcodes_h_l1060_c39_71b7_CLOCK_ENABLE;
     -- Inputs
     opc_div_uxn_opcodes_h_l1060_c39_71b7_stack_index <= VAR_opc_div_uxn_opcodes_h_l1060_c39_71b7_stack_index;
     opc_div_uxn_opcodes_h_l1060_c39_71b7_ins <= VAR_opc_div_uxn_opcodes_h_l1060_c39_71b7_ins;
     opc_div_uxn_opcodes_h_l1060_c39_71b7_k <= VAR_opc_div_uxn_opcodes_h_l1060_c39_71b7_k;
     -- Outputs
     VAR_opc_div_uxn_opcodes_h_l1060_c39_71b7_return_output := opc_div_uxn_opcodes_h_l1060_c39_71b7_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_eceb_return_output;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_610f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_5f1d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_176f_iftrue := VAR_opc_div_uxn_opcodes_h_l1060_c39_71b7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_cc94] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_return_output;

     -- opc_div2[uxn_opcodes_h_l1061_c39_610f] LATENCY=0
     -- Clock enable
     opc_div2_uxn_opcodes_h_l1061_c39_610f_CLOCK_ENABLE <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_610f_CLOCK_ENABLE;
     -- Inputs
     opc_div2_uxn_opcodes_h_l1061_c39_610f_stack_index <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_610f_stack_index;
     opc_div2_uxn_opcodes_h_l1061_c39_610f_ins <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_610f_ins;
     opc_div2_uxn_opcodes_h_l1061_c39_610f_k <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_610f_k;
     -- Outputs
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_610f_return_output := opc_div2_uxn_opcodes_h_l1061_c39_610f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_38f2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_38f2_return_output;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_7825_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_cc94_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_257c_iftrue := VAR_opc_div2_uxn_opcodes_h_l1061_c39_610f_return_output;
     -- opc_and[uxn_opcodes_h_l1062_c39_7825] LATENCY=0
     -- Clock enable
     opc_and_uxn_opcodes_h_l1062_c39_7825_CLOCK_ENABLE <= VAR_opc_and_uxn_opcodes_h_l1062_c39_7825_CLOCK_ENABLE;
     -- Inputs
     opc_and_uxn_opcodes_h_l1062_c39_7825_stack_index <= VAR_opc_and_uxn_opcodes_h_l1062_c39_7825_stack_index;
     opc_and_uxn_opcodes_h_l1062_c39_7825_ins <= VAR_opc_and_uxn_opcodes_h_l1062_c39_7825_ins;
     opc_and_uxn_opcodes_h_l1062_c39_7825_k <= VAR_opc_and_uxn_opcodes_h_l1062_c39_7825_k;
     -- Outputs
     VAR_opc_and_uxn_opcodes_h_l1062_c39_7825_return_output := opc_and_uxn_opcodes_h_l1062_c39_7825_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_b1ce] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_0913] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_0913_return_output;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_0978_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_b1ce_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_eceb_iftrue := VAR_opc_and_uxn_opcodes_h_l1062_c39_7825_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_1485] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_return_output;

     -- opc_and2[uxn_opcodes_h_l1063_c39_0978] LATENCY=0
     -- Clock enable
     opc_and2_uxn_opcodes_h_l1063_c39_0978_CLOCK_ENABLE <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_0978_CLOCK_ENABLE;
     -- Inputs
     opc_and2_uxn_opcodes_h_l1063_c39_0978_stack_index <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_0978_stack_index;
     opc_and2_uxn_opcodes_h_l1063_c39_0978_ins <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_0978_ins;
     opc_and2_uxn_opcodes_h_l1063_c39_0978_k <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_0978_k;
     -- Outputs
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_0978_return_output := opc_and2_uxn_opcodes_h_l1063_c39_0978_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_4972] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_4972_return_output;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_3e6d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1485_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_38f2_iftrue := VAR_opc_and2_uxn_opcodes_h_l1063_c39_0978_return_output;
     -- opc_ora[uxn_opcodes_h_l1064_c39_3e6d] LATENCY=0
     -- Clock enable
     opc_ora_uxn_opcodes_h_l1064_c39_3e6d_CLOCK_ENABLE <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_3e6d_CLOCK_ENABLE;
     -- Inputs
     opc_ora_uxn_opcodes_h_l1064_c39_3e6d_stack_index <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_3e6d_stack_index;
     opc_ora_uxn_opcodes_h_l1064_c39_3e6d_ins <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_3e6d_ins;
     opc_ora_uxn_opcodes_h_l1064_c39_3e6d_k <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_3e6d_k;
     -- Outputs
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_3e6d_return_output := opc_ora_uxn_opcodes_h_l1064_c39_3e6d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_c770] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_37b1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_37b1_return_output;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_c770_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_0913_iftrue := VAR_opc_ora_uxn_opcodes_h_l1064_c39_3e6d_return_output;
     -- opc_ora2[uxn_opcodes_h_l1065_c39_bc0b] LATENCY=0
     -- Clock enable
     opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_CLOCK_ENABLE <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_CLOCK_ENABLE;
     -- Inputs
     opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_stack_index <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_stack_index;
     opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_ins <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_ins;
     opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_k <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_k;
     -- Outputs
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_return_output := opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_a595] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_1642] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_1642_return_output;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_0087_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_a595_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_4972_iftrue := VAR_opc_ora2_uxn_opcodes_h_l1065_c39_bc0b_return_output;
     -- opc_eor[uxn_opcodes_h_l1066_c39_0087] LATENCY=0
     -- Clock enable
     opc_eor_uxn_opcodes_h_l1066_c39_0087_CLOCK_ENABLE <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_0087_CLOCK_ENABLE;
     -- Inputs
     opc_eor_uxn_opcodes_h_l1066_c39_0087_stack_index <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_0087_stack_index;
     opc_eor_uxn_opcodes_h_l1066_c39_0087_ins <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_0087_ins;
     opc_eor_uxn_opcodes_h_l1066_c39_0087_k <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_0087_k;
     -- Outputs
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_0087_return_output := opc_eor_uxn_opcodes_h_l1066_c39_0087_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_f319] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_39d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_39d1_return_output;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_449e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f319_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_37b1_iftrue := VAR_opc_eor_uxn_opcodes_h_l1066_c39_0087_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_74da] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_return_output;

     -- opc_eor2[uxn_opcodes_h_l1067_c39_449e] LATENCY=0
     -- Clock enable
     opc_eor2_uxn_opcodes_h_l1067_c39_449e_CLOCK_ENABLE <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_449e_CLOCK_ENABLE;
     -- Inputs
     opc_eor2_uxn_opcodes_h_l1067_c39_449e_stack_index <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_449e_stack_index;
     opc_eor2_uxn_opcodes_h_l1067_c39_449e_ins <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_449e_ins;
     opc_eor2_uxn_opcodes_h_l1067_c39_449e_k <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_449e_k;
     -- Outputs
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_449e_return_output := opc_eor2_uxn_opcodes_h_l1067_c39_449e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_a791] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_return_output;

     -- Submodule level 70
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_a791_return_output;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_0666_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_74da_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_1642_iftrue := VAR_opc_eor2_uxn_opcodes_h_l1067_c39_449e_return_output;
     -- opc_sft[uxn_opcodes_h_l1068_c39_0666] LATENCY=0
     -- Clock enable
     opc_sft_uxn_opcodes_h_l1068_c39_0666_CLOCK_ENABLE <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_0666_CLOCK_ENABLE;
     -- Inputs
     opc_sft_uxn_opcodes_h_l1068_c39_0666_stack_index <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_0666_stack_index;
     opc_sft_uxn_opcodes_h_l1068_c39_0666_ins <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_0666_ins;
     opc_sft_uxn_opcodes_h_l1068_c39_0666_k <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_0666_k;
     -- Outputs
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_0666_return_output := opc_sft_uxn_opcodes_h_l1068_c39_0666_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_3875] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_return_output;

     -- Submodule level 71
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_3875_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_39d1_iftrue := VAR_opc_sft_uxn_opcodes_h_l1068_c39_0666_return_output;
     -- opc_sft2[uxn_opcodes_h_l1069_c39_d3ad] LATENCY=0
     -- Clock enable
     opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_CLOCK_ENABLE <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_CLOCK_ENABLE;
     -- Inputs
     opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_stack_index <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_stack_index;
     opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_ins <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_ins;
     opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_k <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_k;
     -- Outputs
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_return_output := opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_return_output;

     -- Submodule level 72
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_a791_iftrue := VAR_opc_sft2_uxn_opcodes_h_l1069_c39_d3ad_return_output;
     -- result_MUX[uxn_opcodes_h_l1069_c7_a791] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1069_c7_a791_cond <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_a791_cond;
     result_MUX_uxn_opcodes_h_l1069_c7_a791_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_a791_iftrue;
     result_MUX_uxn_opcodes_h_l1069_c7_a791_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_a791_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_a791_return_output := result_MUX_uxn_opcodes_h_l1069_c7_a791_return_output;

     -- Submodule level 73
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_39d1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1069_c7_a791_return_output;
     -- result_MUX[uxn_opcodes_h_l1068_c7_39d1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1068_c7_39d1_cond <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_39d1_cond;
     result_MUX_uxn_opcodes_h_l1068_c7_39d1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_39d1_iftrue;
     result_MUX_uxn_opcodes_h_l1068_c7_39d1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_39d1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_39d1_return_output := result_MUX_uxn_opcodes_h_l1068_c7_39d1_return_output;

     -- Submodule level 74
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_1642_iffalse := VAR_result_MUX_uxn_opcodes_h_l1068_c7_39d1_return_output;
     -- result_MUX[uxn_opcodes_h_l1067_c7_1642] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1067_c7_1642_cond <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_1642_cond;
     result_MUX_uxn_opcodes_h_l1067_c7_1642_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_1642_iftrue;
     result_MUX_uxn_opcodes_h_l1067_c7_1642_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_1642_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_1642_return_output := result_MUX_uxn_opcodes_h_l1067_c7_1642_return_output;

     -- Submodule level 75
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_37b1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1067_c7_1642_return_output;
     -- result_MUX[uxn_opcodes_h_l1066_c7_37b1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1066_c7_37b1_cond <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_37b1_cond;
     result_MUX_uxn_opcodes_h_l1066_c7_37b1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_37b1_iftrue;
     result_MUX_uxn_opcodes_h_l1066_c7_37b1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_37b1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_37b1_return_output := result_MUX_uxn_opcodes_h_l1066_c7_37b1_return_output;

     -- Submodule level 76
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_4972_iffalse := VAR_result_MUX_uxn_opcodes_h_l1066_c7_37b1_return_output;
     -- result_MUX[uxn_opcodes_h_l1065_c7_4972] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1065_c7_4972_cond <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_4972_cond;
     result_MUX_uxn_opcodes_h_l1065_c7_4972_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_4972_iftrue;
     result_MUX_uxn_opcodes_h_l1065_c7_4972_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_4972_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_4972_return_output := result_MUX_uxn_opcodes_h_l1065_c7_4972_return_output;

     -- Submodule level 77
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_0913_iffalse := VAR_result_MUX_uxn_opcodes_h_l1065_c7_4972_return_output;
     -- result_MUX[uxn_opcodes_h_l1064_c7_0913] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1064_c7_0913_cond <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_0913_cond;
     result_MUX_uxn_opcodes_h_l1064_c7_0913_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_0913_iftrue;
     result_MUX_uxn_opcodes_h_l1064_c7_0913_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_0913_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_0913_return_output := result_MUX_uxn_opcodes_h_l1064_c7_0913_return_output;

     -- Submodule level 78
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_38f2_iffalse := VAR_result_MUX_uxn_opcodes_h_l1064_c7_0913_return_output;
     -- result_MUX[uxn_opcodes_h_l1063_c7_38f2] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1063_c7_38f2_cond <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_38f2_cond;
     result_MUX_uxn_opcodes_h_l1063_c7_38f2_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_38f2_iftrue;
     result_MUX_uxn_opcodes_h_l1063_c7_38f2_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_38f2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_38f2_return_output := result_MUX_uxn_opcodes_h_l1063_c7_38f2_return_output;

     -- Submodule level 79
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_eceb_iffalse := VAR_result_MUX_uxn_opcodes_h_l1063_c7_38f2_return_output;
     -- result_MUX[uxn_opcodes_h_l1062_c7_eceb] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1062_c7_eceb_cond <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_eceb_cond;
     result_MUX_uxn_opcodes_h_l1062_c7_eceb_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_eceb_iftrue;
     result_MUX_uxn_opcodes_h_l1062_c7_eceb_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_eceb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_eceb_return_output := result_MUX_uxn_opcodes_h_l1062_c7_eceb_return_output;

     -- Submodule level 80
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_257c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1062_c7_eceb_return_output;
     -- result_MUX[uxn_opcodes_h_l1061_c7_257c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1061_c7_257c_cond <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_257c_cond;
     result_MUX_uxn_opcodes_h_l1061_c7_257c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_257c_iftrue;
     result_MUX_uxn_opcodes_h_l1061_c7_257c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_257c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_257c_return_output := result_MUX_uxn_opcodes_h_l1061_c7_257c_return_output;

     -- Submodule level 81
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_176f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1061_c7_257c_return_output;
     -- result_MUX[uxn_opcodes_h_l1060_c7_176f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1060_c7_176f_cond <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_176f_cond;
     result_MUX_uxn_opcodes_h_l1060_c7_176f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_176f_iftrue;
     result_MUX_uxn_opcodes_h_l1060_c7_176f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_176f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_176f_return_output := result_MUX_uxn_opcodes_h_l1060_c7_176f_return_output;

     -- Submodule level 82
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_936c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1060_c7_176f_return_output;
     -- result_MUX[uxn_opcodes_h_l1059_c7_936c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1059_c7_936c_cond <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_936c_cond;
     result_MUX_uxn_opcodes_h_l1059_c7_936c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_936c_iftrue;
     result_MUX_uxn_opcodes_h_l1059_c7_936c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_936c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_936c_return_output := result_MUX_uxn_opcodes_h_l1059_c7_936c_return_output;

     -- Submodule level 83
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_20b5_iffalse := VAR_result_MUX_uxn_opcodes_h_l1059_c7_936c_return_output;
     -- result_MUX[uxn_opcodes_h_l1058_c7_20b5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1058_c7_20b5_cond <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_20b5_cond;
     result_MUX_uxn_opcodes_h_l1058_c7_20b5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_20b5_iftrue;
     result_MUX_uxn_opcodes_h_l1058_c7_20b5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_20b5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_20b5_return_output := result_MUX_uxn_opcodes_h_l1058_c7_20b5_return_output;

     -- Submodule level 84
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_06f5_iffalse := VAR_result_MUX_uxn_opcodes_h_l1058_c7_20b5_return_output;
     -- result_MUX[uxn_opcodes_h_l1057_c7_06f5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1057_c7_06f5_cond <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_06f5_cond;
     result_MUX_uxn_opcodes_h_l1057_c7_06f5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_06f5_iftrue;
     result_MUX_uxn_opcodes_h_l1057_c7_06f5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_06f5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_06f5_return_output := result_MUX_uxn_opcodes_h_l1057_c7_06f5_return_output;

     -- Submodule level 85
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_0f6c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1057_c7_06f5_return_output;
     -- result_MUX[uxn_opcodes_h_l1056_c7_0f6c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1056_c7_0f6c_cond <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_0f6c_cond;
     result_MUX_uxn_opcodes_h_l1056_c7_0f6c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_0f6c_iftrue;
     result_MUX_uxn_opcodes_h_l1056_c7_0f6c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_0f6c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_0f6c_return_output := result_MUX_uxn_opcodes_h_l1056_c7_0f6c_return_output;

     -- Submodule level 86
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_ddfe_iffalse := VAR_result_MUX_uxn_opcodes_h_l1056_c7_0f6c_return_output;
     -- result_MUX[uxn_opcodes_h_l1055_c7_ddfe] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1055_c7_ddfe_cond <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_ddfe_cond;
     result_MUX_uxn_opcodes_h_l1055_c7_ddfe_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_ddfe_iftrue;
     result_MUX_uxn_opcodes_h_l1055_c7_ddfe_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_ddfe_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_ddfe_return_output := result_MUX_uxn_opcodes_h_l1055_c7_ddfe_return_output;

     -- Submodule level 87
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_65f8_iffalse := VAR_result_MUX_uxn_opcodes_h_l1055_c7_ddfe_return_output;
     -- result_MUX[uxn_opcodes_h_l1054_c7_65f8] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1054_c7_65f8_cond <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_65f8_cond;
     result_MUX_uxn_opcodes_h_l1054_c7_65f8_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_65f8_iftrue;
     result_MUX_uxn_opcodes_h_l1054_c7_65f8_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_65f8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_65f8_return_output := result_MUX_uxn_opcodes_h_l1054_c7_65f8_return_output;

     -- Submodule level 88
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_e2a2_iffalse := VAR_result_MUX_uxn_opcodes_h_l1054_c7_65f8_return_output;
     -- result_MUX[uxn_opcodes_h_l1053_c7_e2a2] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1053_c7_e2a2_cond <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_e2a2_cond;
     result_MUX_uxn_opcodes_h_l1053_c7_e2a2_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_e2a2_iftrue;
     result_MUX_uxn_opcodes_h_l1053_c7_e2a2_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_e2a2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_e2a2_return_output := result_MUX_uxn_opcodes_h_l1053_c7_e2a2_return_output;

     -- Submodule level 89
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_592e_iffalse := VAR_result_MUX_uxn_opcodes_h_l1053_c7_e2a2_return_output;
     -- result_MUX[uxn_opcodes_h_l1052_c7_592e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1052_c7_592e_cond <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_592e_cond;
     result_MUX_uxn_opcodes_h_l1052_c7_592e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_592e_iftrue;
     result_MUX_uxn_opcodes_h_l1052_c7_592e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_592e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_592e_return_output := result_MUX_uxn_opcodes_h_l1052_c7_592e_return_output;

     -- Submodule level 90
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_ca7b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1052_c7_592e_return_output;
     -- result_MUX[uxn_opcodes_h_l1051_c7_ca7b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1051_c7_ca7b_cond <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_ca7b_cond;
     result_MUX_uxn_opcodes_h_l1051_c7_ca7b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_ca7b_iftrue;
     result_MUX_uxn_opcodes_h_l1051_c7_ca7b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_ca7b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_ca7b_return_output := result_MUX_uxn_opcodes_h_l1051_c7_ca7b_return_output;

     -- Submodule level 91
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_5874_iffalse := VAR_result_MUX_uxn_opcodes_h_l1051_c7_ca7b_return_output;
     -- result_MUX[uxn_opcodes_h_l1050_c7_5874] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1050_c7_5874_cond <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_5874_cond;
     result_MUX_uxn_opcodes_h_l1050_c7_5874_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_5874_iftrue;
     result_MUX_uxn_opcodes_h_l1050_c7_5874_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_5874_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_5874_return_output := result_MUX_uxn_opcodes_h_l1050_c7_5874_return_output;

     -- Submodule level 92
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_ef51_iffalse := VAR_result_MUX_uxn_opcodes_h_l1050_c7_5874_return_output;
     -- result_MUX[uxn_opcodes_h_l1049_c7_ef51] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1049_c7_ef51_cond <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_ef51_cond;
     result_MUX_uxn_opcodes_h_l1049_c7_ef51_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_ef51_iftrue;
     result_MUX_uxn_opcodes_h_l1049_c7_ef51_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_ef51_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_ef51_return_output := result_MUX_uxn_opcodes_h_l1049_c7_ef51_return_output;

     -- Submodule level 93
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_4547_iffalse := VAR_result_MUX_uxn_opcodes_h_l1049_c7_ef51_return_output;
     -- result_MUX[uxn_opcodes_h_l1048_c7_4547] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1048_c7_4547_cond <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_4547_cond;
     result_MUX_uxn_opcodes_h_l1048_c7_4547_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_4547_iftrue;
     result_MUX_uxn_opcodes_h_l1048_c7_4547_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_4547_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_4547_return_output := result_MUX_uxn_opcodes_h_l1048_c7_4547_return_output;

     -- Submodule level 94
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_1eda_iffalse := VAR_result_MUX_uxn_opcodes_h_l1048_c7_4547_return_output;
     -- result_MUX[uxn_opcodes_h_l1047_c7_1eda] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1047_c7_1eda_cond <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_1eda_cond;
     result_MUX_uxn_opcodes_h_l1047_c7_1eda_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_1eda_iftrue;
     result_MUX_uxn_opcodes_h_l1047_c7_1eda_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_1eda_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_1eda_return_output := result_MUX_uxn_opcodes_h_l1047_c7_1eda_return_output;

     -- Submodule level 95
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_f181_iffalse := VAR_result_MUX_uxn_opcodes_h_l1047_c7_1eda_return_output;
     -- result_MUX[uxn_opcodes_h_l1046_c7_f181] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1046_c7_f181_cond <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_f181_cond;
     result_MUX_uxn_opcodes_h_l1046_c7_f181_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_f181_iftrue;
     result_MUX_uxn_opcodes_h_l1046_c7_f181_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_f181_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_f181_return_output := result_MUX_uxn_opcodes_h_l1046_c7_f181_return_output;

     -- Submodule level 96
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_6655_iffalse := VAR_result_MUX_uxn_opcodes_h_l1046_c7_f181_return_output;
     -- result_MUX[uxn_opcodes_h_l1045_c7_6655] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1045_c7_6655_cond <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_6655_cond;
     result_MUX_uxn_opcodes_h_l1045_c7_6655_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_6655_iftrue;
     result_MUX_uxn_opcodes_h_l1045_c7_6655_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_6655_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_6655_return_output := result_MUX_uxn_opcodes_h_l1045_c7_6655_return_output;

     -- Submodule level 97
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_d6be_iffalse := VAR_result_MUX_uxn_opcodes_h_l1045_c7_6655_return_output;
     -- result_MUX[uxn_opcodes_h_l1044_c7_d6be] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1044_c7_d6be_cond <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_d6be_cond;
     result_MUX_uxn_opcodes_h_l1044_c7_d6be_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_d6be_iftrue;
     result_MUX_uxn_opcodes_h_l1044_c7_d6be_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_d6be_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_d6be_return_output := result_MUX_uxn_opcodes_h_l1044_c7_d6be_return_output;

     -- Submodule level 98
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_d00f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1044_c7_d6be_return_output;
     -- result_MUX[uxn_opcodes_h_l1043_c7_d00f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1043_c7_d00f_cond <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_d00f_cond;
     result_MUX_uxn_opcodes_h_l1043_c7_d00f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_d00f_iftrue;
     result_MUX_uxn_opcodes_h_l1043_c7_d00f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_d00f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_d00f_return_output := result_MUX_uxn_opcodes_h_l1043_c7_d00f_return_output;

     -- Submodule level 99
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_4e20_iffalse := VAR_result_MUX_uxn_opcodes_h_l1043_c7_d00f_return_output;
     -- result_MUX[uxn_opcodes_h_l1042_c7_4e20] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1042_c7_4e20_cond <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_4e20_cond;
     result_MUX_uxn_opcodes_h_l1042_c7_4e20_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_4e20_iftrue;
     result_MUX_uxn_opcodes_h_l1042_c7_4e20_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_4e20_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_4e20_return_output := result_MUX_uxn_opcodes_h_l1042_c7_4e20_return_output;

     -- Submodule level 100
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_6f18_iffalse := VAR_result_MUX_uxn_opcodes_h_l1042_c7_4e20_return_output;
     -- result_MUX[uxn_opcodes_h_l1041_c7_6f18] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1041_c7_6f18_cond <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_6f18_cond;
     result_MUX_uxn_opcodes_h_l1041_c7_6f18_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_6f18_iftrue;
     result_MUX_uxn_opcodes_h_l1041_c7_6f18_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_6f18_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_6f18_return_output := result_MUX_uxn_opcodes_h_l1041_c7_6f18_return_output;

     -- Submodule level 101
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_2e9a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1041_c7_6f18_return_output;
     -- result_MUX[uxn_opcodes_h_l1040_c7_2e9a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1040_c7_2e9a_cond <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_2e9a_cond;
     result_MUX_uxn_opcodes_h_l1040_c7_2e9a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_2e9a_iftrue;
     result_MUX_uxn_opcodes_h_l1040_c7_2e9a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_2e9a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_2e9a_return_output := result_MUX_uxn_opcodes_h_l1040_c7_2e9a_return_output;

     -- Submodule level 102
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_fbd1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1040_c7_2e9a_return_output;
     -- result_MUX[uxn_opcodes_h_l1039_c7_fbd1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1039_c7_fbd1_cond <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_fbd1_cond;
     result_MUX_uxn_opcodes_h_l1039_c7_fbd1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_fbd1_iftrue;
     result_MUX_uxn_opcodes_h_l1039_c7_fbd1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_fbd1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_fbd1_return_output := result_MUX_uxn_opcodes_h_l1039_c7_fbd1_return_output;

     -- Submodule level 103
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_a3f0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1039_c7_fbd1_return_output;
     -- result_MUX[uxn_opcodes_h_l1038_c7_a3f0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1038_c7_a3f0_cond <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_a3f0_cond;
     result_MUX_uxn_opcodes_h_l1038_c7_a3f0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_a3f0_iftrue;
     result_MUX_uxn_opcodes_h_l1038_c7_a3f0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_a3f0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_a3f0_return_output := result_MUX_uxn_opcodes_h_l1038_c7_a3f0_return_output;

     -- Submodule level 104
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_bc14_iffalse := VAR_result_MUX_uxn_opcodes_h_l1038_c7_a3f0_return_output;
     -- result_MUX[uxn_opcodes_h_l1037_c7_bc14] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1037_c7_bc14_cond <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_bc14_cond;
     result_MUX_uxn_opcodes_h_l1037_c7_bc14_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_bc14_iftrue;
     result_MUX_uxn_opcodes_h_l1037_c7_bc14_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_bc14_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_bc14_return_output := result_MUX_uxn_opcodes_h_l1037_c7_bc14_return_output;

     -- Submodule level 105
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_1dcb_iffalse := VAR_result_MUX_uxn_opcodes_h_l1037_c7_bc14_return_output;
     -- result_MUX[uxn_opcodes_h_l1036_c7_1dcb] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1036_c7_1dcb_cond <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_1dcb_cond;
     result_MUX_uxn_opcodes_h_l1036_c7_1dcb_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_1dcb_iftrue;
     result_MUX_uxn_opcodes_h_l1036_c7_1dcb_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_1dcb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_1dcb_return_output := result_MUX_uxn_opcodes_h_l1036_c7_1dcb_return_output;

     -- Submodule level 106
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_14fa_iffalse := VAR_result_MUX_uxn_opcodes_h_l1036_c7_1dcb_return_output;
     -- result_MUX[uxn_opcodes_h_l1035_c7_14fa] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1035_c7_14fa_cond <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_14fa_cond;
     result_MUX_uxn_opcodes_h_l1035_c7_14fa_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_14fa_iftrue;
     result_MUX_uxn_opcodes_h_l1035_c7_14fa_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_14fa_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_14fa_return_output := result_MUX_uxn_opcodes_h_l1035_c7_14fa_return_output;

     -- Submodule level 107
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_9bd9_iffalse := VAR_result_MUX_uxn_opcodes_h_l1035_c7_14fa_return_output;
     -- result_MUX[uxn_opcodes_h_l1034_c7_9bd9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1034_c7_9bd9_cond <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_9bd9_cond;
     result_MUX_uxn_opcodes_h_l1034_c7_9bd9_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_9bd9_iftrue;
     result_MUX_uxn_opcodes_h_l1034_c7_9bd9_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_9bd9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_9bd9_return_output := result_MUX_uxn_opcodes_h_l1034_c7_9bd9_return_output;

     -- Submodule level 108
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_fd73_iffalse := VAR_result_MUX_uxn_opcodes_h_l1034_c7_9bd9_return_output;
     -- result_MUX[uxn_opcodes_h_l1033_c7_fd73] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1033_c7_fd73_cond <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_fd73_cond;
     result_MUX_uxn_opcodes_h_l1033_c7_fd73_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_fd73_iftrue;
     result_MUX_uxn_opcodes_h_l1033_c7_fd73_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_fd73_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_fd73_return_output := result_MUX_uxn_opcodes_h_l1033_c7_fd73_return_output;

     -- Submodule level 109
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_aac0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1033_c7_fd73_return_output;
     -- result_MUX[uxn_opcodes_h_l1032_c7_aac0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1032_c7_aac0_cond <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_aac0_cond;
     result_MUX_uxn_opcodes_h_l1032_c7_aac0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_aac0_iftrue;
     result_MUX_uxn_opcodes_h_l1032_c7_aac0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_aac0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_aac0_return_output := result_MUX_uxn_opcodes_h_l1032_c7_aac0_return_output;

     -- Submodule level 110
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_503a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1032_c7_aac0_return_output;
     -- result_MUX[uxn_opcodes_h_l1031_c7_503a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1031_c7_503a_cond <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_503a_cond;
     result_MUX_uxn_opcodes_h_l1031_c7_503a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_503a_iftrue;
     result_MUX_uxn_opcodes_h_l1031_c7_503a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_503a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_503a_return_output := result_MUX_uxn_opcodes_h_l1031_c7_503a_return_output;

     -- Submodule level 111
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_6654_iffalse := VAR_result_MUX_uxn_opcodes_h_l1031_c7_503a_return_output;
     -- result_MUX[uxn_opcodes_h_l1030_c7_6654] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1030_c7_6654_cond <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_6654_cond;
     result_MUX_uxn_opcodes_h_l1030_c7_6654_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_6654_iftrue;
     result_MUX_uxn_opcodes_h_l1030_c7_6654_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_6654_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_6654_return_output := result_MUX_uxn_opcodes_h_l1030_c7_6654_return_output;

     -- Submodule level 112
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_7790_iffalse := VAR_result_MUX_uxn_opcodes_h_l1030_c7_6654_return_output;
     -- result_MUX[uxn_opcodes_h_l1029_c7_7790] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1029_c7_7790_cond <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_7790_cond;
     result_MUX_uxn_opcodes_h_l1029_c7_7790_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_7790_iftrue;
     result_MUX_uxn_opcodes_h_l1029_c7_7790_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_7790_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_7790_return_output := result_MUX_uxn_opcodes_h_l1029_c7_7790_return_output;

     -- Submodule level 113
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_bee8_iffalse := VAR_result_MUX_uxn_opcodes_h_l1029_c7_7790_return_output;
     -- result_MUX[uxn_opcodes_h_l1028_c7_bee8] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1028_c7_bee8_cond <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_bee8_cond;
     result_MUX_uxn_opcodes_h_l1028_c7_bee8_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_bee8_iftrue;
     result_MUX_uxn_opcodes_h_l1028_c7_bee8_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_bee8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_bee8_return_output := result_MUX_uxn_opcodes_h_l1028_c7_bee8_return_output;

     -- Submodule level 114
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_5bd6_iffalse := VAR_result_MUX_uxn_opcodes_h_l1028_c7_bee8_return_output;
     -- result_MUX[uxn_opcodes_h_l1027_c7_5bd6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1027_c7_5bd6_cond <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_5bd6_cond;
     result_MUX_uxn_opcodes_h_l1027_c7_5bd6_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_5bd6_iftrue;
     result_MUX_uxn_opcodes_h_l1027_c7_5bd6_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_5bd6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_5bd6_return_output := result_MUX_uxn_opcodes_h_l1027_c7_5bd6_return_output;

     -- Submodule level 115
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_78e8_iffalse := VAR_result_MUX_uxn_opcodes_h_l1027_c7_5bd6_return_output;
     -- result_MUX[uxn_opcodes_h_l1026_c7_78e8] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1026_c7_78e8_cond <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_78e8_cond;
     result_MUX_uxn_opcodes_h_l1026_c7_78e8_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_78e8_iftrue;
     result_MUX_uxn_opcodes_h_l1026_c7_78e8_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_78e8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_78e8_return_output := result_MUX_uxn_opcodes_h_l1026_c7_78e8_return_output;

     -- Submodule level 116
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_12f4_iffalse := VAR_result_MUX_uxn_opcodes_h_l1026_c7_78e8_return_output;
     -- result_MUX[uxn_opcodes_h_l1025_c7_12f4] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1025_c7_12f4_cond <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_12f4_cond;
     result_MUX_uxn_opcodes_h_l1025_c7_12f4_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_12f4_iftrue;
     result_MUX_uxn_opcodes_h_l1025_c7_12f4_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_12f4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_12f4_return_output := result_MUX_uxn_opcodes_h_l1025_c7_12f4_return_output;

     -- Submodule level 117
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_64ab_iffalse := VAR_result_MUX_uxn_opcodes_h_l1025_c7_12f4_return_output;
     -- result_MUX[uxn_opcodes_h_l1024_c7_64ab] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1024_c7_64ab_cond <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_64ab_cond;
     result_MUX_uxn_opcodes_h_l1024_c7_64ab_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_64ab_iftrue;
     result_MUX_uxn_opcodes_h_l1024_c7_64ab_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_64ab_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_64ab_return_output := result_MUX_uxn_opcodes_h_l1024_c7_64ab_return_output;

     -- Submodule level 118
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_3e0c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1024_c7_64ab_return_output;
     -- result_MUX[uxn_opcodes_h_l1023_c7_3e0c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1023_c7_3e0c_cond <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_3e0c_cond;
     result_MUX_uxn_opcodes_h_l1023_c7_3e0c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_3e0c_iftrue;
     result_MUX_uxn_opcodes_h_l1023_c7_3e0c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_3e0c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_3e0c_return_output := result_MUX_uxn_opcodes_h_l1023_c7_3e0c_return_output;

     -- Submodule level 119
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_0224_iffalse := VAR_result_MUX_uxn_opcodes_h_l1023_c7_3e0c_return_output;
     -- result_MUX[uxn_opcodes_h_l1022_c7_0224] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1022_c7_0224_cond <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_0224_cond;
     result_MUX_uxn_opcodes_h_l1022_c7_0224_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_0224_iftrue;
     result_MUX_uxn_opcodes_h_l1022_c7_0224_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_0224_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_0224_return_output := result_MUX_uxn_opcodes_h_l1022_c7_0224_return_output;

     -- Submodule level 120
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_48ee_iffalse := VAR_result_MUX_uxn_opcodes_h_l1022_c7_0224_return_output;
     -- result_MUX[uxn_opcodes_h_l1021_c7_48ee] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1021_c7_48ee_cond <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_48ee_cond;
     result_MUX_uxn_opcodes_h_l1021_c7_48ee_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_48ee_iftrue;
     result_MUX_uxn_opcodes_h_l1021_c7_48ee_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_48ee_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_48ee_return_output := result_MUX_uxn_opcodes_h_l1021_c7_48ee_return_output;

     -- Submodule level 121
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_fed0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1021_c7_48ee_return_output;
     -- result_MUX[uxn_opcodes_h_l1020_c7_fed0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1020_c7_fed0_cond <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_fed0_cond;
     result_MUX_uxn_opcodes_h_l1020_c7_fed0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_fed0_iftrue;
     result_MUX_uxn_opcodes_h_l1020_c7_fed0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_fed0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_fed0_return_output := result_MUX_uxn_opcodes_h_l1020_c7_fed0_return_output;

     -- Submodule level 122
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_7f82_iffalse := VAR_result_MUX_uxn_opcodes_h_l1020_c7_fed0_return_output;
     -- result_MUX[uxn_opcodes_h_l1019_c7_7f82] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1019_c7_7f82_cond <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_7f82_cond;
     result_MUX_uxn_opcodes_h_l1019_c7_7f82_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_7f82_iftrue;
     result_MUX_uxn_opcodes_h_l1019_c7_7f82_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_7f82_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_7f82_return_output := result_MUX_uxn_opcodes_h_l1019_c7_7f82_return_output;

     -- Submodule level 123
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_a1e6_iffalse := VAR_result_MUX_uxn_opcodes_h_l1019_c7_7f82_return_output;
     -- result_MUX[uxn_opcodes_h_l1018_c7_a1e6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1018_c7_a1e6_cond <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_a1e6_cond;
     result_MUX_uxn_opcodes_h_l1018_c7_a1e6_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_a1e6_iftrue;
     result_MUX_uxn_opcodes_h_l1018_c7_a1e6_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_a1e6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_a1e6_return_output := result_MUX_uxn_opcodes_h_l1018_c7_a1e6_return_output;

     -- Submodule level 124
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_dcaf_iffalse := VAR_result_MUX_uxn_opcodes_h_l1018_c7_a1e6_return_output;
     -- result_MUX[uxn_opcodes_h_l1017_c7_dcaf] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1017_c7_dcaf_cond <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_dcaf_cond;
     result_MUX_uxn_opcodes_h_l1017_c7_dcaf_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_dcaf_iftrue;
     result_MUX_uxn_opcodes_h_l1017_c7_dcaf_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_dcaf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_dcaf_return_output := result_MUX_uxn_opcodes_h_l1017_c7_dcaf_return_output;

     -- Submodule level 125
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_15d0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1017_c7_dcaf_return_output;
     -- result_MUX[uxn_opcodes_h_l1016_c7_15d0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1016_c7_15d0_cond <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_15d0_cond;
     result_MUX_uxn_opcodes_h_l1016_c7_15d0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_15d0_iftrue;
     result_MUX_uxn_opcodes_h_l1016_c7_15d0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_15d0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_15d0_return_output := result_MUX_uxn_opcodes_h_l1016_c7_15d0_return_output;

     -- Submodule level 126
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_c848_iffalse := VAR_result_MUX_uxn_opcodes_h_l1016_c7_15d0_return_output;
     -- result_MUX[uxn_opcodes_h_l1015_c7_c848] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1015_c7_c848_cond <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_c848_cond;
     result_MUX_uxn_opcodes_h_l1015_c7_c848_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_c848_iftrue;
     result_MUX_uxn_opcodes_h_l1015_c7_c848_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_c848_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_c848_return_output := result_MUX_uxn_opcodes_h_l1015_c7_c848_return_output;

     -- Submodule level 127
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_039d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1015_c7_c848_return_output;
     -- result_MUX[uxn_opcodes_h_l1014_c7_039d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1014_c7_039d_cond <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_039d_cond;
     result_MUX_uxn_opcodes_h_l1014_c7_039d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_039d_iftrue;
     result_MUX_uxn_opcodes_h_l1014_c7_039d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_039d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_039d_return_output := result_MUX_uxn_opcodes_h_l1014_c7_039d_return_output;

     -- Submodule level 128
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_2181_iffalse := VAR_result_MUX_uxn_opcodes_h_l1014_c7_039d_return_output;
     -- result_MUX[uxn_opcodes_h_l1013_c7_2181] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1013_c7_2181_cond <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_2181_cond;
     result_MUX_uxn_opcodes_h_l1013_c7_2181_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_2181_iftrue;
     result_MUX_uxn_opcodes_h_l1013_c7_2181_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_2181_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_2181_return_output := result_MUX_uxn_opcodes_h_l1013_c7_2181_return_output;

     -- Submodule level 129
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_7e5e_iffalse := VAR_result_MUX_uxn_opcodes_h_l1013_c7_2181_return_output;
     -- result_MUX[uxn_opcodes_h_l1012_c7_7e5e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1012_c7_7e5e_cond <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_7e5e_cond;
     result_MUX_uxn_opcodes_h_l1012_c7_7e5e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_7e5e_iftrue;
     result_MUX_uxn_opcodes_h_l1012_c7_7e5e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_7e5e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_7e5e_return_output := result_MUX_uxn_opcodes_h_l1012_c7_7e5e_return_output;

     -- Submodule level 130
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_e581_iffalse := VAR_result_MUX_uxn_opcodes_h_l1012_c7_7e5e_return_output;
     -- result_MUX[uxn_opcodes_h_l1011_c7_e581] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1011_c7_e581_cond <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_e581_cond;
     result_MUX_uxn_opcodes_h_l1011_c7_e581_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_e581_iftrue;
     result_MUX_uxn_opcodes_h_l1011_c7_e581_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_e581_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_e581_return_output := result_MUX_uxn_opcodes_h_l1011_c7_e581_return_output;

     -- Submodule level 131
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_92e8_iffalse := VAR_result_MUX_uxn_opcodes_h_l1011_c7_e581_return_output;
     -- result_MUX[uxn_opcodes_h_l1010_c7_92e8] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1010_c7_92e8_cond <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_92e8_cond;
     result_MUX_uxn_opcodes_h_l1010_c7_92e8_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_92e8_iftrue;
     result_MUX_uxn_opcodes_h_l1010_c7_92e8_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_92e8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_92e8_return_output := result_MUX_uxn_opcodes_h_l1010_c7_92e8_return_output;

     -- Submodule level 132
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_6cc6_iffalse := VAR_result_MUX_uxn_opcodes_h_l1010_c7_92e8_return_output;
     -- result_MUX[uxn_opcodes_h_l1009_c7_6cc6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1009_c7_6cc6_cond <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_6cc6_cond;
     result_MUX_uxn_opcodes_h_l1009_c7_6cc6_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_6cc6_iftrue;
     result_MUX_uxn_opcodes_h_l1009_c7_6cc6_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_6cc6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_6cc6_return_output := result_MUX_uxn_opcodes_h_l1009_c7_6cc6_return_output;

     -- Submodule level 133
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_ec40_iffalse := VAR_result_MUX_uxn_opcodes_h_l1009_c7_6cc6_return_output;
     -- result_MUX[uxn_opcodes_h_l1008_c7_ec40] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1008_c7_ec40_cond <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_ec40_cond;
     result_MUX_uxn_opcodes_h_l1008_c7_ec40_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_ec40_iftrue;
     result_MUX_uxn_opcodes_h_l1008_c7_ec40_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_ec40_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_ec40_return_output := result_MUX_uxn_opcodes_h_l1008_c7_ec40_return_output;

     -- Submodule level 134
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_35d0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1008_c7_ec40_return_output;
     -- result_MUX[uxn_opcodes_h_l1007_c7_35d0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1007_c7_35d0_cond <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_35d0_cond;
     result_MUX_uxn_opcodes_h_l1007_c7_35d0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_35d0_iftrue;
     result_MUX_uxn_opcodes_h_l1007_c7_35d0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_35d0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_35d0_return_output := result_MUX_uxn_opcodes_h_l1007_c7_35d0_return_output;

     -- Submodule level 135
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_1089_iffalse := VAR_result_MUX_uxn_opcodes_h_l1007_c7_35d0_return_output;
     -- result_MUX[uxn_opcodes_h_l1006_c7_1089] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1006_c7_1089_cond <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_1089_cond;
     result_MUX_uxn_opcodes_h_l1006_c7_1089_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_1089_iftrue;
     result_MUX_uxn_opcodes_h_l1006_c7_1089_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_1089_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_1089_return_output := result_MUX_uxn_opcodes_h_l1006_c7_1089_return_output;

     -- Submodule level 136
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_d021_iffalse := VAR_result_MUX_uxn_opcodes_h_l1006_c7_1089_return_output;
     -- result_MUX[uxn_opcodes_h_l1005_c7_d021] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1005_c7_d021_cond <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_d021_cond;
     result_MUX_uxn_opcodes_h_l1005_c7_d021_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_d021_iftrue;
     result_MUX_uxn_opcodes_h_l1005_c7_d021_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_d021_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_d021_return_output := result_MUX_uxn_opcodes_h_l1005_c7_d021_return_output;

     -- Submodule level 137
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_0f5b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1005_c7_d021_return_output;
     -- result_MUX[uxn_opcodes_h_l1004_c7_0f5b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1004_c7_0f5b_cond <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_0f5b_cond;
     result_MUX_uxn_opcodes_h_l1004_c7_0f5b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_0f5b_iftrue;
     result_MUX_uxn_opcodes_h_l1004_c7_0f5b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_0f5b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_0f5b_return_output := result_MUX_uxn_opcodes_h_l1004_c7_0f5b_return_output;

     -- Submodule level 138
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_db9b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1004_c7_0f5b_return_output;
     -- result_MUX[uxn_opcodes_h_l1003_c7_db9b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1003_c7_db9b_cond <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_db9b_cond;
     result_MUX_uxn_opcodes_h_l1003_c7_db9b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_db9b_iftrue;
     result_MUX_uxn_opcodes_h_l1003_c7_db9b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_db9b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_db9b_return_output := result_MUX_uxn_opcodes_h_l1003_c7_db9b_return_output;

     -- Submodule level 139
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_570b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1003_c7_db9b_return_output;
     -- result_MUX[uxn_opcodes_h_l1002_c7_570b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1002_c7_570b_cond <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_570b_cond;
     result_MUX_uxn_opcodes_h_l1002_c7_570b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_570b_iftrue;
     result_MUX_uxn_opcodes_h_l1002_c7_570b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_570b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_570b_return_output := result_MUX_uxn_opcodes_h_l1002_c7_570b_return_output;

     -- Submodule level 140
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_330c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1002_c7_570b_return_output;
     -- result_MUX[uxn_opcodes_h_l1001_c7_330c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1001_c7_330c_cond <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_330c_cond;
     result_MUX_uxn_opcodes_h_l1001_c7_330c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_330c_iftrue;
     result_MUX_uxn_opcodes_h_l1001_c7_330c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_330c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_330c_return_output := result_MUX_uxn_opcodes_h_l1001_c7_330c_return_output;

     -- Submodule level 141
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_d84a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1001_c7_330c_return_output;
     -- result_MUX[uxn_opcodes_h_l1000_c2_d84a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1000_c2_d84a_cond <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_d84a_cond;
     result_MUX_uxn_opcodes_h_l1000_c2_d84a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_d84a_iftrue;
     result_MUX_uxn_opcodes_h_l1000_c2_d84a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_d84a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_d84a_return_output := result_MUX_uxn_opcodes_h_l1000_c2_d84a_return_output;

     -- Submodule level 142
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l1000_c2_d84a_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l1000_c2_d84a_return_output;
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
