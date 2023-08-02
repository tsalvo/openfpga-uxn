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
-- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_d0fb]
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_5059]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1000_c2_7834]
signal result_MUX_uxn_opcodes_h_l1000_c2_7834_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_7834_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_7834_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_7834_return_output : unsigned(0 downto 0);

-- opc_brk[uxn_opcodes_h_l1000_c34_6db9]
signal opc_brk_uxn_opcodes_h_l1000_c34_6db9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_9da7]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_5d53]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_82d3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1001_c7_5059]
signal result_MUX_uxn_opcodes_h_l1001_c7_5059_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_5059_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_5059_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_5059_return_output : unsigned(0 downto 0);

-- opc_jci[uxn_opcodes_h_l1001_c39_362a]
signal opc_jci_uxn_opcodes_h_l1001_c39_362a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_362a_stack_index : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_362a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_c3d3]
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_3f82]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_5b9e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1002_c7_82d3]
signal result_MUX_uxn_opcodes_h_l1002_c7_82d3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_82d3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_82d3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_82d3_return_output : unsigned(0 downto 0);

-- opc_jmi[uxn_opcodes_h_l1002_c39_4f20]
signal opc_jmi_uxn_opcodes_h_l1002_c39_4f20_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmi_uxn_opcodes_h_l1002_c39_4f20_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_472e]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_4939]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_5e95]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1003_c7_5b9e]
signal result_MUX_uxn_opcodes_h_l1003_c7_5b9e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_5b9e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_5b9e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_5b9e_return_output : unsigned(0 downto 0);

-- opc_jsi[uxn_opcodes_h_l1003_c39_5cad]
signal opc_jsi_uxn_opcodes_h_l1003_c39_5cad_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_5cad_ins : unsigned(7 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_5cad_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_3f69]
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_45d1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_04b3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1004_c7_5e95]
signal result_MUX_uxn_opcodes_h_l1004_c7_5e95_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_5e95_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_5e95_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_5e95_return_output : unsigned(0 downto 0);

-- opc_lit[uxn_opcodes_h_l1004_c39_0c05]
signal opc_lit_uxn_opcodes_h_l1004_c39_0c05_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_0c05_stack_index : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_0c05_ins : unsigned(7 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_0c05_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_8e75]
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_e95d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_af65]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1005_c7_04b3]
signal result_MUX_uxn_opcodes_h_l1005_c7_04b3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_04b3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_04b3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_04b3_return_output : unsigned(0 downto 0);

-- opc_lit2[uxn_opcodes_h_l1005_c39_25ab]
signal opc_lit2_uxn_opcodes_h_l1005_c39_25ab_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_25ab_stack_index : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_25ab_ins : unsigned(7 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_25ab_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_c3ec]
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_4a76]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_9f80]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1006_c7_af65]
signal result_MUX_uxn_opcodes_h_l1006_c7_af65_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_af65_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_af65_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_af65_return_output : unsigned(0 downto 0);

-- opc_litr[uxn_opcodes_h_l1006_c39_db2c]
signal opc_litr_uxn_opcodes_h_l1006_c39_db2c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_db2c_stack_index : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_db2c_ins : unsigned(7 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_db2c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_1184]
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_09ab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_526d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1007_c7_9f80]
signal result_MUX_uxn_opcodes_h_l1007_c7_9f80_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_9f80_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_9f80_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_9f80_return_output : unsigned(0 downto 0);

-- opc_lit2r[uxn_opcodes_h_l1007_c39_4136]
signal opc_lit2r_uxn_opcodes_h_l1007_c39_4136_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_4136_stack_index : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_4136_ins : unsigned(7 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_4136_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_a427]
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_9e3f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_a1a7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1008_c7_526d]
signal result_MUX_uxn_opcodes_h_l1008_c7_526d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_526d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_526d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_526d_return_output : unsigned(0 downto 0);

-- opc_inc[uxn_opcodes_h_l1008_c39_edb1]
signal opc_inc_uxn_opcodes_h_l1008_c39_edb1_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_edb1_stack_index : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_edb1_ins : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_edb1_k : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_edb1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_307d]
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_3258]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_8bb9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1009_c7_a1a7]
signal result_MUX_uxn_opcodes_h_l1009_c7_a1a7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_a1a7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_a1a7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_a1a7_return_output : unsigned(0 downto 0);

-- opc_inc2[uxn_opcodes_h_l1009_c39_0cdf]
signal opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_stack_index : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_ins : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_k : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_acad]
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_aeda]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_bd86]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1010_c7_8bb9]
signal result_MUX_uxn_opcodes_h_l1010_c7_8bb9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_8bb9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_8bb9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_8bb9_return_output : unsigned(0 downto 0);

-- opc_pop[uxn_opcodes_h_l1010_c39_d627]
signal opc_pop_uxn_opcodes_h_l1010_c39_d627_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_d627_stack_index : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_d627_ins : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_d627_k : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_d627_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_586b]
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_1175]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_b1e0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1011_c7_bd86]
signal result_MUX_uxn_opcodes_h_l1011_c7_bd86_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_bd86_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_bd86_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_bd86_return_output : unsigned(0 downto 0);

-- opc_pop2[uxn_opcodes_h_l1011_c39_196a]
signal opc_pop2_uxn_opcodes_h_l1011_c39_196a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_196a_stack_index : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_196a_ins : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_196a_k : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_196a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_8b73]
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_ae00]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_fde3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1012_c7_b1e0]
signal result_MUX_uxn_opcodes_h_l1012_c7_b1e0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_b1e0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_b1e0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_b1e0_return_output : unsigned(0 downto 0);

-- opc_nip[uxn_opcodes_h_l1012_c39_f246]
signal opc_nip_uxn_opcodes_h_l1012_c39_f246_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_f246_stack_index : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_f246_ins : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_f246_k : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_f246_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_3926]
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_72d7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_6c5b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1013_c7_fde3]
signal result_MUX_uxn_opcodes_h_l1013_c7_fde3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_fde3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_fde3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_fde3_return_output : unsigned(0 downto 0);

-- opc_nip2[uxn_opcodes_h_l1013_c39_e112]
signal opc_nip2_uxn_opcodes_h_l1013_c39_e112_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_e112_stack_index : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_e112_ins : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_e112_k : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_e112_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_a018]
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_49ec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_f040]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1014_c7_6c5b]
signal result_MUX_uxn_opcodes_h_l1014_c7_6c5b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_6c5b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_6c5b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_6c5b_return_output : unsigned(0 downto 0);

-- opc_swp[uxn_opcodes_h_l1014_c39_c5fd]
signal opc_swp_uxn_opcodes_h_l1014_c39_c5fd_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_c5fd_stack_index : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_c5fd_ins : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_c5fd_k : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_c5fd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_7675]
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_01fc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_beeb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1015_c7_f040]
signal result_MUX_uxn_opcodes_h_l1015_c7_f040_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_f040_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_f040_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_f040_return_output : unsigned(0 downto 0);

-- opc_swp2[uxn_opcodes_h_l1015_c39_e1ac]
signal opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_stack_index : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_ins : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_k : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_f5ef]
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_a899]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_dfe5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1016_c7_beeb]
signal result_MUX_uxn_opcodes_h_l1016_c7_beeb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_beeb_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_beeb_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_beeb_return_output : unsigned(0 downto 0);

-- opc_rot[uxn_opcodes_h_l1016_c39_5b39]
signal opc_rot_uxn_opcodes_h_l1016_c39_5b39_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_5b39_stack_index : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_5b39_ins : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_5b39_k : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_5b39_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_42dc]
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_4dd6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_4769]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1017_c7_dfe5]
signal result_MUX_uxn_opcodes_h_l1017_c7_dfe5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_dfe5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_dfe5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_dfe5_return_output : unsigned(0 downto 0);

-- opc_rot2[uxn_opcodes_h_l1017_c39_3178]
signal opc_rot2_uxn_opcodes_h_l1017_c39_3178_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_3178_stack_index : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_3178_ins : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_3178_k : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_3178_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_52d2]
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_2745]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_c4ef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1018_c7_4769]
signal result_MUX_uxn_opcodes_h_l1018_c7_4769_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_4769_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_4769_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_4769_return_output : unsigned(0 downto 0);

-- opc_dup[uxn_opcodes_h_l1018_c39_27b0]
signal opc_dup_uxn_opcodes_h_l1018_c39_27b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_27b0_stack_index : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_27b0_ins : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_27b0_k : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_27b0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_f0ef]
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_8564]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_44ea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1019_c7_c4ef]
signal result_MUX_uxn_opcodes_h_l1019_c7_c4ef_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_c4ef_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_c4ef_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_c4ef_return_output : unsigned(0 downto 0);

-- opc_dup2[uxn_opcodes_h_l1019_c39_4f8c]
signal opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_stack_index : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_ins : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_k : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_ca87]
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_b57c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_aab0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1020_c7_44ea]
signal result_MUX_uxn_opcodes_h_l1020_c7_44ea_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_44ea_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_44ea_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_44ea_return_output : unsigned(0 downto 0);

-- opc_ovr[uxn_opcodes_h_l1020_c39_8c15]
signal opc_ovr_uxn_opcodes_h_l1020_c39_8c15_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_8c15_stack_index : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_8c15_ins : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_8c15_k : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_8c15_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_71db]
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_67f0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_e6ee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1021_c7_aab0]
signal result_MUX_uxn_opcodes_h_l1021_c7_aab0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_aab0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_aab0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_aab0_return_output : unsigned(0 downto 0);

-- opc_ovr2[uxn_opcodes_h_l1021_c39_b5c3]
signal opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_stack_index : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_ins : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_k : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_c6f5]
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_7117]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_7adc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1022_c7_e6ee]
signal result_MUX_uxn_opcodes_h_l1022_c7_e6ee_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_e6ee_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_e6ee_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_e6ee_return_output : unsigned(0 downto 0);

-- opc_equ[uxn_opcodes_h_l1022_c39_c3f0]
signal opc_equ_uxn_opcodes_h_l1022_c39_c3f0_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_c3f0_stack_index : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_c3f0_ins : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_c3f0_k : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_c3f0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_4959]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_534f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_4346]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1023_c7_7adc]
signal result_MUX_uxn_opcodes_h_l1023_c7_7adc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_7adc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_7adc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_7adc_return_output : unsigned(0 downto 0);

-- opc_equ2[uxn_opcodes_h_l1023_c39_242e]
signal opc_equ2_uxn_opcodes_h_l1023_c39_242e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_242e_stack_index : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_242e_ins : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_242e_k : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_242e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_1d72]
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_9ea8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_d961]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1024_c7_4346]
signal result_MUX_uxn_opcodes_h_l1024_c7_4346_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_4346_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_4346_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_4346_return_output : unsigned(0 downto 0);

-- opc_neq[uxn_opcodes_h_l1024_c39_986c]
signal opc_neq_uxn_opcodes_h_l1024_c39_986c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_986c_stack_index : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_986c_ins : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_986c_k : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_986c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_91e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_ef4b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_d86d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1025_c7_d961]
signal result_MUX_uxn_opcodes_h_l1025_c7_d961_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_d961_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_d961_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_d961_return_output : unsigned(0 downto 0);

-- opc_neq2[uxn_opcodes_h_l1025_c39_268c]
signal opc_neq2_uxn_opcodes_h_l1025_c39_268c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_268c_stack_index : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_268c_ins : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_268c_k : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_268c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_7cef]
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_ad20]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_9a9f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1026_c7_d86d]
signal result_MUX_uxn_opcodes_h_l1026_c7_d86d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_d86d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_d86d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_d86d_return_output : unsigned(0 downto 0);

-- opc_gth[uxn_opcodes_h_l1026_c39_4552]
signal opc_gth_uxn_opcodes_h_l1026_c39_4552_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_4552_stack_index : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_4552_ins : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_4552_k : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_4552_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_8d6c]
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_9e75]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_8a4b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1027_c7_9a9f]
signal result_MUX_uxn_opcodes_h_l1027_c7_9a9f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_9a9f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_9a9f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_9a9f_return_output : unsigned(0 downto 0);

-- opc_gth2[uxn_opcodes_h_l1027_c39_721a]
signal opc_gth2_uxn_opcodes_h_l1027_c39_721a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_721a_stack_index : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_721a_ins : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_721a_k : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_721a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_0f04]
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_7b43]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_b1a2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1028_c7_8a4b]
signal result_MUX_uxn_opcodes_h_l1028_c7_8a4b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_8a4b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_8a4b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_8a4b_return_output : unsigned(0 downto 0);

-- opc_lth[uxn_opcodes_h_l1028_c39_13bf]
signal opc_lth_uxn_opcodes_h_l1028_c39_13bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_13bf_stack_index : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_13bf_ins : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_13bf_k : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_13bf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_0b75]
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_f6e9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_e28b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1029_c7_b1a2]
signal result_MUX_uxn_opcodes_h_l1029_c7_b1a2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_b1a2_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_b1a2_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_b1a2_return_output : unsigned(0 downto 0);

-- opc_lth2[uxn_opcodes_h_l1029_c39_76b0]
signal opc_lth2_uxn_opcodes_h_l1029_c39_76b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_76b0_stack_index : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_76b0_ins : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_76b0_k : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_76b0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_1984]
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_9c1c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_0198]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1030_c7_e28b]
signal result_MUX_uxn_opcodes_h_l1030_c7_e28b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_e28b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_e28b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_e28b_return_output : unsigned(0 downto 0);

-- opc_jmp[uxn_opcodes_h_l1030_c39_443c]
signal opc_jmp_uxn_opcodes_h_l1030_c39_443c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_443c_stack_index : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_443c_ins : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_443c_k : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_443c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_d6e5]
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_3038]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_12bf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1031_c7_0198]
signal result_MUX_uxn_opcodes_h_l1031_c7_0198_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_0198_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_0198_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_0198_return_output : unsigned(0 downto 0);

-- opc_jmp2[uxn_opcodes_h_l1031_c39_761c]
signal opc_jmp2_uxn_opcodes_h_l1031_c39_761c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_761c_stack_index : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_761c_ins : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_761c_k : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_761c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_9e37]
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_90ee]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_ce7a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1032_c7_12bf]
signal result_MUX_uxn_opcodes_h_l1032_c7_12bf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_12bf_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_12bf_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_12bf_return_output : unsigned(0 downto 0);

-- opc_jcn[uxn_opcodes_h_l1032_c39_9630]
signal opc_jcn_uxn_opcodes_h_l1032_c39_9630_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_9630_stack_index : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_9630_ins : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_9630_k : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_9630_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_264f]
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_5a17]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_ad42]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1033_c7_ce7a]
signal result_MUX_uxn_opcodes_h_l1033_c7_ce7a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_ce7a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_ce7a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_ce7a_return_output : unsigned(0 downto 0);

-- opc_jcn2[uxn_opcodes_h_l1033_c39_4ead]
signal opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_stack_index : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_ins : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_k : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_4464]
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_85e1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_2367]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1034_c7_ad42]
signal result_MUX_uxn_opcodes_h_l1034_c7_ad42_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_ad42_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_ad42_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_ad42_return_output : unsigned(0 downto 0);

-- opc_jsr[uxn_opcodes_h_l1034_c39_4563]
signal opc_jsr_uxn_opcodes_h_l1034_c39_4563_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_4563_stack_index : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_4563_ins : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_4563_k : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_4563_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_285f]
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_13bd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_dbbe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1035_c7_2367]
signal result_MUX_uxn_opcodes_h_l1035_c7_2367_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_2367_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_2367_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_2367_return_output : unsigned(0 downto 0);

-- opc_jsr2[uxn_opcodes_h_l1035_c39_7497]
signal opc_jsr2_uxn_opcodes_h_l1035_c39_7497_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_7497_stack_index : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_7497_ins : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_7497_k : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_7497_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_1eb4]
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_f19e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_b6ac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1036_c7_dbbe]
signal result_MUX_uxn_opcodes_h_l1036_c7_dbbe_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_dbbe_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_dbbe_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_dbbe_return_output : unsigned(0 downto 0);

-- opc_sth[uxn_opcodes_h_l1036_c39_6964]
signal opc_sth_uxn_opcodes_h_l1036_c39_6964_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_6964_stack_index : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_6964_ins : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_6964_k : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_6964_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_05b8]
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_4072]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_f181]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1037_c7_b6ac]
signal result_MUX_uxn_opcodes_h_l1037_c7_b6ac_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_b6ac_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_b6ac_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_b6ac_return_output : unsigned(0 downto 0);

-- opc_sth2[uxn_opcodes_h_l1037_c39_84de]
signal opc_sth2_uxn_opcodes_h_l1037_c39_84de_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_84de_stack_index : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_84de_ins : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_84de_k : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_84de_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_95ae]
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_7f5b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_6d74]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1038_c7_f181]
signal result_MUX_uxn_opcodes_h_l1038_c7_f181_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_f181_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_f181_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_f181_return_output : unsigned(0 downto 0);

-- opc_ldz[uxn_opcodes_h_l1038_c39_0dfb]
signal opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_stack_index : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_ins : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_k : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_3d73]
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_327d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_4cdb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1039_c7_6d74]
signal result_MUX_uxn_opcodes_h_l1039_c7_6d74_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_6d74_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_6d74_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_6d74_return_output : unsigned(0 downto 0);

-- opc_ldz2[uxn_opcodes_h_l1039_c39_2675]
signal opc_ldz2_uxn_opcodes_h_l1039_c39_2675_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_2675_stack_index : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_2675_ins : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_2675_k : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_2675_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_77f6]
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_03a4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_c58b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1040_c7_4cdb]
signal result_MUX_uxn_opcodes_h_l1040_c7_4cdb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_4cdb_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_4cdb_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_4cdb_return_output : unsigned(0 downto 0);

-- opc_stz[uxn_opcodes_h_l1040_c39_6994]
signal opc_stz_uxn_opcodes_h_l1040_c39_6994_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_6994_stack_index : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_6994_ins : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_6994_k : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_6994_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_f86b]
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_65a3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_6143]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1041_c7_c58b]
signal result_MUX_uxn_opcodes_h_l1041_c7_c58b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_c58b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_c58b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_c58b_return_output : unsigned(0 downto 0);

-- opc_stz2[uxn_opcodes_h_l1041_c39_2a8e]
signal opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_stack_index : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_ins : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_k : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_e599]
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_61a7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_f3ce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1042_c7_6143]
signal result_MUX_uxn_opcodes_h_l1042_c7_6143_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_6143_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_6143_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_6143_return_output : unsigned(0 downto 0);

-- opc_ldr[uxn_opcodes_h_l1042_c39_c7ea]
signal opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_stack_index : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_ins : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_k : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_13e9]
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_b066]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_3d7a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1043_c7_f3ce]
signal result_MUX_uxn_opcodes_h_l1043_c7_f3ce_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_f3ce_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_f3ce_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_f3ce_return_output : unsigned(0 downto 0);

-- opc_ldr2[uxn_opcodes_h_l1043_c39_a25d]
signal opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_stack_index : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_ins : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_k : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_073b]
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_7e27]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_bd42]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1044_c7_3d7a]
signal result_MUX_uxn_opcodes_h_l1044_c7_3d7a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_3d7a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_3d7a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_3d7a_return_output : unsigned(0 downto 0);

-- opc_str[uxn_opcodes_h_l1044_c39_3bcb]
signal opc_str_uxn_opcodes_h_l1044_c39_3bcb_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_3bcb_stack_index : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_3bcb_ins : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_3bcb_k : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_3bcb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_4ce9]
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_09dd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_5974]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1045_c7_bd42]
signal result_MUX_uxn_opcodes_h_l1045_c7_bd42_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_bd42_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_bd42_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_bd42_return_output : unsigned(0 downto 0);

-- opc_str2[uxn_opcodes_h_l1045_c39_0238]
signal opc_str2_uxn_opcodes_h_l1045_c39_0238_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_0238_stack_index : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_0238_ins : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_0238_k : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_0238_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_b9a7]
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_31c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_8724]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1046_c7_5974]
signal result_MUX_uxn_opcodes_h_l1046_c7_5974_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_5974_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_5974_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_5974_return_output : unsigned(0 downto 0);

-- opc_lda[uxn_opcodes_h_l1046_c39_cb7e]
signal opc_lda_uxn_opcodes_h_l1046_c39_cb7e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_cb7e_stack_index : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_cb7e_ins : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_cb7e_k : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_cb7e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_67b9]
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_a29d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_cdaa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1047_c7_8724]
signal result_MUX_uxn_opcodes_h_l1047_c7_8724_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_8724_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_8724_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_8724_return_output : unsigned(0 downto 0);

-- opc_lda2[uxn_opcodes_h_l1047_c39_34a3]
signal opc_lda2_uxn_opcodes_h_l1047_c39_34a3_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_34a3_stack_index : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_34a3_ins : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_34a3_k : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_34a3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_34a6]
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_08ed]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_2eac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1048_c7_cdaa]
signal result_MUX_uxn_opcodes_h_l1048_c7_cdaa_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_cdaa_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_cdaa_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_cdaa_return_output : unsigned(0 downto 0);

-- opc_sta[uxn_opcodes_h_l1048_c39_f60b]
signal opc_sta_uxn_opcodes_h_l1048_c39_f60b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_f60b_stack_index : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_f60b_ins : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_f60b_k : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_f60b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_eea3]
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_c858]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_4e7f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1049_c7_2eac]
signal result_MUX_uxn_opcodes_h_l1049_c7_2eac_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_2eac_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_2eac_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_2eac_return_output : unsigned(0 downto 0);

-- opc_sta2[uxn_opcodes_h_l1049_c39_c94e]
signal opc_sta2_uxn_opcodes_h_l1049_c39_c94e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_c94e_stack_index : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_c94e_ins : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_c94e_k : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_c94e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_6594]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_1bc2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_54aa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1050_c7_4e7f]
signal result_MUX_uxn_opcodes_h_l1050_c7_4e7f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_4e7f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_4e7f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_4e7f_return_output : unsigned(0 downto 0);

-- opc_dei[uxn_opcodes_h_l1050_c39_1dff]
signal opc_dei_uxn_opcodes_h_l1050_c39_1dff_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_1dff_stack_index : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_1dff_ins : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_1dff_k : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_1dff_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_cf90]
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_567e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_c253]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1051_c7_54aa]
signal result_MUX_uxn_opcodes_h_l1051_c7_54aa_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_54aa_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_54aa_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_54aa_return_output : unsigned(0 downto 0);

-- opc_dei2[uxn_opcodes_h_l1051_c39_e29e]
signal opc_dei2_uxn_opcodes_h_l1051_c39_e29e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_e29e_stack_index : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_e29e_ins : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_e29e_k : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_e29e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_e171]
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_9b93]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_77f8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1052_c7_c253]
signal result_MUX_uxn_opcodes_h_l1052_c7_c253_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_c253_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_c253_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_c253_return_output : unsigned(0 downto 0);

-- opc_deo[uxn_opcodes_h_l1052_c39_444c]
signal opc_deo_uxn_opcodes_h_l1052_c39_444c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_444c_stack_index : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_444c_ins : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_444c_k : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_444c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_6c9b]
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_ec0e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_9d06]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1053_c7_77f8]
signal result_MUX_uxn_opcodes_h_l1053_c7_77f8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_77f8_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_77f8_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_77f8_return_output : unsigned(0 downto 0);

-- opc_deo2[uxn_opcodes_h_l1053_c39_f18b]
signal opc_deo2_uxn_opcodes_h_l1053_c39_f18b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_f18b_stack_index : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_f18b_ins : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_f18b_k : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_f18b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_7899]
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_592e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_8db0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1054_c7_9d06]
signal result_MUX_uxn_opcodes_h_l1054_c7_9d06_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_9d06_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_9d06_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_9d06_return_output : unsigned(0 downto 0);

-- opc_add[uxn_opcodes_h_l1054_c39_eb76]
signal opc_add_uxn_opcodes_h_l1054_c39_eb76_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_eb76_stack_index : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_eb76_ins : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_eb76_k : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_eb76_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_84b5]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_9769]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_a24a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1055_c7_8db0]
signal result_MUX_uxn_opcodes_h_l1055_c7_8db0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_8db0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_8db0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_8db0_return_output : unsigned(0 downto 0);

-- opc_add2[uxn_opcodes_h_l1055_c39_9d77]
signal opc_add2_uxn_opcodes_h_l1055_c39_9d77_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_9d77_stack_index : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_9d77_ins : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_9d77_k : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_9d77_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_3a76]
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_e217]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_b54c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1056_c7_a24a]
signal result_MUX_uxn_opcodes_h_l1056_c7_a24a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_a24a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_a24a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_a24a_return_output : unsigned(0 downto 0);

-- opc_sub[uxn_opcodes_h_l1056_c39_65ca]
signal opc_sub_uxn_opcodes_h_l1056_c39_65ca_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_65ca_stack_index : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_65ca_ins : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_65ca_k : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_65ca_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_8971]
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_488a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_f141]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1057_c7_b54c]
signal result_MUX_uxn_opcodes_h_l1057_c7_b54c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_b54c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_b54c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_b54c_return_output : unsigned(0 downto 0);

-- opc_sub2[uxn_opcodes_h_l1057_c39_0279]
signal opc_sub2_uxn_opcodes_h_l1057_c39_0279_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_0279_stack_index : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_0279_ins : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_0279_k : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_0279_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_3943]
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_81ed]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_c575]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1058_c7_f141]
signal result_MUX_uxn_opcodes_h_l1058_c7_f141_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_f141_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_f141_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_f141_return_output : unsigned(0 downto 0);

-- opc_mul[uxn_opcodes_h_l1058_c39_18b8]
signal opc_mul_uxn_opcodes_h_l1058_c39_18b8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_18b8_stack_index : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_18b8_ins : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_18b8_k : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_18b8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_bc2d]
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_048d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_602b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1059_c7_c575]
signal result_MUX_uxn_opcodes_h_l1059_c7_c575_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_c575_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_c575_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_c575_return_output : unsigned(0 downto 0);

-- opc_mul2[uxn_opcodes_h_l1059_c39_4623]
signal opc_mul2_uxn_opcodes_h_l1059_c39_4623_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_4623_stack_index : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_4623_ins : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_4623_k : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_4623_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_0c75]
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_def9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_50f7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1060_c7_602b]
signal result_MUX_uxn_opcodes_h_l1060_c7_602b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_602b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_602b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_602b_return_output : unsigned(0 downto 0);

-- opc_div[uxn_opcodes_h_l1060_c39_c18c]
signal opc_div_uxn_opcodes_h_l1060_c39_c18c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_c18c_stack_index : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_c18c_ins : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_c18c_k : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_c18c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_e1fd]
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_e8dd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_1c17]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1061_c7_50f7]
signal result_MUX_uxn_opcodes_h_l1061_c7_50f7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_50f7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_50f7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_50f7_return_output : unsigned(0 downto 0);

-- opc_div2[uxn_opcodes_h_l1061_c39_4306]
signal opc_div2_uxn_opcodes_h_l1061_c39_4306_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_4306_stack_index : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_4306_ins : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_4306_k : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_4306_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_e181]
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_0644]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_af6f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1062_c7_1c17]
signal result_MUX_uxn_opcodes_h_l1062_c7_1c17_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_1c17_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_1c17_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_1c17_return_output : unsigned(0 downto 0);

-- opc_and[uxn_opcodes_h_l1062_c39_beaf]
signal opc_and_uxn_opcodes_h_l1062_c39_beaf_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_beaf_stack_index : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_beaf_ins : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_beaf_k : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_beaf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_9a7c]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_8bea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_2d03]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1063_c7_af6f]
signal result_MUX_uxn_opcodes_h_l1063_c7_af6f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_af6f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_af6f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_af6f_return_output : unsigned(0 downto 0);

-- opc_and2[uxn_opcodes_h_l1063_c39_4cda]
signal opc_and2_uxn_opcodes_h_l1063_c39_4cda_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_4cda_stack_index : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_4cda_ins : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_4cda_k : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_4cda_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_49bf]
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_bf04]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_6f40]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1064_c7_2d03]
signal result_MUX_uxn_opcodes_h_l1064_c7_2d03_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_2d03_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_2d03_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_2d03_return_output : unsigned(0 downto 0);

-- opc_ora[uxn_opcodes_h_l1064_c39_17ed]
signal opc_ora_uxn_opcodes_h_l1064_c39_17ed_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_17ed_stack_index : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_17ed_ins : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_17ed_k : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_17ed_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_52e6]
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_0787]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_4edb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1065_c7_6f40]
signal result_MUX_uxn_opcodes_h_l1065_c7_6f40_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_6f40_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_6f40_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_6f40_return_output : unsigned(0 downto 0);

-- opc_ora2[uxn_opcodes_h_l1065_c39_3b66]
signal opc_ora2_uxn_opcodes_h_l1065_c39_3b66_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_3b66_stack_index : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_3b66_ins : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_3b66_k : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_3b66_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_20bf]
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_5176]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_fbdc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1066_c7_4edb]
signal result_MUX_uxn_opcodes_h_l1066_c7_4edb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_4edb_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_4edb_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_4edb_return_output : unsigned(0 downto 0);

-- opc_eor[uxn_opcodes_h_l1066_c39_2d57]
signal opc_eor_uxn_opcodes_h_l1066_c39_2d57_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_2d57_stack_index : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_2d57_ins : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_2d57_k : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_2d57_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_cf9e]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_1642]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_5645]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1067_c7_fbdc]
signal result_MUX_uxn_opcodes_h_l1067_c7_fbdc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_fbdc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_fbdc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_fbdc_return_output : unsigned(0 downto 0);

-- opc_eor2[uxn_opcodes_h_l1067_c39_49c5]
signal opc_eor2_uxn_opcodes_h_l1067_c39_49c5_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_49c5_stack_index : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_49c5_ins : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_49c5_k : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_49c5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_2438]
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_cd32]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_6b41]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1068_c7_5645]
signal result_MUX_uxn_opcodes_h_l1068_c7_5645_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_5645_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_5645_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_5645_return_output : unsigned(0 downto 0);

-- opc_sft[uxn_opcodes_h_l1068_c39_8c1c]
signal opc_sft_uxn_opcodes_h_l1068_c39_8c1c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_8c1c_stack_index : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_8c1c_ins : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_8c1c_k : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_8c1c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_bbf2]
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_432b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1069_c7_6b41]
signal result_MUX_uxn_opcodes_h_l1069_c7_6b41_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_6b41_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_6b41_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_6b41_return_output : unsigned(0 downto 0);

-- opc_sft2[uxn_opcodes_h_l1069_c39_8375]
signal opc_sft2_uxn_opcodes_h_l1069_c39_8375_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_8375_stack_index : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_8375_ins : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_8375_k : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_8375_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_left,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_right,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_return_output);

-- result_MUX_uxn_opcodes_h_l1000_c2_7834
result_MUX_uxn_opcodes_h_l1000_c2_7834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1000_c2_7834_cond,
result_MUX_uxn_opcodes_h_l1000_c2_7834_iftrue,
result_MUX_uxn_opcodes_h_l1000_c2_7834_iffalse,
result_MUX_uxn_opcodes_h_l1000_c2_7834_return_output);

-- opc_brk_uxn_opcodes_h_l1000_c34_6db9
opc_brk_uxn_opcodes_h_l1000_c34_6db9 : entity work.opc_brk_0CLK_de264c78 port map (
opc_brk_uxn_opcodes_h_l1000_c34_6db9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_return_output);

-- result_MUX_uxn_opcodes_h_l1001_c7_5059
result_MUX_uxn_opcodes_h_l1001_c7_5059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1001_c7_5059_cond,
result_MUX_uxn_opcodes_h_l1001_c7_5059_iftrue,
result_MUX_uxn_opcodes_h_l1001_c7_5059_iffalse,
result_MUX_uxn_opcodes_h_l1001_c7_5059_return_output);

-- opc_jci_uxn_opcodes_h_l1001_c39_362a
opc_jci_uxn_opcodes_h_l1001_c39_362a : entity work.opc_jci_0CLK_4c4669f6 port map (
clk,
opc_jci_uxn_opcodes_h_l1001_c39_362a_CLOCK_ENABLE,
opc_jci_uxn_opcodes_h_l1001_c39_362a_stack_index,
opc_jci_uxn_opcodes_h_l1001_c39_362a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_left,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_right,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_return_output);

-- result_MUX_uxn_opcodes_h_l1002_c7_82d3
result_MUX_uxn_opcodes_h_l1002_c7_82d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1002_c7_82d3_cond,
result_MUX_uxn_opcodes_h_l1002_c7_82d3_iftrue,
result_MUX_uxn_opcodes_h_l1002_c7_82d3_iffalse,
result_MUX_uxn_opcodes_h_l1002_c7_82d3_return_output);

-- opc_jmi_uxn_opcodes_h_l1002_c39_4f20
opc_jmi_uxn_opcodes_h_l1002_c39_4f20 : entity work.opc_jmi_0CLK_dd82b7a2 port map (
clk,
opc_jmi_uxn_opcodes_h_l1002_c39_4f20_CLOCK_ENABLE,
opc_jmi_uxn_opcodes_h_l1002_c39_4f20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_return_output);

-- result_MUX_uxn_opcodes_h_l1003_c7_5b9e
result_MUX_uxn_opcodes_h_l1003_c7_5b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1003_c7_5b9e_cond,
result_MUX_uxn_opcodes_h_l1003_c7_5b9e_iftrue,
result_MUX_uxn_opcodes_h_l1003_c7_5b9e_iffalse,
result_MUX_uxn_opcodes_h_l1003_c7_5b9e_return_output);

-- opc_jsi_uxn_opcodes_h_l1003_c39_5cad
opc_jsi_uxn_opcodes_h_l1003_c39_5cad : entity work.opc_jsi_0CLK_0a77da6f port map (
clk,
opc_jsi_uxn_opcodes_h_l1003_c39_5cad_CLOCK_ENABLE,
opc_jsi_uxn_opcodes_h_l1003_c39_5cad_ins,
opc_jsi_uxn_opcodes_h_l1003_c39_5cad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_left,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_right,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_return_output);

-- result_MUX_uxn_opcodes_h_l1004_c7_5e95
result_MUX_uxn_opcodes_h_l1004_c7_5e95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1004_c7_5e95_cond,
result_MUX_uxn_opcodes_h_l1004_c7_5e95_iftrue,
result_MUX_uxn_opcodes_h_l1004_c7_5e95_iffalse,
result_MUX_uxn_opcodes_h_l1004_c7_5e95_return_output);

-- opc_lit_uxn_opcodes_h_l1004_c39_0c05
opc_lit_uxn_opcodes_h_l1004_c39_0c05 : entity work.opc_lit_0CLK_fb192e55 port map (
clk,
opc_lit_uxn_opcodes_h_l1004_c39_0c05_CLOCK_ENABLE,
opc_lit_uxn_opcodes_h_l1004_c39_0c05_stack_index,
opc_lit_uxn_opcodes_h_l1004_c39_0c05_ins,
opc_lit_uxn_opcodes_h_l1004_c39_0c05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_left,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_right,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_return_output);

-- result_MUX_uxn_opcodes_h_l1005_c7_04b3
result_MUX_uxn_opcodes_h_l1005_c7_04b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1005_c7_04b3_cond,
result_MUX_uxn_opcodes_h_l1005_c7_04b3_iftrue,
result_MUX_uxn_opcodes_h_l1005_c7_04b3_iffalse,
result_MUX_uxn_opcodes_h_l1005_c7_04b3_return_output);

-- opc_lit2_uxn_opcodes_h_l1005_c39_25ab
opc_lit2_uxn_opcodes_h_l1005_c39_25ab : entity work.opc_lit2_0CLK_3aa2ab20 port map (
clk,
opc_lit2_uxn_opcodes_h_l1005_c39_25ab_CLOCK_ENABLE,
opc_lit2_uxn_opcodes_h_l1005_c39_25ab_stack_index,
opc_lit2_uxn_opcodes_h_l1005_c39_25ab_ins,
opc_lit2_uxn_opcodes_h_l1005_c39_25ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_left,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_right,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_return_output);

-- result_MUX_uxn_opcodes_h_l1006_c7_af65
result_MUX_uxn_opcodes_h_l1006_c7_af65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1006_c7_af65_cond,
result_MUX_uxn_opcodes_h_l1006_c7_af65_iftrue,
result_MUX_uxn_opcodes_h_l1006_c7_af65_iffalse,
result_MUX_uxn_opcodes_h_l1006_c7_af65_return_output);

-- opc_litr_uxn_opcodes_h_l1006_c39_db2c
opc_litr_uxn_opcodes_h_l1006_c39_db2c : entity work.opc_litr_0CLK_fb192e55 port map (
clk,
opc_litr_uxn_opcodes_h_l1006_c39_db2c_CLOCK_ENABLE,
opc_litr_uxn_opcodes_h_l1006_c39_db2c_stack_index,
opc_litr_uxn_opcodes_h_l1006_c39_db2c_ins,
opc_litr_uxn_opcodes_h_l1006_c39_db2c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_left,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_right,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_return_output);

-- result_MUX_uxn_opcodes_h_l1007_c7_9f80
result_MUX_uxn_opcodes_h_l1007_c7_9f80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1007_c7_9f80_cond,
result_MUX_uxn_opcodes_h_l1007_c7_9f80_iftrue,
result_MUX_uxn_opcodes_h_l1007_c7_9f80_iffalse,
result_MUX_uxn_opcodes_h_l1007_c7_9f80_return_output);

-- opc_lit2r_uxn_opcodes_h_l1007_c39_4136
opc_lit2r_uxn_opcodes_h_l1007_c39_4136 : entity work.opc_lit2r_0CLK_3aa2ab20 port map (
clk,
opc_lit2r_uxn_opcodes_h_l1007_c39_4136_CLOCK_ENABLE,
opc_lit2r_uxn_opcodes_h_l1007_c39_4136_stack_index,
opc_lit2r_uxn_opcodes_h_l1007_c39_4136_ins,
opc_lit2r_uxn_opcodes_h_l1007_c39_4136_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_left,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_right,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_return_output);

-- result_MUX_uxn_opcodes_h_l1008_c7_526d
result_MUX_uxn_opcodes_h_l1008_c7_526d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1008_c7_526d_cond,
result_MUX_uxn_opcodes_h_l1008_c7_526d_iftrue,
result_MUX_uxn_opcodes_h_l1008_c7_526d_iffalse,
result_MUX_uxn_opcodes_h_l1008_c7_526d_return_output);

-- opc_inc_uxn_opcodes_h_l1008_c39_edb1
opc_inc_uxn_opcodes_h_l1008_c39_edb1 : entity work.opc_inc_0CLK_d6df7042 port map (
clk,
opc_inc_uxn_opcodes_h_l1008_c39_edb1_CLOCK_ENABLE,
opc_inc_uxn_opcodes_h_l1008_c39_edb1_stack_index,
opc_inc_uxn_opcodes_h_l1008_c39_edb1_ins,
opc_inc_uxn_opcodes_h_l1008_c39_edb1_k,
opc_inc_uxn_opcodes_h_l1008_c39_edb1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_left,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_right,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_return_output);

-- result_MUX_uxn_opcodes_h_l1009_c7_a1a7
result_MUX_uxn_opcodes_h_l1009_c7_a1a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1009_c7_a1a7_cond,
result_MUX_uxn_opcodes_h_l1009_c7_a1a7_iftrue,
result_MUX_uxn_opcodes_h_l1009_c7_a1a7_iffalse,
result_MUX_uxn_opcodes_h_l1009_c7_a1a7_return_output);

-- opc_inc2_uxn_opcodes_h_l1009_c39_0cdf
opc_inc2_uxn_opcodes_h_l1009_c39_0cdf : entity work.opc_inc2_0CLK_ab649236 port map (
clk,
opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_CLOCK_ENABLE,
opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_stack_index,
opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_ins,
opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_k,
opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_left,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_right,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_return_output);

-- result_MUX_uxn_opcodes_h_l1010_c7_8bb9
result_MUX_uxn_opcodes_h_l1010_c7_8bb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1010_c7_8bb9_cond,
result_MUX_uxn_opcodes_h_l1010_c7_8bb9_iftrue,
result_MUX_uxn_opcodes_h_l1010_c7_8bb9_iffalse,
result_MUX_uxn_opcodes_h_l1010_c7_8bb9_return_output);

-- opc_pop_uxn_opcodes_h_l1010_c39_d627
opc_pop_uxn_opcodes_h_l1010_c39_d627 : entity work.opc_pop_0CLK_dffed988 port map (
clk,
opc_pop_uxn_opcodes_h_l1010_c39_d627_CLOCK_ENABLE,
opc_pop_uxn_opcodes_h_l1010_c39_d627_stack_index,
opc_pop_uxn_opcodes_h_l1010_c39_d627_ins,
opc_pop_uxn_opcodes_h_l1010_c39_d627_k,
opc_pop_uxn_opcodes_h_l1010_c39_d627_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_left,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_right,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_return_output);

-- result_MUX_uxn_opcodes_h_l1011_c7_bd86
result_MUX_uxn_opcodes_h_l1011_c7_bd86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1011_c7_bd86_cond,
result_MUX_uxn_opcodes_h_l1011_c7_bd86_iftrue,
result_MUX_uxn_opcodes_h_l1011_c7_bd86_iffalse,
result_MUX_uxn_opcodes_h_l1011_c7_bd86_return_output);

-- opc_pop2_uxn_opcodes_h_l1011_c39_196a
opc_pop2_uxn_opcodes_h_l1011_c39_196a : entity work.opc_pop2_0CLK_dffed988 port map (
clk,
opc_pop2_uxn_opcodes_h_l1011_c39_196a_CLOCK_ENABLE,
opc_pop2_uxn_opcodes_h_l1011_c39_196a_stack_index,
opc_pop2_uxn_opcodes_h_l1011_c39_196a_ins,
opc_pop2_uxn_opcodes_h_l1011_c39_196a_k,
opc_pop2_uxn_opcodes_h_l1011_c39_196a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_left,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_right,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_return_output);

-- result_MUX_uxn_opcodes_h_l1012_c7_b1e0
result_MUX_uxn_opcodes_h_l1012_c7_b1e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1012_c7_b1e0_cond,
result_MUX_uxn_opcodes_h_l1012_c7_b1e0_iftrue,
result_MUX_uxn_opcodes_h_l1012_c7_b1e0_iffalse,
result_MUX_uxn_opcodes_h_l1012_c7_b1e0_return_output);

-- opc_nip_uxn_opcodes_h_l1012_c39_f246
opc_nip_uxn_opcodes_h_l1012_c39_f246 : entity work.opc_nip_0CLK_eee12f66 port map (
clk,
opc_nip_uxn_opcodes_h_l1012_c39_f246_CLOCK_ENABLE,
opc_nip_uxn_opcodes_h_l1012_c39_f246_stack_index,
opc_nip_uxn_opcodes_h_l1012_c39_f246_ins,
opc_nip_uxn_opcodes_h_l1012_c39_f246_k,
opc_nip_uxn_opcodes_h_l1012_c39_f246_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_left,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_right,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_return_output);

-- result_MUX_uxn_opcodes_h_l1013_c7_fde3
result_MUX_uxn_opcodes_h_l1013_c7_fde3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1013_c7_fde3_cond,
result_MUX_uxn_opcodes_h_l1013_c7_fde3_iftrue,
result_MUX_uxn_opcodes_h_l1013_c7_fde3_iffalse,
result_MUX_uxn_opcodes_h_l1013_c7_fde3_return_output);

-- opc_nip2_uxn_opcodes_h_l1013_c39_e112
opc_nip2_uxn_opcodes_h_l1013_c39_e112 : entity work.opc_nip2_0CLK_595bc5ba port map (
clk,
opc_nip2_uxn_opcodes_h_l1013_c39_e112_CLOCK_ENABLE,
opc_nip2_uxn_opcodes_h_l1013_c39_e112_stack_index,
opc_nip2_uxn_opcodes_h_l1013_c39_e112_ins,
opc_nip2_uxn_opcodes_h_l1013_c39_e112_k,
opc_nip2_uxn_opcodes_h_l1013_c39_e112_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_left,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_right,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_return_output);

-- result_MUX_uxn_opcodes_h_l1014_c7_6c5b
result_MUX_uxn_opcodes_h_l1014_c7_6c5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1014_c7_6c5b_cond,
result_MUX_uxn_opcodes_h_l1014_c7_6c5b_iftrue,
result_MUX_uxn_opcodes_h_l1014_c7_6c5b_iffalse,
result_MUX_uxn_opcodes_h_l1014_c7_6c5b_return_output);

-- opc_swp_uxn_opcodes_h_l1014_c39_c5fd
opc_swp_uxn_opcodes_h_l1014_c39_c5fd : entity work.opc_swp_0CLK_8b182ca9 port map (
clk,
opc_swp_uxn_opcodes_h_l1014_c39_c5fd_CLOCK_ENABLE,
opc_swp_uxn_opcodes_h_l1014_c39_c5fd_stack_index,
opc_swp_uxn_opcodes_h_l1014_c39_c5fd_ins,
opc_swp_uxn_opcodes_h_l1014_c39_c5fd_k,
opc_swp_uxn_opcodes_h_l1014_c39_c5fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_left,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_right,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_return_output);

-- result_MUX_uxn_opcodes_h_l1015_c7_f040
result_MUX_uxn_opcodes_h_l1015_c7_f040 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1015_c7_f040_cond,
result_MUX_uxn_opcodes_h_l1015_c7_f040_iftrue,
result_MUX_uxn_opcodes_h_l1015_c7_f040_iffalse,
result_MUX_uxn_opcodes_h_l1015_c7_f040_return_output);

-- opc_swp2_uxn_opcodes_h_l1015_c39_e1ac
opc_swp2_uxn_opcodes_h_l1015_c39_e1ac : entity work.opc_swp2_0CLK_1cf85e9c port map (
clk,
opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_CLOCK_ENABLE,
opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_stack_index,
opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_ins,
opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_k,
opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_left,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_right,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_return_output);

-- result_MUX_uxn_opcodes_h_l1016_c7_beeb
result_MUX_uxn_opcodes_h_l1016_c7_beeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1016_c7_beeb_cond,
result_MUX_uxn_opcodes_h_l1016_c7_beeb_iftrue,
result_MUX_uxn_opcodes_h_l1016_c7_beeb_iffalse,
result_MUX_uxn_opcodes_h_l1016_c7_beeb_return_output);

-- opc_rot_uxn_opcodes_h_l1016_c39_5b39
opc_rot_uxn_opcodes_h_l1016_c39_5b39 : entity work.opc_rot_0CLK_4850ef50 port map (
clk,
opc_rot_uxn_opcodes_h_l1016_c39_5b39_CLOCK_ENABLE,
opc_rot_uxn_opcodes_h_l1016_c39_5b39_stack_index,
opc_rot_uxn_opcodes_h_l1016_c39_5b39_ins,
opc_rot_uxn_opcodes_h_l1016_c39_5b39_k,
opc_rot_uxn_opcodes_h_l1016_c39_5b39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_left,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_right,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_return_output);

-- result_MUX_uxn_opcodes_h_l1017_c7_dfe5
result_MUX_uxn_opcodes_h_l1017_c7_dfe5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1017_c7_dfe5_cond,
result_MUX_uxn_opcodes_h_l1017_c7_dfe5_iftrue,
result_MUX_uxn_opcodes_h_l1017_c7_dfe5_iffalse,
result_MUX_uxn_opcodes_h_l1017_c7_dfe5_return_output);

-- opc_rot2_uxn_opcodes_h_l1017_c39_3178
opc_rot2_uxn_opcodes_h_l1017_c39_3178 : entity work.opc_rot2_0CLK_49c1023c port map (
clk,
opc_rot2_uxn_opcodes_h_l1017_c39_3178_CLOCK_ENABLE,
opc_rot2_uxn_opcodes_h_l1017_c39_3178_stack_index,
opc_rot2_uxn_opcodes_h_l1017_c39_3178_ins,
opc_rot2_uxn_opcodes_h_l1017_c39_3178_k,
opc_rot2_uxn_opcodes_h_l1017_c39_3178_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_left,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_right,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_return_output);

-- result_MUX_uxn_opcodes_h_l1018_c7_4769
result_MUX_uxn_opcodes_h_l1018_c7_4769 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1018_c7_4769_cond,
result_MUX_uxn_opcodes_h_l1018_c7_4769_iftrue,
result_MUX_uxn_opcodes_h_l1018_c7_4769_iffalse,
result_MUX_uxn_opcodes_h_l1018_c7_4769_return_output);

-- opc_dup_uxn_opcodes_h_l1018_c39_27b0
opc_dup_uxn_opcodes_h_l1018_c39_27b0 : entity work.opc_dup_0CLK_dd62d56e port map (
clk,
opc_dup_uxn_opcodes_h_l1018_c39_27b0_CLOCK_ENABLE,
opc_dup_uxn_opcodes_h_l1018_c39_27b0_stack_index,
opc_dup_uxn_opcodes_h_l1018_c39_27b0_ins,
opc_dup_uxn_opcodes_h_l1018_c39_27b0_k,
opc_dup_uxn_opcodes_h_l1018_c39_27b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_left,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_right,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_return_output);

-- result_MUX_uxn_opcodes_h_l1019_c7_c4ef
result_MUX_uxn_opcodes_h_l1019_c7_c4ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1019_c7_c4ef_cond,
result_MUX_uxn_opcodes_h_l1019_c7_c4ef_iftrue,
result_MUX_uxn_opcodes_h_l1019_c7_c4ef_iffalse,
result_MUX_uxn_opcodes_h_l1019_c7_c4ef_return_output);

-- opc_dup2_uxn_opcodes_h_l1019_c39_4f8c
opc_dup2_uxn_opcodes_h_l1019_c39_4f8c : entity work.opc_dup2_0CLK_c8878770 port map (
clk,
opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_CLOCK_ENABLE,
opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_stack_index,
opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_ins,
opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_k,
opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_left,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_right,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_return_output);

-- result_MUX_uxn_opcodes_h_l1020_c7_44ea
result_MUX_uxn_opcodes_h_l1020_c7_44ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1020_c7_44ea_cond,
result_MUX_uxn_opcodes_h_l1020_c7_44ea_iftrue,
result_MUX_uxn_opcodes_h_l1020_c7_44ea_iffalse,
result_MUX_uxn_opcodes_h_l1020_c7_44ea_return_output);

-- opc_ovr_uxn_opcodes_h_l1020_c39_8c15
opc_ovr_uxn_opcodes_h_l1020_c39_8c15 : entity work.opc_ovr_0CLK_09d9764c port map (
clk,
opc_ovr_uxn_opcodes_h_l1020_c39_8c15_CLOCK_ENABLE,
opc_ovr_uxn_opcodes_h_l1020_c39_8c15_stack_index,
opc_ovr_uxn_opcodes_h_l1020_c39_8c15_ins,
opc_ovr_uxn_opcodes_h_l1020_c39_8c15_k,
opc_ovr_uxn_opcodes_h_l1020_c39_8c15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_left,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_right,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_return_output);

-- result_MUX_uxn_opcodes_h_l1021_c7_aab0
result_MUX_uxn_opcodes_h_l1021_c7_aab0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1021_c7_aab0_cond,
result_MUX_uxn_opcodes_h_l1021_c7_aab0_iftrue,
result_MUX_uxn_opcodes_h_l1021_c7_aab0_iffalse,
result_MUX_uxn_opcodes_h_l1021_c7_aab0_return_output);

-- opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3
opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3 : entity work.opc_ovr2_0CLK_3d799363 port map (
clk,
opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_CLOCK_ENABLE,
opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_stack_index,
opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_ins,
opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_k,
opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_left,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_right,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_return_output);

-- result_MUX_uxn_opcodes_h_l1022_c7_e6ee
result_MUX_uxn_opcodes_h_l1022_c7_e6ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1022_c7_e6ee_cond,
result_MUX_uxn_opcodes_h_l1022_c7_e6ee_iftrue,
result_MUX_uxn_opcodes_h_l1022_c7_e6ee_iffalse,
result_MUX_uxn_opcodes_h_l1022_c7_e6ee_return_output);

-- opc_equ_uxn_opcodes_h_l1022_c39_c3f0
opc_equ_uxn_opcodes_h_l1022_c39_c3f0 : entity work.opc_equ_0CLK_4bcf4f80 port map (
clk,
opc_equ_uxn_opcodes_h_l1022_c39_c3f0_CLOCK_ENABLE,
opc_equ_uxn_opcodes_h_l1022_c39_c3f0_stack_index,
opc_equ_uxn_opcodes_h_l1022_c39_c3f0_ins,
opc_equ_uxn_opcodes_h_l1022_c39_c3f0_k,
opc_equ_uxn_opcodes_h_l1022_c39_c3f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_return_output);

-- result_MUX_uxn_opcodes_h_l1023_c7_7adc
result_MUX_uxn_opcodes_h_l1023_c7_7adc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1023_c7_7adc_cond,
result_MUX_uxn_opcodes_h_l1023_c7_7adc_iftrue,
result_MUX_uxn_opcodes_h_l1023_c7_7adc_iffalse,
result_MUX_uxn_opcodes_h_l1023_c7_7adc_return_output);

-- opc_equ2_uxn_opcodes_h_l1023_c39_242e
opc_equ2_uxn_opcodes_h_l1023_c39_242e : entity work.opc_equ2_0CLK_aa0f47c3 port map (
clk,
opc_equ2_uxn_opcodes_h_l1023_c39_242e_CLOCK_ENABLE,
opc_equ2_uxn_opcodes_h_l1023_c39_242e_stack_index,
opc_equ2_uxn_opcodes_h_l1023_c39_242e_ins,
opc_equ2_uxn_opcodes_h_l1023_c39_242e_k,
opc_equ2_uxn_opcodes_h_l1023_c39_242e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_left,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_right,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_return_output);

-- result_MUX_uxn_opcodes_h_l1024_c7_4346
result_MUX_uxn_opcodes_h_l1024_c7_4346 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1024_c7_4346_cond,
result_MUX_uxn_opcodes_h_l1024_c7_4346_iftrue,
result_MUX_uxn_opcodes_h_l1024_c7_4346_iffalse,
result_MUX_uxn_opcodes_h_l1024_c7_4346_return_output);

-- opc_neq_uxn_opcodes_h_l1024_c39_986c
opc_neq_uxn_opcodes_h_l1024_c39_986c : entity work.opc_neq_0CLK_4bcf4f80 port map (
clk,
opc_neq_uxn_opcodes_h_l1024_c39_986c_CLOCK_ENABLE,
opc_neq_uxn_opcodes_h_l1024_c39_986c_stack_index,
opc_neq_uxn_opcodes_h_l1024_c39_986c_ins,
opc_neq_uxn_opcodes_h_l1024_c39_986c_k,
opc_neq_uxn_opcodes_h_l1024_c39_986c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_return_output);

-- result_MUX_uxn_opcodes_h_l1025_c7_d961
result_MUX_uxn_opcodes_h_l1025_c7_d961 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1025_c7_d961_cond,
result_MUX_uxn_opcodes_h_l1025_c7_d961_iftrue,
result_MUX_uxn_opcodes_h_l1025_c7_d961_iffalse,
result_MUX_uxn_opcodes_h_l1025_c7_d961_return_output);

-- opc_neq2_uxn_opcodes_h_l1025_c39_268c
opc_neq2_uxn_opcodes_h_l1025_c39_268c : entity work.opc_neq2_0CLK_aa0f47c3 port map (
clk,
opc_neq2_uxn_opcodes_h_l1025_c39_268c_CLOCK_ENABLE,
opc_neq2_uxn_opcodes_h_l1025_c39_268c_stack_index,
opc_neq2_uxn_opcodes_h_l1025_c39_268c_ins,
opc_neq2_uxn_opcodes_h_l1025_c39_268c_k,
opc_neq2_uxn_opcodes_h_l1025_c39_268c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_left,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_right,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_return_output);

-- result_MUX_uxn_opcodes_h_l1026_c7_d86d
result_MUX_uxn_opcodes_h_l1026_c7_d86d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1026_c7_d86d_cond,
result_MUX_uxn_opcodes_h_l1026_c7_d86d_iftrue,
result_MUX_uxn_opcodes_h_l1026_c7_d86d_iffalse,
result_MUX_uxn_opcodes_h_l1026_c7_d86d_return_output);

-- opc_gth_uxn_opcodes_h_l1026_c39_4552
opc_gth_uxn_opcodes_h_l1026_c39_4552 : entity work.opc_gth_0CLK_4bcf4f80 port map (
clk,
opc_gth_uxn_opcodes_h_l1026_c39_4552_CLOCK_ENABLE,
opc_gth_uxn_opcodes_h_l1026_c39_4552_stack_index,
opc_gth_uxn_opcodes_h_l1026_c39_4552_ins,
opc_gth_uxn_opcodes_h_l1026_c39_4552_k,
opc_gth_uxn_opcodes_h_l1026_c39_4552_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_left,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_right,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_return_output);

-- result_MUX_uxn_opcodes_h_l1027_c7_9a9f
result_MUX_uxn_opcodes_h_l1027_c7_9a9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1027_c7_9a9f_cond,
result_MUX_uxn_opcodes_h_l1027_c7_9a9f_iftrue,
result_MUX_uxn_opcodes_h_l1027_c7_9a9f_iffalse,
result_MUX_uxn_opcodes_h_l1027_c7_9a9f_return_output);

-- opc_gth2_uxn_opcodes_h_l1027_c39_721a
opc_gth2_uxn_opcodes_h_l1027_c39_721a : entity work.opc_gth2_0CLK_aa0f47c3 port map (
clk,
opc_gth2_uxn_opcodes_h_l1027_c39_721a_CLOCK_ENABLE,
opc_gth2_uxn_opcodes_h_l1027_c39_721a_stack_index,
opc_gth2_uxn_opcodes_h_l1027_c39_721a_ins,
opc_gth2_uxn_opcodes_h_l1027_c39_721a_k,
opc_gth2_uxn_opcodes_h_l1027_c39_721a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_left,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_right,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_return_output);

-- result_MUX_uxn_opcodes_h_l1028_c7_8a4b
result_MUX_uxn_opcodes_h_l1028_c7_8a4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1028_c7_8a4b_cond,
result_MUX_uxn_opcodes_h_l1028_c7_8a4b_iftrue,
result_MUX_uxn_opcodes_h_l1028_c7_8a4b_iffalse,
result_MUX_uxn_opcodes_h_l1028_c7_8a4b_return_output);

-- opc_lth_uxn_opcodes_h_l1028_c39_13bf
opc_lth_uxn_opcodes_h_l1028_c39_13bf : entity work.opc_lth_0CLK_4bcf4f80 port map (
clk,
opc_lth_uxn_opcodes_h_l1028_c39_13bf_CLOCK_ENABLE,
opc_lth_uxn_opcodes_h_l1028_c39_13bf_stack_index,
opc_lth_uxn_opcodes_h_l1028_c39_13bf_ins,
opc_lth_uxn_opcodes_h_l1028_c39_13bf_k,
opc_lth_uxn_opcodes_h_l1028_c39_13bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_left,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_right,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_return_output);

-- result_MUX_uxn_opcodes_h_l1029_c7_b1a2
result_MUX_uxn_opcodes_h_l1029_c7_b1a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1029_c7_b1a2_cond,
result_MUX_uxn_opcodes_h_l1029_c7_b1a2_iftrue,
result_MUX_uxn_opcodes_h_l1029_c7_b1a2_iffalse,
result_MUX_uxn_opcodes_h_l1029_c7_b1a2_return_output);

-- opc_lth2_uxn_opcodes_h_l1029_c39_76b0
opc_lth2_uxn_opcodes_h_l1029_c39_76b0 : entity work.opc_lth2_0CLK_aa0f47c3 port map (
clk,
opc_lth2_uxn_opcodes_h_l1029_c39_76b0_CLOCK_ENABLE,
opc_lth2_uxn_opcodes_h_l1029_c39_76b0_stack_index,
opc_lth2_uxn_opcodes_h_l1029_c39_76b0_ins,
opc_lth2_uxn_opcodes_h_l1029_c39_76b0_k,
opc_lth2_uxn_opcodes_h_l1029_c39_76b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_left,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_right,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_return_output);

-- result_MUX_uxn_opcodes_h_l1030_c7_e28b
result_MUX_uxn_opcodes_h_l1030_c7_e28b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1030_c7_e28b_cond,
result_MUX_uxn_opcodes_h_l1030_c7_e28b_iftrue,
result_MUX_uxn_opcodes_h_l1030_c7_e28b_iffalse,
result_MUX_uxn_opcodes_h_l1030_c7_e28b_return_output);

-- opc_jmp_uxn_opcodes_h_l1030_c39_443c
opc_jmp_uxn_opcodes_h_l1030_c39_443c : entity work.opc_jmp_0CLK_ab8f8397 port map (
clk,
opc_jmp_uxn_opcodes_h_l1030_c39_443c_CLOCK_ENABLE,
opc_jmp_uxn_opcodes_h_l1030_c39_443c_stack_index,
opc_jmp_uxn_opcodes_h_l1030_c39_443c_ins,
opc_jmp_uxn_opcodes_h_l1030_c39_443c_k,
opc_jmp_uxn_opcodes_h_l1030_c39_443c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_left,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_right,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_return_output);

-- result_MUX_uxn_opcodes_h_l1031_c7_0198
result_MUX_uxn_opcodes_h_l1031_c7_0198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1031_c7_0198_cond,
result_MUX_uxn_opcodes_h_l1031_c7_0198_iftrue,
result_MUX_uxn_opcodes_h_l1031_c7_0198_iffalse,
result_MUX_uxn_opcodes_h_l1031_c7_0198_return_output);

-- opc_jmp2_uxn_opcodes_h_l1031_c39_761c
opc_jmp2_uxn_opcodes_h_l1031_c39_761c : entity work.opc_jmp2_0CLK_cd0ff700 port map (
clk,
opc_jmp2_uxn_opcodes_h_l1031_c39_761c_CLOCK_ENABLE,
opc_jmp2_uxn_opcodes_h_l1031_c39_761c_stack_index,
opc_jmp2_uxn_opcodes_h_l1031_c39_761c_ins,
opc_jmp2_uxn_opcodes_h_l1031_c39_761c_k,
opc_jmp2_uxn_opcodes_h_l1031_c39_761c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_left,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_right,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_return_output);

-- result_MUX_uxn_opcodes_h_l1032_c7_12bf
result_MUX_uxn_opcodes_h_l1032_c7_12bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1032_c7_12bf_cond,
result_MUX_uxn_opcodes_h_l1032_c7_12bf_iftrue,
result_MUX_uxn_opcodes_h_l1032_c7_12bf_iffalse,
result_MUX_uxn_opcodes_h_l1032_c7_12bf_return_output);

-- opc_jcn_uxn_opcodes_h_l1032_c39_9630
opc_jcn_uxn_opcodes_h_l1032_c39_9630 : entity work.opc_jcn_0CLK_7f8adde9 port map (
clk,
opc_jcn_uxn_opcodes_h_l1032_c39_9630_CLOCK_ENABLE,
opc_jcn_uxn_opcodes_h_l1032_c39_9630_stack_index,
opc_jcn_uxn_opcodes_h_l1032_c39_9630_ins,
opc_jcn_uxn_opcodes_h_l1032_c39_9630_k,
opc_jcn_uxn_opcodes_h_l1032_c39_9630_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_left,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_right,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_return_output);

-- result_MUX_uxn_opcodes_h_l1033_c7_ce7a
result_MUX_uxn_opcodes_h_l1033_c7_ce7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1033_c7_ce7a_cond,
result_MUX_uxn_opcodes_h_l1033_c7_ce7a_iftrue,
result_MUX_uxn_opcodes_h_l1033_c7_ce7a_iffalse,
result_MUX_uxn_opcodes_h_l1033_c7_ce7a_return_output);

-- opc_jcn2_uxn_opcodes_h_l1033_c39_4ead
opc_jcn2_uxn_opcodes_h_l1033_c39_4ead : entity work.opc_jcn2_0CLK_fc8f03ff port map (
clk,
opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_CLOCK_ENABLE,
opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_stack_index,
opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_ins,
opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_k,
opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_left,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_right,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_return_output);

-- result_MUX_uxn_opcodes_h_l1034_c7_ad42
result_MUX_uxn_opcodes_h_l1034_c7_ad42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1034_c7_ad42_cond,
result_MUX_uxn_opcodes_h_l1034_c7_ad42_iftrue,
result_MUX_uxn_opcodes_h_l1034_c7_ad42_iffalse,
result_MUX_uxn_opcodes_h_l1034_c7_ad42_return_output);

-- opc_jsr_uxn_opcodes_h_l1034_c39_4563
opc_jsr_uxn_opcodes_h_l1034_c39_4563 : entity work.opc_jsr_0CLK_1d648d8a port map (
clk,
opc_jsr_uxn_opcodes_h_l1034_c39_4563_CLOCK_ENABLE,
opc_jsr_uxn_opcodes_h_l1034_c39_4563_stack_index,
opc_jsr_uxn_opcodes_h_l1034_c39_4563_ins,
opc_jsr_uxn_opcodes_h_l1034_c39_4563_k,
opc_jsr_uxn_opcodes_h_l1034_c39_4563_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_left,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_right,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_return_output);

-- result_MUX_uxn_opcodes_h_l1035_c7_2367
result_MUX_uxn_opcodes_h_l1035_c7_2367 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1035_c7_2367_cond,
result_MUX_uxn_opcodes_h_l1035_c7_2367_iftrue,
result_MUX_uxn_opcodes_h_l1035_c7_2367_iffalse,
result_MUX_uxn_opcodes_h_l1035_c7_2367_return_output);

-- opc_jsr2_uxn_opcodes_h_l1035_c39_7497
opc_jsr2_uxn_opcodes_h_l1035_c39_7497 : entity work.opc_jsr2_0CLK_421159e4 port map (
clk,
opc_jsr2_uxn_opcodes_h_l1035_c39_7497_CLOCK_ENABLE,
opc_jsr2_uxn_opcodes_h_l1035_c39_7497_stack_index,
opc_jsr2_uxn_opcodes_h_l1035_c39_7497_ins,
opc_jsr2_uxn_opcodes_h_l1035_c39_7497_k,
opc_jsr2_uxn_opcodes_h_l1035_c39_7497_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_left,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_right,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_return_output);

-- result_MUX_uxn_opcodes_h_l1036_c7_dbbe
result_MUX_uxn_opcodes_h_l1036_c7_dbbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1036_c7_dbbe_cond,
result_MUX_uxn_opcodes_h_l1036_c7_dbbe_iftrue,
result_MUX_uxn_opcodes_h_l1036_c7_dbbe_iffalse,
result_MUX_uxn_opcodes_h_l1036_c7_dbbe_return_output);

-- opc_sth_uxn_opcodes_h_l1036_c39_6964
opc_sth_uxn_opcodes_h_l1036_c39_6964 : entity work.opc_sth_0CLK_3ec49a15 port map (
clk,
opc_sth_uxn_opcodes_h_l1036_c39_6964_CLOCK_ENABLE,
opc_sth_uxn_opcodes_h_l1036_c39_6964_stack_index,
opc_sth_uxn_opcodes_h_l1036_c39_6964_ins,
opc_sth_uxn_opcodes_h_l1036_c39_6964_k,
opc_sth_uxn_opcodes_h_l1036_c39_6964_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_left,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_right,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_return_output);

-- result_MUX_uxn_opcodes_h_l1037_c7_b6ac
result_MUX_uxn_opcodes_h_l1037_c7_b6ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1037_c7_b6ac_cond,
result_MUX_uxn_opcodes_h_l1037_c7_b6ac_iftrue,
result_MUX_uxn_opcodes_h_l1037_c7_b6ac_iffalse,
result_MUX_uxn_opcodes_h_l1037_c7_b6ac_return_output);

-- opc_sth2_uxn_opcodes_h_l1037_c39_84de
opc_sth2_uxn_opcodes_h_l1037_c39_84de : entity work.opc_sth2_0CLK_186906f2 port map (
clk,
opc_sth2_uxn_opcodes_h_l1037_c39_84de_CLOCK_ENABLE,
opc_sth2_uxn_opcodes_h_l1037_c39_84de_stack_index,
opc_sth2_uxn_opcodes_h_l1037_c39_84de_ins,
opc_sth2_uxn_opcodes_h_l1037_c39_84de_k,
opc_sth2_uxn_opcodes_h_l1037_c39_84de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_left,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_right,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_return_output);

-- result_MUX_uxn_opcodes_h_l1038_c7_f181
result_MUX_uxn_opcodes_h_l1038_c7_f181 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1038_c7_f181_cond,
result_MUX_uxn_opcodes_h_l1038_c7_f181_iftrue,
result_MUX_uxn_opcodes_h_l1038_c7_f181_iffalse,
result_MUX_uxn_opcodes_h_l1038_c7_f181_return_output);

-- opc_ldz_uxn_opcodes_h_l1038_c39_0dfb
opc_ldz_uxn_opcodes_h_l1038_c39_0dfb : entity work.opc_ldz_0CLK_7041f0d4 port map (
clk,
opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_CLOCK_ENABLE,
opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_stack_index,
opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_ins,
opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_k,
opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_left,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_right,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_return_output);

-- result_MUX_uxn_opcodes_h_l1039_c7_6d74
result_MUX_uxn_opcodes_h_l1039_c7_6d74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1039_c7_6d74_cond,
result_MUX_uxn_opcodes_h_l1039_c7_6d74_iftrue,
result_MUX_uxn_opcodes_h_l1039_c7_6d74_iffalse,
result_MUX_uxn_opcodes_h_l1039_c7_6d74_return_output);

-- opc_ldz2_uxn_opcodes_h_l1039_c39_2675
opc_ldz2_uxn_opcodes_h_l1039_c39_2675 : entity work.opc_ldz2_0CLK_7c39c135 port map (
clk,
opc_ldz2_uxn_opcodes_h_l1039_c39_2675_CLOCK_ENABLE,
opc_ldz2_uxn_opcodes_h_l1039_c39_2675_stack_index,
opc_ldz2_uxn_opcodes_h_l1039_c39_2675_ins,
opc_ldz2_uxn_opcodes_h_l1039_c39_2675_k,
opc_ldz2_uxn_opcodes_h_l1039_c39_2675_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_left,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_right,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_return_output);

-- result_MUX_uxn_opcodes_h_l1040_c7_4cdb
result_MUX_uxn_opcodes_h_l1040_c7_4cdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1040_c7_4cdb_cond,
result_MUX_uxn_opcodes_h_l1040_c7_4cdb_iftrue,
result_MUX_uxn_opcodes_h_l1040_c7_4cdb_iffalse,
result_MUX_uxn_opcodes_h_l1040_c7_4cdb_return_output);

-- opc_stz_uxn_opcodes_h_l1040_c39_6994
opc_stz_uxn_opcodes_h_l1040_c39_6994 : entity work.opc_stz_0CLK_b96dbee9 port map (
clk,
opc_stz_uxn_opcodes_h_l1040_c39_6994_CLOCK_ENABLE,
opc_stz_uxn_opcodes_h_l1040_c39_6994_stack_index,
opc_stz_uxn_opcodes_h_l1040_c39_6994_ins,
opc_stz_uxn_opcodes_h_l1040_c39_6994_k,
opc_stz_uxn_opcodes_h_l1040_c39_6994_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_left,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_right,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_return_output);

-- result_MUX_uxn_opcodes_h_l1041_c7_c58b
result_MUX_uxn_opcodes_h_l1041_c7_c58b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1041_c7_c58b_cond,
result_MUX_uxn_opcodes_h_l1041_c7_c58b_iftrue,
result_MUX_uxn_opcodes_h_l1041_c7_c58b_iffalse,
result_MUX_uxn_opcodes_h_l1041_c7_c58b_return_output);

-- opc_stz2_uxn_opcodes_h_l1041_c39_2a8e
opc_stz2_uxn_opcodes_h_l1041_c39_2a8e : entity work.opc_stz2_0CLK_4d96a8bf port map (
clk,
opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_CLOCK_ENABLE,
opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_stack_index,
opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_ins,
opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_k,
opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_left,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_right,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_return_output);

-- result_MUX_uxn_opcodes_h_l1042_c7_6143
result_MUX_uxn_opcodes_h_l1042_c7_6143 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1042_c7_6143_cond,
result_MUX_uxn_opcodes_h_l1042_c7_6143_iftrue,
result_MUX_uxn_opcodes_h_l1042_c7_6143_iffalse,
result_MUX_uxn_opcodes_h_l1042_c7_6143_return_output);

-- opc_ldr_uxn_opcodes_h_l1042_c39_c7ea
opc_ldr_uxn_opcodes_h_l1042_c39_c7ea : entity work.opc_ldr_0CLK_82f21321 port map (
clk,
opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_CLOCK_ENABLE,
opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_stack_index,
opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_ins,
opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_k,
opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_left,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_right,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_return_output);

-- result_MUX_uxn_opcodes_h_l1043_c7_f3ce
result_MUX_uxn_opcodes_h_l1043_c7_f3ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1043_c7_f3ce_cond,
result_MUX_uxn_opcodes_h_l1043_c7_f3ce_iftrue,
result_MUX_uxn_opcodes_h_l1043_c7_f3ce_iffalse,
result_MUX_uxn_opcodes_h_l1043_c7_f3ce_return_output);

-- opc_ldr2_uxn_opcodes_h_l1043_c39_a25d
opc_ldr2_uxn_opcodes_h_l1043_c39_a25d : entity work.opc_ldr2_0CLK_70d4381b port map (
clk,
opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_CLOCK_ENABLE,
opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_stack_index,
opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_ins,
opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_k,
opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_left,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_right,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_return_output);

-- result_MUX_uxn_opcodes_h_l1044_c7_3d7a
result_MUX_uxn_opcodes_h_l1044_c7_3d7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1044_c7_3d7a_cond,
result_MUX_uxn_opcodes_h_l1044_c7_3d7a_iftrue,
result_MUX_uxn_opcodes_h_l1044_c7_3d7a_iffalse,
result_MUX_uxn_opcodes_h_l1044_c7_3d7a_return_output);

-- opc_str_uxn_opcodes_h_l1044_c39_3bcb
opc_str_uxn_opcodes_h_l1044_c39_3bcb : entity work.opc_str_0CLK_312a4701 port map (
clk,
opc_str_uxn_opcodes_h_l1044_c39_3bcb_CLOCK_ENABLE,
opc_str_uxn_opcodes_h_l1044_c39_3bcb_stack_index,
opc_str_uxn_opcodes_h_l1044_c39_3bcb_ins,
opc_str_uxn_opcodes_h_l1044_c39_3bcb_k,
opc_str_uxn_opcodes_h_l1044_c39_3bcb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_left,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_right,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_return_output);

-- result_MUX_uxn_opcodes_h_l1045_c7_bd42
result_MUX_uxn_opcodes_h_l1045_c7_bd42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1045_c7_bd42_cond,
result_MUX_uxn_opcodes_h_l1045_c7_bd42_iftrue,
result_MUX_uxn_opcodes_h_l1045_c7_bd42_iffalse,
result_MUX_uxn_opcodes_h_l1045_c7_bd42_return_output);

-- opc_str2_uxn_opcodes_h_l1045_c39_0238
opc_str2_uxn_opcodes_h_l1045_c39_0238 : entity work.opc_str2_0CLK_9c90a87c port map (
clk,
opc_str2_uxn_opcodes_h_l1045_c39_0238_CLOCK_ENABLE,
opc_str2_uxn_opcodes_h_l1045_c39_0238_stack_index,
opc_str2_uxn_opcodes_h_l1045_c39_0238_ins,
opc_str2_uxn_opcodes_h_l1045_c39_0238_k,
opc_str2_uxn_opcodes_h_l1045_c39_0238_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_left,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_right,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_return_output);

-- result_MUX_uxn_opcodes_h_l1046_c7_5974
result_MUX_uxn_opcodes_h_l1046_c7_5974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1046_c7_5974_cond,
result_MUX_uxn_opcodes_h_l1046_c7_5974_iftrue,
result_MUX_uxn_opcodes_h_l1046_c7_5974_iffalse,
result_MUX_uxn_opcodes_h_l1046_c7_5974_return_output);

-- opc_lda_uxn_opcodes_h_l1046_c39_cb7e
opc_lda_uxn_opcodes_h_l1046_c39_cb7e : entity work.opc_lda_0CLK_bb6fd9ae port map (
clk,
opc_lda_uxn_opcodes_h_l1046_c39_cb7e_CLOCK_ENABLE,
opc_lda_uxn_opcodes_h_l1046_c39_cb7e_stack_index,
opc_lda_uxn_opcodes_h_l1046_c39_cb7e_ins,
opc_lda_uxn_opcodes_h_l1046_c39_cb7e_k,
opc_lda_uxn_opcodes_h_l1046_c39_cb7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_left,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_right,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_return_output);

-- result_MUX_uxn_opcodes_h_l1047_c7_8724
result_MUX_uxn_opcodes_h_l1047_c7_8724 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1047_c7_8724_cond,
result_MUX_uxn_opcodes_h_l1047_c7_8724_iftrue,
result_MUX_uxn_opcodes_h_l1047_c7_8724_iffalse,
result_MUX_uxn_opcodes_h_l1047_c7_8724_return_output);

-- opc_lda2_uxn_opcodes_h_l1047_c39_34a3
opc_lda2_uxn_opcodes_h_l1047_c39_34a3 : entity work.opc_lda2_0CLK_92ff38d5 port map (
clk,
opc_lda2_uxn_opcodes_h_l1047_c39_34a3_CLOCK_ENABLE,
opc_lda2_uxn_opcodes_h_l1047_c39_34a3_stack_index,
opc_lda2_uxn_opcodes_h_l1047_c39_34a3_ins,
opc_lda2_uxn_opcodes_h_l1047_c39_34a3_k,
opc_lda2_uxn_opcodes_h_l1047_c39_34a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_left,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_right,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_return_output);

-- result_MUX_uxn_opcodes_h_l1048_c7_cdaa
result_MUX_uxn_opcodes_h_l1048_c7_cdaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1048_c7_cdaa_cond,
result_MUX_uxn_opcodes_h_l1048_c7_cdaa_iftrue,
result_MUX_uxn_opcodes_h_l1048_c7_cdaa_iffalse,
result_MUX_uxn_opcodes_h_l1048_c7_cdaa_return_output);

-- opc_sta_uxn_opcodes_h_l1048_c39_f60b
opc_sta_uxn_opcodes_h_l1048_c39_f60b : entity work.opc_sta_0CLK_9debfd4d port map (
clk,
opc_sta_uxn_opcodes_h_l1048_c39_f60b_CLOCK_ENABLE,
opc_sta_uxn_opcodes_h_l1048_c39_f60b_stack_index,
opc_sta_uxn_opcodes_h_l1048_c39_f60b_ins,
opc_sta_uxn_opcodes_h_l1048_c39_f60b_k,
opc_sta_uxn_opcodes_h_l1048_c39_f60b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_left,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_right,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_return_output);

-- result_MUX_uxn_opcodes_h_l1049_c7_2eac
result_MUX_uxn_opcodes_h_l1049_c7_2eac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1049_c7_2eac_cond,
result_MUX_uxn_opcodes_h_l1049_c7_2eac_iftrue,
result_MUX_uxn_opcodes_h_l1049_c7_2eac_iffalse,
result_MUX_uxn_opcodes_h_l1049_c7_2eac_return_output);

-- opc_sta2_uxn_opcodes_h_l1049_c39_c94e
opc_sta2_uxn_opcodes_h_l1049_c39_c94e : entity work.opc_sta2_0CLK_5153798f port map (
clk,
opc_sta2_uxn_opcodes_h_l1049_c39_c94e_CLOCK_ENABLE,
opc_sta2_uxn_opcodes_h_l1049_c39_c94e_stack_index,
opc_sta2_uxn_opcodes_h_l1049_c39_c94e_ins,
opc_sta2_uxn_opcodes_h_l1049_c39_c94e_k,
opc_sta2_uxn_opcodes_h_l1049_c39_c94e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_return_output);

-- result_MUX_uxn_opcodes_h_l1050_c7_4e7f
result_MUX_uxn_opcodes_h_l1050_c7_4e7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1050_c7_4e7f_cond,
result_MUX_uxn_opcodes_h_l1050_c7_4e7f_iftrue,
result_MUX_uxn_opcodes_h_l1050_c7_4e7f_iffalse,
result_MUX_uxn_opcodes_h_l1050_c7_4e7f_return_output);

-- opc_dei_uxn_opcodes_h_l1050_c39_1dff
opc_dei_uxn_opcodes_h_l1050_c39_1dff : entity work.opc_dei_0CLK_4cadf5f3 port map (
clk,
opc_dei_uxn_opcodes_h_l1050_c39_1dff_CLOCK_ENABLE,
opc_dei_uxn_opcodes_h_l1050_c39_1dff_stack_index,
opc_dei_uxn_opcodes_h_l1050_c39_1dff_ins,
opc_dei_uxn_opcodes_h_l1050_c39_1dff_k,
opc_dei_uxn_opcodes_h_l1050_c39_1dff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_left,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_right,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_return_output);

-- result_MUX_uxn_opcodes_h_l1051_c7_54aa
result_MUX_uxn_opcodes_h_l1051_c7_54aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1051_c7_54aa_cond,
result_MUX_uxn_opcodes_h_l1051_c7_54aa_iftrue,
result_MUX_uxn_opcodes_h_l1051_c7_54aa_iffalse,
result_MUX_uxn_opcodes_h_l1051_c7_54aa_return_output);

-- opc_dei2_uxn_opcodes_h_l1051_c39_e29e
opc_dei2_uxn_opcodes_h_l1051_c39_e29e : entity work.opc_dei2_0CLK_1a8244c2 port map (
clk,
opc_dei2_uxn_opcodes_h_l1051_c39_e29e_CLOCK_ENABLE,
opc_dei2_uxn_opcodes_h_l1051_c39_e29e_stack_index,
opc_dei2_uxn_opcodes_h_l1051_c39_e29e_ins,
opc_dei2_uxn_opcodes_h_l1051_c39_e29e_k,
opc_dei2_uxn_opcodes_h_l1051_c39_e29e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_left,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_right,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_return_output);

-- result_MUX_uxn_opcodes_h_l1052_c7_c253
result_MUX_uxn_opcodes_h_l1052_c7_c253 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1052_c7_c253_cond,
result_MUX_uxn_opcodes_h_l1052_c7_c253_iftrue,
result_MUX_uxn_opcodes_h_l1052_c7_c253_iffalse,
result_MUX_uxn_opcodes_h_l1052_c7_c253_return_output);

-- opc_deo_uxn_opcodes_h_l1052_c39_444c
opc_deo_uxn_opcodes_h_l1052_c39_444c : entity work.opc_deo_0CLK_434848af port map (
clk,
opc_deo_uxn_opcodes_h_l1052_c39_444c_CLOCK_ENABLE,
opc_deo_uxn_opcodes_h_l1052_c39_444c_stack_index,
opc_deo_uxn_opcodes_h_l1052_c39_444c_ins,
opc_deo_uxn_opcodes_h_l1052_c39_444c_k,
opc_deo_uxn_opcodes_h_l1052_c39_444c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_left,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_right,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_return_output);

-- result_MUX_uxn_opcodes_h_l1053_c7_77f8
result_MUX_uxn_opcodes_h_l1053_c7_77f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1053_c7_77f8_cond,
result_MUX_uxn_opcodes_h_l1053_c7_77f8_iftrue,
result_MUX_uxn_opcodes_h_l1053_c7_77f8_iffalse,
result_MUX_uxn_opcodes_h_l1053_c7_77f8_return_output);

-- opc_deo2_uxn_opcodes_h_l1053_c39_f18b
opc_deo2_uxn_opcodes_h_l1053_c39_f18b : entity work.opc_deo2_0CLK_d7508b32 port map (
clk,
opc_deo2_uxn_opcodes_h_l1053_c39_f18b_CLOCK_ENABLE,
opc_deo2_uxn_opcodes_h_l1053_c39_f18b_stack_index,
opc_deo2_uxn_opcodes_h_l1053_c39_f18b_ins,
opc_deo2_uxn_opcodes_h_l1053_c39_f18b_k,
opc_deo2_uxn_opcodes_h_l1053_c39_f18b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_left,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_right,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_return_output);

-- result_MUX_uxn_opcodes_h_l1054_c7_9d06
result_MUX_uxn_opcodes_h_l1054_c7_9d06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1054_c7_9d06_cond,
result_MUX_uxn_opcodes_h_l1054_c7_9d06_iftrue,
result_MUX_uxn_opcodes_h_l1054_c7_9d06_iffalse,
result_MUX_uxn_opcodes_h_l1054_c7_9d06_return_output);

-- opc_add_uxn_opcodes_h_l1054_c39_eb76
opc_add_uxn_opcodes_h_l1054_c39_eb76 : entity work.opc_add_0CLK_fec2727b port map (
clk,
opc_add_uxn_opcodes_h_l1054_c39_eb76_CLOCK_ENABLE,
opc_add_uxn_opcodes_h_l1054_c39_eb76_stack_index,
opc_add_uxn_opcodes_h_l1054_c39_eb76_ins,
opc_add_uxn_opcodes_h_l1054_c39_eb76_k,
opc_add_uxn_opcodes_h_l1054_c39_eb76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_return_output);

-- result_MUX_uxn_opcodes_h_l1055_c7_8db0
result_MUX_uxn_opcodes_h_l1055_c7_8db0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1055_c7_8db0_cond,
result_MUX_uxn_opcodes_h_l1055_c7_8db0_iftrue,
result_MUX_uxn_opcodes_h_l1055_c7_8db0_iffalse,
result_MUX_uxn_opcodes_h_l1055_c7_8db0_return_output);

-- opc_add2_uxn_opcodes_h_l1055_c39_9d77
opc_add2_uxn_opcodes_h_l1055_c39_9d77 : entity work.opc_add2_0CLK_3ec85585 port map (
clk,
opc_add2_uxn_opcodes_h_l1055_c39_9d77_CLOCK_ENABLE,
opc_add2_uxn_opcodes_h_l1055_c39_9d77_stack_index,
opc_add2_uxn_opcodes_h_l1055_c39_9d77_ins,
opc_add2_uxn_opcodes_h_l1055_c39_9d77_k,
opc_add2_uxn_opcodes_h_l1055_c39_9d77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_left,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_right,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_return_output);

-- result_MUX_uxn_opcodes_h_l1056_c7_a24a
result_MUX_uxn_opcodes_h_l1056_c7_a24a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1056_c7_a24a_cond,
result_MUX_uxn_opcodes_h_l1056_c7_a24a_iftrue,
result_MUX_uxn_opcodes_h_l1056_c7_a24a_iffalse,
result_MUX_uxn_opcodes_h_l1056_c7_a24a_return_output);

-- opc_sub_uxn_opcodes_h_l1056_c39_65ca
opc_sub_uxn_opcodes_h_l1056_c39_65ca : entity work.opc_sub_0CLK_fec2727b port map (
clk,
opc_sub_uxn_opcodes_h_l1056_c39_65ca_CLOCK_ENABLE,
opc_sub_uxn_opcodes_h_l1056_c39_65ca_stack_index,
opc_sub_uxn_opcodes_h_l1056_c39_65ca_ins,
opc_sub_uxn_opcodes_h_l1056_c39_65ca_k,
opc_sub_uxn_opcodes_h_l1056_c39_65ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_left,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_right,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_return_output);

-- result_MUX_uxn_opcodes_h_l1057_c7_b54c
result_MUX_uxn_opcodes_h_l1057_c7_b54c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1057_c7_b54c_cond,
result_MUX_uxn_opcodes_h_l1057_c7_b54c_iftrue,
result_MUX_uxn_opcodes_h_l1057_c7_b54c_iffalse,
result_MUX_uxn_opcodes_h_l1057_c7_b54c_return_output);

-- opc_sub2_uxn_opcodes_h_l1057_c39_0279
opc_sub2_uxn_opcodes_h_l1057_c39_0279 : entity work.opc_sub2_0CLK_3ec85585 port map (
clk,
opc_sub2_uxn_opcodes_h_l1057_c39_0279_CLOCK_ENABLE,
opc_sub2_uxn_opcodes_h_l1057_c39_0279_stack_index,
opc_sub2_uxn_opcodes_h_l1057_c39_0279_ins,
opc_sub2_uxn_opcodes_h_l1057_c39_0279_k,
opc_sub2_uxn_opcodes_h_l1057_c39_0279_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_left,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_right,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_return_output);

-- result_MUX_uxn_opcodes_h_l1058_c7_f141
result_MUX_uxn_opcodes_h_l1058_c7_f141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1058_c7_f141_cond,
result_MUX_uxn_opcodes_h_l1058_c7_f141_iftrue,
result_MUX_uxn_opcodes_h_l1058_c7_f141_iffalse,
result_MUX_uxn_opcodes_h_l1058_c7_f141_return_output);

-- opc_mul_uxn_opcodes_h_l1058_c39_18b8
opc_mul_uxn_opcodes_h_l1058_c39_18b8 : entity work.opc_mul_0CLK_fec2727b port map (
clk,
opc_mul_uxn_opcodes_h_l1058_c39_18b8_CLOCK_ENABLE,
opc_mul_uxn_opcodes_h_l1058_c39_18b8_stack_index,
opc_mul_uxn_opcodes_h_l1058_c39_18b8_ins,
opc_mul_uxn_opcodes_h_l1058_c39_18b8_k,
opc_mul_uxn_opcodes_h_l1058_c39_18b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_left,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_right,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_return_output);

-- result_MUX_uxn_opcodes_h_l1059_c7_c575
result_MUX_uxn_opcodes_h_l1059_c7_c575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1059_c7_c575_cond,
result_MUX_uxn_opcodes_h_l1059_c7_c575_iftrue,
result_MUX_uxn_opcodes_h_l1059_c7_c575_iffalse,
result_MUX_uxn_opcodes_h_l1059_c7_c575_return_output);

-- opc_mul2_uxn_opcodes_h_l1059_c39_4623
opc_mul2_uxn_opcodes_h_l1059_c39_4623 : entity work.opc_mul2_0CLK_3ec85585 port map (
clk,
opc_mul2_uxn_opcodes_h_l1059_c39_4623_CLOCK_ENABLE,
opc_mul2_uxn_opcodes_h_l1059_c39_4623_stack_index,
opc_mul2_uxn_opcodes_h_l1059_c39_4623_ins,
opc_mul2_uxn_opcodes_h_l1059_c39_4623_k,
opc_mul2_uxn_opcodes_h_l1059_c39_4623_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_left,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_right,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_return_output);

-- result_MUX_uxn_opcodes_h_l1060_c7_602b
result_MUX_uxn_opcodes_h_l1060_c7_602b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1060_c7_602b_cond,
result_MUX_uxn_opcodes_h_l1060_c7_602b_iftrue,
result_MUX_uxn_opcodes_h_l1060_c7_602b_iffalse,
result_MUX_uxn_opcodes_h_l1060_c7_602b_return_output);

-- opc_div_uxn_opcodes_h_l1060_c39_c18c
opc_div_uxn_opcodes_h_l1060_c39_c18c : entity work.opc_div_0CLK_eff7b951 port map (
clk,
opc_div_uxn_opcodes_h_l1060_c39_c18c_CLOCK_ENABLE,
opc_div_uxn_opcodes_h_l1060_c39_c18c_stack_index,
opc_div_uxn_opcodes_h_l1060_c39_c18c_ins,
opc_div_uxn_opcodes_h_l1060_c39_c18c_k,
opc_div_uxn_opcodes_h_l1060_c39_c18c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_left,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_right,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_return_output);

-- result_MUX_uxn_opcodes_h_l1061_c7_50f7
result_MUX_uxn_opcodes_h_l1061_c7_50f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1061_c7_50f7_cond,
result_MUX_uxn_opcodes_h_l1061_c7_50f7_iftrue,
result_MUX_uxn_opcodes_h_l1061_c7_50f7_iffalse,
result_MUX_uxn_opcodes_h_l1061_c7_50f7_return_output);

-- opc_div2_uxn_opcodes_h_l1061_c39_4306
opc_div2_uxn_opcodes_h_l1061_c39_4306 : entity work.opc_div2_0CLK_e1a1d759 port map (
clk,
opc_div2_uxn_opcodes_h_l1061_c39_4306_CLOCK_ENABLE,
opc_div2_uxn_opcodes_h_l1061_c39_4306_stack_index,
opc_div2_uxn_opcodes_h_l1061_c39_4306_ins,
opc_div2_uxn_opcodes_h_l1061_c39_4306_k,
opc_div2_uxn_opcodes_h_l1061_c39_4306_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_left,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_right,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_return_output);

-- result_MUX_uxn_opcodes_h_l1062_c7_1c17
result_MUX_uxn_opcodes_h_l1062_c7_1c17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1062_c7_1c17_cond,
result_MUX_uxn_opcodes_h_l1062_c7_1c17_iftrue,
result_MUX_uxn_opcodes_h_l1062_c7_1c17_iffalse,
result_MUX_uxn_opcodes_h_l1062_c7_1c17_return_output);

-- opc_and_uxn_opcodes_h_l1062_c39_beaf
opc_and_uxn_opcodes_h_l1062_c39_beaf : entity work.opc_and_0CLK_fec2727b port map (
clk,
opc_and_uxn_opcodes_h_l1062_c39_beaf_CLOCK_ENABLE,
opc_and_uxn_opcodes_h_l1062_c39_beaf_stack_index,
opc_and_uxn_opcodes_h_l1062_c39_beaf_ins,
opc_and_uxn_opcodes_h_l1062_c39_beaf_k,
opc_and_uxn_opcodes_h_l1062_c39_beaf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_return_output);

-- result_MUX_uxn_opcodes_h_l1063_c7_af6f
result_MUX_uxn_opcodes_h_l1063_c7_af6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1063_c7_af6f_cond,
result_MUX_uxn_opcodes_h_l1063_c7_af6f_iftrue,
result_MUX_uxn_opcodes_h_l1063_c7_af6f_iffalse,
result_MUX_uxn_opcodes_h_l1063_c7_af6f_return_output);

-- opc_and2_uxn_opcodes_h_l1063_c39_4cda
opc_and2_uxn_opcodes_h_l1063_c39_4cda : entity work.opc_and2_0CLK_3ec85585 port map (
clk,
opc_and2_uxn_opcodes_h_l1063_c39_4cda_CLOCK_ENABLE,
opc_and2_uxn_opcodes_h_l1063_c39_4cda_stack_index,
opc_and2_uxn_opcodes_h_l1063_c39_4cda_ins,
opc_and2_uxn_opcodes_h_l1063_c39_4cda_k,
opc_and2_uxn_opcodes_h_l1063_c39_4cda_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_left,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_right,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_return_output);

-- result_MUX_uxn_opcodes_h_l1064_c7_2d03
result_MUX_uxn_opcodes_h_l1064_c7_2d03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1064_c7_2d03_cond,
result_MUX_uxn_opcodes_h_l1064_c7_2d03_iftrue,
result_MUX_uxn_opcodes_h_l1064_c7_2d03_iffalse,
result_MUX_uxn_opcodes_h_l1064_c7_2d03_return_output);

-- opc_ora_uxn_opcodes_h_l1064_c39_17ed
opc_ora_uxn_opcodes_h_l1064_c39_17ed : entity work.opc_ora_0CLK_fec2727b port map (
clk,
opc_ora_uxn_opcodes_h_l1064_c39_17ed_CLOCK_ENABLE,
opc_ora_uxn_opcodes_h_l1064_c39_17ed_stack_index,
opc_ora_uxn_opcodes_h_l1064_c39_17ed_ins,
opc_ora_uxn_opcodes_h_l1064_c39_17ed_k,
opc_ora_uxn_opcodes_h_l1064_c39_17ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_left,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_right,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_return_output);

-- result_MUX_uxn_opcodes_h_l1065_c7_6f40
result_MUX_uxn_opcodes_h_l1065_c7_6f40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1065_c7_6f40_cond,
result_MUX_uxn_opcodes_h_l1065_c7_6f40_iftrue,
result_MUX_uxn_opcodes_h_l1065_c7_6f40_iffalse,
result_MUX_uxn_opcodes_h_l1065_c7_6f40_return_output);

-- opc_ora2_uxn_opcodes_h_l1065_c39_3b66
opc_ora2_uxn_opcodes_h_l1065_c39_3b66 : entity work.opc_ora2_0CLK_3ec85585 port map (
clk,
opc_ora2_uxn_opcodes_h_l1065_c39_3b66_CLOCK_ENABLE,
opc_ora2_uxn_opcodes_h_l1065_c39_3b66_stack_index,
opc_ora2_uxn_opcodes_h_l1065_c39_3b66_ins,
opc_ora2_uxn_opcodes_h_l1065_c39_3b66_k,
opc_ora2_uxn_opcodes_h_l1065_c39_3b66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_left,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_right,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_return_output);

-- result_MUX_uxn_opcodes_h_l1066_c7_4edb
result_MUX_uxn_opcodes_h_l1066_c7_4edb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1066_c7_4edb_cond,
result_MUX_uxn_opcodes_h_l1066_c7_4edb_iftrue,
result_MUX_uxn_opcodes_h_l1066_c7_4edb_iffalse,
result_MUX_uxn_opcodes_h_l1066_c7_4edb_return_output);

-- opc_eor_uxn_opcodes_h_l1066_c39_2d57
opc_eor_uxn_opcodes_h_l1066_c39_2d57 : entity work.opc_eor_0CLK_fec2727b port map (
clk,
opc_eor_uxn_opcodes_h_l1066_c39_2d57_CLOCK_ENABLE,
opc_eor_uxn_opcodes_h_l1066_c39_2d57_stack_index,
opc_eor_uxn_opcodes_h_l1066_c39_2d57_ins,
opc_eor_uxn_opcodes_h_l1066_c39_2d57_k,
opc_eor_uxn_opcodes_h_l1066_c39_2d57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_return_output);

-- result_MUX_uxn_opcodes_h_l1067_c7_fbdc
result_MUX_uxn_opcodes_h_l1067_c7_fbdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1067_c7_fbdc_cond,
result_MUX_uxn_opcodes_h_l1067_c7_fbdc_iftrue,
result_MUX_uxn_opcodes_h_l1067_c7_fbdc_iffalse,
result_MUX_uxn_opcodes_h_l1067_c7_fbdc_return_output);

-- opc_eor2_uxn_opcodes_h_l1067_c39_49c5
opc_eor2_uxn_opcodes_h_l1067_c39_49c5 : entity work.opc_eor2_0CLK_3ec85585 port map (
clk,
opc_eor2_uxn_opcodes_h_l1067_c39_49c5_CLOCK_ENABLE,
opc_eor2_uxn_opcodes_h_l1067_c39_49c5_stack_index,
opc_eor2_uxn_opcodes_h_l1067_c39_49c5_ins,
opc_eor2_uxn_opcodes_h_l1067_c39_49c5_k,
opc_eor2_uxn_opcodes_h_l1067_c39_49c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_left,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_right,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_return_output);

-- result_MUX_uxn_opcodes_h_l1068_c7_5645
result_MUX_uxn_opcodes_h_l1068_c7_5645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1068_c7_5645_cond,
result_MUX_uxn_opcodes_h_l1068_c7_5645_iftrue,
result_MUX_uxn_opcodes_h_l1068_c7_5645_iffalse,
result_MUX_uxn_opcodes_h_l1068_c7_5645_return_output);

-- opc_sft_uxn_opcodes_h_l1068_c39_8c1c
opc_sft_uxn_opcodes_h_l1068_c39_8c1c : entity work.opc_sft_0CLK_db76791a port map (
clk,
opc_sft_uxn_opcodes_h_l1068_c39_8c1c_CLOCK_ENABLE,
opc_sft_uxn_opcodes_h_l1068_c39_8c1c_stack_index,
opc_sft_uxn_opcodes_h_l1068_c39_8c1c_ins,
opc_sft_uxn_opcodes_h_l1068_c39_8c1c_k,
opc_sft_uxn_opcodes_h_l1068_c39_8c1c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_left,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_right,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_return_output);

-- result_MUX_uxn_opcodes_h_l1069_c7_6b41
result_MUX_uxn_opcodes_h_l1069_c7_6b41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1069_c7_6b41_cond,
result_MUX_uxn_opcodes_h_l1069_c7_6b41_iftrue,
result_MUX_uxn_opcodes_h_l1069_c7_6b41_iffalse,
result_MUX_uxn_opcodes_h_l1069_c7_6b41_return_output);

-- opc_sft2_uxn_opcodes_h_l1069_c39_8375
opc_sft2_uxn_opcodes_h_l1069_c39_8375 : entity work.opc_sft2_0CLK_effe98ec port map (
clk,
opc_sft2_uxn_opcodes_h_l1069_c39_8375_CLOCK_ENABLE,
opc_sft2_uxn_opcodes_h_l1069_c39_8375_stack_index,
opc_sft2_uxn_opcodes_h_l1069_c39_8375_ins,
opc_sft2_uxn_opcodes_h_l1069_c39_8375_k,
opc_sft2_uxn_opcodes_h_l1069_c39_8375_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_return_output,
 result_MUX_uxn_opcodes_h_l1000_c2_7834_return_output,
 opc_brk_uxn_opcodes_h_l1000_c34_6db9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_return_output,
 result_MUX_uxn_opcodes_h_l1001_c7_5059_return_output,
 opc_jci_uxn_opcodes_h_l1001_c39_362a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_return_output,
 result_MUX_uxn_opcodes_h_l1002_c7_82d3_return_output,
 opc_jmi_uxn_opcodes_h_l1002_c39_4f20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_return_output,
 result_MUX_uxn_opcodes_h_l1003_c7_5b9e_return_output,
 opc_jsi_uxn_opcodes_h_l1003_c39_5cad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_return_output,
 result_MUX_uxn_opcodes_h_l1004_c7_5e95_return_output,
 opc_lit_uxn_opcodes_h_l1004_c39_0c05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_return_output,
 result_MUX_uxn_opcodes_h_l1005_c7_04b3_return_output,
 opc_lit2_uxn_opcodes_h_l1005_c39_25ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_return_output,
 result_MUX_uxn_opcodes_h_l1006_c7_af65_return_output,
 opc_litr_uxn_opcodes_h_l1006_c39_db2c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_return_output,
 result_MUX_uxn_opcodes_h_l1007_c7_9f80_return_output,
 opc_lit2r_uxn_opcodes_h_l1007_c39_4136_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_return_output,
 result_MUX_uxn_opcodes_h_l1008_c7_526d_return_output,
 opc_inc_uxn_opcodes_h_l1008_c39_edb1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_return_output,
 result_MUX_uxn_opcodes_h_l1009_c7_a1a7_return_output,
 opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_return_output,
 result_MUX_uxn_opcodes_h_l1010_c7_8bb9_return_output,
 opc_pop_uxn_opcodes_h_l1010_c39_d627_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_return_output,
 result_MUX_uxn_opcodes_h_l1011_c7_bd86_return_output,
 opc_pop2_uxn_opcodes_h_l1011_c39_196a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_return_output,
 result_MUX_uxn_opcodes_h_l1012_c7_b1e0_return_output,
 opc_nip_uxn_opcodes_h_l1012_c39_f246_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_return_output,
 result_MUX_uxn_opcodes_h_l1013_c7_fde3_return_output,
 opc_nip2_uxn_opcodes_h_l1013_c39_e112_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_return_output,
 result_MUX_uxn_opcodes_h_l1014_c7_6c5b_return_output,
 opc_swp_uxn_opcodes_h_l1014_c39_c5fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_return_output,
 result_MUX_uxn_opcodes_h_l1015_c7_f040_return_output,
 opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_return_output,
 result_MUX_uxn_opcodes_h_l1016_c7_beeb_return_output,
 opc_rot_uxn_opcodes_h_l1016_c39_5b39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_return_output,
 result_MUX_uxn_opcodes_h_l1017_c7_dfe5_return_output,
 opc_rot2_uxn_opcodes_h_l1017_c39_3178_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_return_output,
 result_MUX_uxn_opcodes_h_l1018_c7_4769_return_output,
 opc_dup_uxn_opcodes_h_l1018_c39_27b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_return_output,
 result_MUX_uxn_opcodes_h_l1019_c7_c4ef_return_output,
 opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_return_output,
 result_MUX_uxn_opcodes_h_l1020_c7_44ea_return_output,
 opc_ovr_uxn_opcodes_h_l1020_c39_8c15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_return_output,
 result_MUX_uxn_opcodes_h_l1021_c7_aab0_return_output,
 opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_return_output,
 result_MUX_uxn_opcodes_h_l1022_c7_e6ee_return_output,
 opc_equ_uxn_opcodes_h_l1022_c39_c3f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_return_output,
 result_MUX_uxn_opcodes_h_l1023_c7_7adc_return_output,
 opc_equ2_uxn_opcodes_h_l1023_c39_242e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_return_output,
 result_MUX_uxn_opcodes_h_l1024_c7_4346_return_output,
 opc_neq_uxn_opcodes_h_l1024_c39_986c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_return_output,
 result_MUX_uxn_opcodes_h_l1025_c7_d961_return_output,
 opc_neq2_uxn_opcodes_h_l1025_c39_268c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_return_output,
 result_MUX_uxn_opcodes_h_l1026_c7_d86d_return_output,
 opc_gth_uxn_opcodes_h_l1026_c39_4552_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_return_output,
 result_MUX_uxn_opcodes_h_l1027_c7_9a9f_return_output,
 opc_gth2_uxn_opcodes_h_l1027_c39_721a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_return_output,
 result_MUX_uxn_opcodes_h_l1028_c7_8a4b_return_output,
 opc_lth_uxn_opcodes_h_l1028_c39_13bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_return_output,
 result_MUX_uxn_opcodes_h_l1029_c7_b1a2_return_output,
 opc_lth2_uxn_opcodes_h_l1029_c39_76b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_return_output,
 result_MUX_uxn_opcodes_h_l1030_c7_e28b_return_output,
 opc_jmp_uxn_opcodes_h_l1030_c39_443c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_return_output,
 result_MUX_uxn_opcodes_h_l1031_c7_0198_return_output,
 opc_jmp2_uxn_opcodes_h_l1031_c39_761c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_return_output,
 result_MUX_uxn_opcodes_h_l1032_c7_12bf_return_output,
 opc_jcn_uxn_opcodes_h_l1032_c39_9630_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_return_output,
 result_MUX_uxn_opcodes_h_l1033_c7_ce7a_return_output,
 opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_return_output,
 result_MUX_uxn_opcodes_h_l1034_c7_ad42_return_output,
 opc_jsr_uxn_opcodes_h_l1034_c39_4563_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_return_output,
 result_MUX_uxn_opcodes_h_l1035_c7_2367_return_output,
 opc_jsr2_uxn_opcodes_h_l1035_c39_7497_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_return_output,
 result_MUX_uxn_opcodes_h_l1036_c7_dbbe_return_output,
 opc_sth_uxn_opcodes_h_l1036_c39_6964_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_return_output,
 result_MUX_uxn_opcodes_h_l1037_c7_b6ac_return_output,
 opc_sth2_uxn_opcodes_h_l1037_c39_84de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_return_output,
 result_MUX_uxn_opcodes_h_l1038_c7_f181_return_output,
 opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_return_output,
 result_MUX_uxn_opcodes_h_l1039_c7_6d74_return_output,
 opc_ldz2_uxn_opcodes_h_l1039_c39_2675_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_return_output,
 result_MUX_uxn_opcodes_h_l1040_c7_4cdb_return_output,
 opc_stz_uxn_opcodes_h_l1040_c39_6994_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_return_output,
 result_MUX_uxn_opcodes_h_l1041_c7_c58b_return_output,
 opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_return_output,
 result_MUX_uxn_opcodes_h_l1042_c7_6143_return_output,
 opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_return_output,
 result_MUX_uxn_opcodes_h_l1043_c7_f3ce_return_output,
 opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_return_output,
 result_MUX_uxn_opcodes_h_l1044_c7_3d7a_return_output,
 opc_str_uxn_opcodes_h_l1044_c39_3bcb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_return_output,
 result_MUX_uxn_opcodes_h_l1045_c7_bd42_return_output,
 opc_str2_uxn_opcodes_h_l1045_c39_0238_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_return_output,
 result_MUX_uxn_opcodes_h_l1046_c7_5974_return_output,
 opc_lda_uxn_opcodes_h_l1046_c39_cb7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_return_output,
 result_MUX_uxn_opcodes_h_l1047_c7_8724_return_output,
 opc_lda2_uxn_opcodes_h_l1047_c39_34a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_return_output,
 result_MUX_uxn_opcodes_h_l1048_c7_cdaa_return_output,
 opc_sta_uxn_opcodes_h_l1048_c39_f60b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_return_output,
 result_MUX_uxn_opcodes_h_l1049_c7_2eac_return_output,
 opc_sta2_uxn_opcodes_h_l1049_c39_c94e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_return_output,
 result_MUX_uxn_opcodes_h_l1050_c7_4e7f_return_output,
 opc_dei_uxn_opcodes_h_l1050_c39_1dff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_return_output,
 result_MUX_uxn_opcodes_h_l1051_c7_54aa_return_output,
 opc_dei2_uxn_opcodes_h_l1051_c39_e29e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_return_output,
 result_MUX_uxn_opcodes_h_l1052_c7_c253_return_output,
 opc_deo_uxn_opcodes_h_l1052_c39_444c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_return_output,
 result_MUX_uxn_opcodes_h_l1053_c7_77f8_return_output,
 opc_deo2_uxn_opcodes_h_l1053_c39_f18b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_return_output,
 result_MUX_uxn_opcodes_h_l1054_c7_9d06_return_output,
 opc_add_uxn_opcodes_h_l1054_c39_eb76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_return_output,
 result_MUX_uxn_opcodes_h_l1055_c7_8db0_return_output,
 opc_add2_uxn_opcodes_h_l1055_c39_9d77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_return_output,
 result_MUX_uxn_opcodes_h_l1056_c7_a24a_return_output,
 opc_sub_uxn_opcodes_h_l1056_c39_65ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_return_output,
 result_MUX_uxn_opcodes_h_l1057_c7_b54c_return_output,
 opc_sub2_uxn_opcodes_h_l1057_c39_0279_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_return_output,
 result_MUX_uxn_opcodes_h_l1058_c7_f141_return_output,
 opc_mul_uxn_opcodes_h_l1058_c39_18b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_return_output,
 result_MUX_uxn_opcodes_h_l1059_c7_c575_return_output,
 opc_mul2_uxn_opcodes_h_l1059_c39_4623_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_return_output,
 result_MUX_uxn_opcodes_h_l1060_c7_602b_return_output,
 opc_div_uxn_opcodes_h_l1060_c39_c18c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_return_output,
 result_MUX_uxn_opcodes_h_l1061_c7_50f7_return_output,
 opc_div2_uxn_opcodes_h_l1061_c39_4306_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_return_output,
 result_MUX_uxn_opcodes_h_l1062_c7_1c17_return_output,
 opc_and_uxn_opcodes_h_l1062_c39_beaf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_return_output,
 result_MUX_uxn_opcodes_h_l1063_c7_af6f_return_output,
 opc_and2_uxn_opcodes_h_l1063_c39_4cda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_return_output,
 result_MUX_uxn_opcodes_h_l1064_c7_2d03_return_output,
 opc_ora_uxn_opcodes_h_l1064_c39_17ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_return_output,
 result_MUX_uxn_opcodes_h_l1065_c7_6f40_return_output,
 opc_ora2_uxn_opcodes_h_l1065_c39_3b66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_return_output,
 result_MUX_uxn_opcodes_h_l1066_c7_4edb_return_output,
 opc_eor_uxn_opcodes_h_l1066_c39_2d57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_return_output,
 result_MUX_uxn_opcodes_h_l1067_c7_fbdc_return_output,
 opc_eor2_uxn_opcodes_h_l1067_c39_49c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_return_output,
 result_MUX_uxn_opcodes_h_l1068_c7_5645_return_output,
 opc_sft_uxn_opcodes_h_l1068_c39_8c1c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_return_output,
 result_MUX_uxn_opcodes_h_l1069_c7_6b41_return_output,
 opc_sft2_uxn_opcodes_h_l1069_c39_8375_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_opcode : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_7834_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_7834_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_5059_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_7834_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_7834_cond : unsigned(0 downto 0);
 variable VAR_opc_brk_uxn_opcodes_h_l1000_c34_6db9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_5059_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_5059_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_82d3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_5059_cond : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_362a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_362a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_362a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_82d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_82d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_5b9e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_82d3_cond : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_4f20_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_4f20_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_5b9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_5b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_5e95_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_5b9e_cond : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_5cad_ins : unsigned(7 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_5cad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_5cad_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_5e95_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_5e95_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_04b3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_5e95_cond : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_0c05_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_0c05_ins : unsigned(7 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_0c05_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_0c05_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_04b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_04b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_af65_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_04b3_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_25ab_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_25ab_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_25ab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_25ab_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_af65_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_af65_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_9f80_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_af65_cond : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_db2c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_db2c_ins : unsigned(7 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_db2c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_db2c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_9f80_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_9f80_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_526d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_9f80_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4136_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4136_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4136_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4136_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_526d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_526d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_a1a7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_526d_cond : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_edb1_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_edb1_ins : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_edb1_k : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_edb1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_edb1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_a1a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_a1a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_8bb9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_a1a7_cond : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_ins : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_k : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_8bb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_8bb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_bd86_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_8bb9_cond : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_d627_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_d627_ins : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_d627_k : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_d627_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_d627_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_bd86_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_bd86_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_b1e0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_bd86_cond : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_196a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_196a_ins : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_196a_k : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_196a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_196a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_b1e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_b1e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_fde3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_b1e0_cond : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_f246_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_f246_ins : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_f246_k : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_f246_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_f246_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_fde3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_fde3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_6c5b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_fde3_cond : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_e112_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_e112_ins : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_e112_k : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_e112_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_e112_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_6c5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_6c5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_f040_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_6c5b_cond : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_c5fd_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_c5fd_ins : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_c5fd_k : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_c5fd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_c5fd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_f040_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_f040_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_beeb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_f040_cond : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_ins : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_k : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_beeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_beeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_dfe5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_beeb_cond : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_5b39_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_5b39_ins : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_5b39_k : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_5b39_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_5b39_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_dfe5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_dfe5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_4769_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_dfe5_cond : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_3178_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_3178_ins : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_3178_k : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_3178_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_3178_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_4769_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_4769_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_c4ef_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_4769_cond : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_27b0_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_27b0_ins : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_27b0_k : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_27b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_27b0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_c4ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_c4ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_44ea_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_c4ef_cond : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_ins : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_k : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_44ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_44ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_aab0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_44ea_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8c15_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8c15_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8c15_k : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8c15_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8c15_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_aab0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_aab0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_e6ee_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_aab0_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_k : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_e6ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_e6ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_7adc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_e6ee_cond : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_c3f0_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_c3f0_ins : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_c3f0_k : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_c3f0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_c3f0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_7adc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_7adc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_4346_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_7adc_cond : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_242e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_242e_ins : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_242e_k : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_242e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_242e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_4346_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_4346_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_d961_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_4346_cond : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_986c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_986c_ins : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_986c_k : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_986c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_986c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_d961_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_d961_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_d86d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_d961_cond : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_268c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_268c_ins : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_268c_k : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_268c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_268c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_d86d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_d86d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a9f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_d86d_cond : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_4552_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_4552_ins : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_4552_k : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_4552_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_4552_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_8a4b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a9f_cond : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_721a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_721a_ins : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_721a_k : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_721a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_721a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_8a4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_8a4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_b1a2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_8a4b_cond : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_13bf_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_13bf_ins : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_13bf_k : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_13bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_13bf_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_b1a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_b1a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_e28b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_b1a2_cond : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_76b0_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_76b0_ins : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_76b0_k : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_76b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_76b0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_e28b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_e28b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_0198_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_e28b_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_443c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_443c_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_443c_k : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_443c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_443c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_0198_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_0198_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_12bf_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_0198_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_761c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_761c_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_761c_k : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_761c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_761c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_12bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_12bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_ce7a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_12bf_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9630_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9630_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9630_k : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9630_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9630_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_ce7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_ce7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_ad42_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_ce7a_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_k : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_ad42_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_ad42_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_2367_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_ad42_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4563_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4563_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4563_k : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4563_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4563_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_2367_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_2367_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_dbbe_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_2367_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7497_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7497_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7497_k : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7497_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7497_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_dbbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_dbbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_b6ac_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_dbbe_cond : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_6964_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_6964_ins : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_6964_k : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_6964_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_6964_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_b6ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_b6ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_f181_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_b6ac_cond : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_84de_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_84de_ins : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_84de_k : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_84de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_84de_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_f181_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_f181_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_6d74_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_f181_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_k : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_6d74_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_6d74_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_4cdb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_6d74_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_2675_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_2675_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_2675_k : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_2675_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_2675_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_4cdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_4cdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_c58b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_4cdb_cond : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_6994_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_6994_ins : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_6994_k : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_6994_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_6994_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_c58b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_c58b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_6143_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_c58b_cond : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_ins : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_k : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_6143_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_6143_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_f3ce_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_6143_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_k : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_f3ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_f3ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_3d7a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_f3ce_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_k : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_3d7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_3d7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_bd42_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_3d7a_cond : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_3bcb_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_3bcb_ins : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_3bcb_k : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_3bcb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_3bcb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_bd42_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_bd42_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_5974_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_bd42_cond : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_0238_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_0238_ins : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_0238_k : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_0238_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_0238_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_5974_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_5974_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_8724_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_5974_cond : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_cb7e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_cb7e_ins : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_cb7e_k : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_cb7e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_cb7e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_8724_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_8724_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_cdaa_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_8724_cond : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_34a3_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_34a3_ins : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_34a3_k : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_34a3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_34a3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_cdaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_cdaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_2eac_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_cdaa_cond : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_f60b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_f60b_ins : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_f60b_k : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_f60b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_f60b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_2eac_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_2eac_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_4e7f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_2eac_cond : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c94e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c94e_ins : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c94e_k : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c94e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c94e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_4e7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_4e7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_54aa_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_4e7f_cond : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_1dff_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_1dff_ins : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_1dff_k : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_1dff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_1dff_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_54aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_54aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_c253_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_54aa_cond : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e29e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e29e_ins : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e29e_k : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e29e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e29e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_c253_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_c253_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_77f8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_c253_cond : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_444c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_444c_ins : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_444c_k : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_444c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_444c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_77f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_77f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_9d06_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_77f8_cond : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_f18b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_f18b_ins : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_f18b_k : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_f18b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_f18b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_9d06_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_9d06_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_8db0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_9d06_cond : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_eb76_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_eb76_ins : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_eb76_k : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_eb76_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_eb76_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_8db0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_8db0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_a24a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_8db0_cond : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_9d77_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_9d77_ins : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_9d77_k : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_9d77_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_9d77_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_a24a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_a24a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_b54c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_a24a_cond : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_65ca_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_65ca_ins : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_65ca_k : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_65ca_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_65ca_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_b54c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_b54c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_f141_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_b54c_cond : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0279_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0279_ins : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0279_k : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0279_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0279_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_f141_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_f141_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_c575_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_f141_cond : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_18b8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_18b8_ins : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_18b8_k : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_18b8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_18b8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_c575_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_c575_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_602b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_c575_cond : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_4623_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_4623_ins : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_4623_k : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_4623_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_4623_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_602b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_602b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_50f7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_602b_cond : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_c18c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_c18c_ins : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_c18c_k : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_c18c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_c18c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_50f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_50f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_1c17_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_50f7_cond : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_4306_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_4306_ins : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_4306_k : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_4306_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_4306_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_1c17_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_1c17_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_af6f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_1c17_cond : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_beaf_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_beaf_ins : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_beaf_k : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_beaf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_beaf_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_af6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_af6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_2d03_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_af6f_cond : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_4cda_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_4cda_ins : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_4cda_k : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_4cda_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_4cda_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_2d03_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_2d03_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_6f40_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_2d03_cond : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_17ed_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_17ed_ins : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_17ed_k : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_17ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_17ed_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_6f40_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_6f40_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_4edb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_6f40_cond : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_3b66_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_3b66_ins : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_3b66_k : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_3b66_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_3b66_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_4edb_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_4edb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_fbdc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_4edb_cond : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_2d57_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_2d57_ins : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_2d57_k : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_2d57_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_2d57_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_fbdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_fbdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_5645_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_fbdc_cond : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_49c5_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_49c5_ins : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_49c5_k : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_49c5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_49c5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_5645_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_5645_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_6b41_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_5645_cond : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_8c1c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_8c1c_ins : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_8c1c_k : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_8c1c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_8c1c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_6b41_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_6b41_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_6b41_cond : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_8375_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_8375_ins : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_8375_k : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_8375_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_8375_return_output : unsigned(0 downto 0);
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_right := to_unsigned(45, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_right := to_unsigned(56, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_right := to_unsigned(29, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_right := to_unsigned(46, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_right := to_unsigned(252, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_right := to_unsigned(35, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_right := to_unsigned(26, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_right := to_unsigned(253, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_right := to_unsigned(21, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_right := to_unsigned(20, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_right := to_unsigned(48, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_right := to_unsigned(251, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_right := to_unsigned(254, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_right := to_unsigned(55, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_right := to_unsigned(39, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_right := to_unsigned(54, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_right := to_unsigned(43, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_right := to_unsigned(44, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_right := to_unsigned(47, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_right := to_unsigned(16, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_right := to_unsigned(50, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_right := to_unsigned(51, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_right := to_unsigned(23, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_right := to_unsigned(59, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_right := to_unsigned(9, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_right := to_unsigned(36, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_right := to_unsigned(52, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_right := to_unsigned(250, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_right := to_unsigned(40, 6);
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_6b41_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_right := to_unsigned(18, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_right := to_unsigned(58, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_right := to_unsigned(41, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_right := to_unsigned(37, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_right := to_unsigned(61, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_right := to_unsigned(30, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_right := to_unsigned(38, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_right := to_unsigned(24, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_right := to_unsigned(63, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_right := to_unsigned(62, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_right := to_unsigned(60, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_right := to_unsigned(57, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_right := to_unsigned(249, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_right := to_unsigned(42, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_right := to_unsigned(31, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_right := to_unsigned(53, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_iffalse := VAR_CLOCK_ENABLE;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_9d77_ins := VAR_ins;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_eb76_ins := VAR_ins;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_4cda_ins := VAR_ins;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_beaf_ins := VAR_ins;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e29e_ins := VAR_ins;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_1dff_ins := VAR_ins;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_f18b_ins := VAR_ins;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_444c_ins := VAR_ins;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_4306_ins := VAR_ins;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_c18c_ins := VAR_ins;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_ins := VAR_ins;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_27b0_ins := VAR_ins;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_49c5_ins := VAR_ins;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_2d57_ins := VAR_ins;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_242e_ins := VAR_ins;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_c3f0_ins := VAR_ins;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_721a_ins := VAR_ins;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_4552_ins := VAR_ins;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_ins := VAR_ins;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_edb1_ins := VAR_ins;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_ins := VAR_ins;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9630_ins := VAR_ins;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_761c_ins := VAR_ins;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_443c_ins := VAR_ins;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_5cad_ins := VAR_ins;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7497_ins := VAR_ins;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4563_ins := VAR_ins;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_34a3_ins := VAR_ins;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_cb7e_ins := VAR_ins;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_ins := VAR_ins;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_ins := VAR_ins;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_2675_ins := VAR_ins;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_ins := VAR_ins;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_25ab_ins := VAR_ins;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4136_ins := VAR_ins;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_0c05_ins := VAR_ins;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_db2c_ins := VAR_ins;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_76b0_ins := VAR_ins;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_13bf_ins := VAR_ins;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_4623_ins := VAR_ins;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_18b8_ins := VAR_ins;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_268c_ins := VAR_ins;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_986c_ins := VAR_ins;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_e112_ins := VAR_ins;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_f246_ins := VAR_ins;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_3b66_ins := VAR_ins;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_17ed_ins := VAR_ins;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_ins := VAR_ins;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8c15_ins := VAR_ins;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_196a_ins := VAR_ins;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_d627_ins := VAR_ins;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_3178_ins := VAR_ins;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_5b39_ins := VAR_ins;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_8375_ins := VAR_ins;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_8c1c_ins := VAR_ins;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c94e_ins := VAR_ins;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_f60b_ins := VAR_ins;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_84de_ins := VAR_ins;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_6964_ins := VAR_ins;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_0238_ins := VAR_ins;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_3bcb_ins := VAR_ins;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_ins := VAR_ins;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_6994_ins := VAR_ins;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0279_ins := VAR_ins;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_65ca_ins := VAR_ins;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_ins := VAR_ins;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_c5fd_ins := VAR_ins;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_9d77_k := VAR_k;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_eb76_k := VAR_k;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_4cda_k := VAR_k;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_beaf_k := VAR_k;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e29e_k := VAR_k;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_1dff_k := VAR_k;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_f18b_k := VAR_k;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_444c_k := VAR_k;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_4306_k := VAR_k;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_c18c_k := VAR_k;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_k := VAR_k;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_27b0_k := VAR_k;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_49c5_k := VAR_k;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_2d57_k := VAR_k;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_242e_k := VAR_k;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_c3f0_k := VAR_k;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_721a_k := VAR_k;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_4552_k := VAR_k;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_k := VAR_k;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_edb1_k := VAR_k;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_k := VAR_k;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9630_k := VAR_k;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_761c_k := VAR_k;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_443c_k := VAR_k;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7497_k := VAR_k;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4563_k := VAR_k;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_34a3_k := VAR_k;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_cb7e_k := VAR_k;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_k := VAR_k;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_k := VAR_k;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_2675_k := VAR_k;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_k := VAR_k;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_76b0_k := VAR_k;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_13bf_k := VAR_k;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_4623_k := VAR_k;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_18b8_k := VAR_k;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_268c_k := VAR_k;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_986c_k := VAR_k;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_e112_k := VAR_k;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_f246_k := VAR_k;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_3b66_k := VAR_k;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_17ed_k := VAR_k;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_k := VAR_k;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8c15_k := VAR_k;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_196a_k := VAR_k;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_d627_k := VAR_k;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_3178_k := VAR_k;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_5b39_k := VAR_k;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_8375_k := VAR_k;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_8c1c_k := VAR_k;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c94e_k := VAR_k;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_f60b_k := VAR_k;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_84de_k := VAR_k;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_6964_k := VAR_k;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_0238_k := VAR_k;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_3bcb_k := VAR_k;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_k := VAR_k;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_6994_k := VAR_k;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0279_k := VAR_k;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_65ca_k := VAR_k;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_k := VAR_k;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_c5fd_k := VAR_k;
     REG_VAR_l16 := l16;
     REG_VAR_l8 := l8;
     REG_VAR_n16 := n16;
     REG_VAR_n8 := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_left := VAR_opcode;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_9d77_stack_index := VAR_stack_index;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_eb76_stack_index := VAR_stack_index;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_4cda_stack_index := VAR_stack_index;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_beaf_stack_index := VAR_stack_index;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e29e_stack_index := VAR_stack_index;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_1dff_stack_index := VAR_stack_index;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_f18b_stack_index := VAR_stack_index;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_444c_stack_index := VAR_stack_index;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_4306_stack_index := VAR_stack_index;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_c18c_stack_index := VAR_stack_index;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_stack_index := VAR_stack_index;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_27b0_stack_index := VAR_stack_index;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_49c5_stack_index := VAR_stack_index;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_2d57_stack_index := VAR_stack_index;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_242e_stack_index := VAR_stack_index;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_c3f0_stack_index := VAR_stack_index;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_721a_stack_index := VAR_stack_index;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_4552_stack_index := VAR_stack_index;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_stack_index := VAR_stack_index;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_edb1_stack_index := VAR_stack_index;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_362a_stack_index := VAR_stack_index;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_stack_index := VAR_stack_index;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9630_stack_index := VAR_stack_index;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_761c_stack_index := VAR_stack_index;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_443c_stack_index := VAR_stack_index;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7497_stack_index := VAR_stack_index;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4563_stack_index := VAR_stack_index;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_34a3_stack_index := VAR_stack_index;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_cb7e_stack_index := VAR_stack_index;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_stack_index := VAR_stack_index;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_stack_index := VAR_stack_index;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_2675_stack_index := VAR_stack_index;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_stack_index := VAR_stack_index;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_25ab_stack_index := VAR_stack_index;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4136_stack_index := VAR_stack_index;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_0c05_stack_index := VAR_stack_index;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_db2c_stack_index := VAR_stack_index;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_76b0_stack_index := VAR_stack_index;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_13bf_stack_index := VAR_stack_index;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_4623_stack_index := VAR_stack_index;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_18b8_stack_index := VAR_stack_index;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_268c_stack_index := VAR_stack_index;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_986c_stack_index := VAR_stack_index;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_e112_stack_index := VAR_stack_index;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_f246_stack_index := VAR_stack_index;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_3b66_stack_index := VAR_stack_index;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_17ed_stack_index := VAR_stack_index;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_stack_index := VAR_stack_index;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8c15_stack_index := VAR_stack_index;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_196a_stack_index := VAR_stack_index;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_d627_stack_index := VAR_stack_index;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_3178_stack_index := VAR_stack_index;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_5b39_stack_index := VAR_stack_index;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_8375_stack_index := VAR_stack_index;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_8c1c_stack_index := VAR_stack_index;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c94e_stack_index := VAR_stack_index;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_f60b_stack_index := VAR_stack_index;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_84de_stack_index := VAR_stack_index;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_6964_stack_index := VAR_stack_index;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_0238_stack_index := VAR_stack_index;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_3bcb_stack_index := VAR_stack_index;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_stack_index := VAR_stack_index;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_6994_stack_index := VAR_stack_index;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0279_stack_index := VAR_stack_index;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_65ca_stack_index := VAR_stack_index;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_stack_index := VAR_stack_index;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_c5fd_stack_index := VAR_stack_index;
     REG_VAR_t16 := t16;
     REG_VAR_t8 := t8;
     REG_VAR_tmp16 := tmp16;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_3f69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_left;
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_return_output := BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_4959] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_d6e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_3926] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_left;
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_return_output := BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_307d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_3d73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_left;
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_return_output := BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_a018] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_left;
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_return_output := BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_8e75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_left;
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_return_output := BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_20bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_7899] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_left;
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_return_output := BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_a427] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_left;
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_return_output := BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_e599] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_left;
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_return_output := BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_0b75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_left;
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_return_output := BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_9a7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_c6f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_eea3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_e181] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_left;
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_return_output := BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_6594] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_cf90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_left;
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_return_output := BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_4464] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_left;
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_return_output := BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_77f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_1eb4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_586b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_1d72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_left;
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_return_output := BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_3943] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_left;
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_return_output := BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_71db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_left;
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_return_output := BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_84b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_49bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_7cef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_ca87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_left;
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_return_output := BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_cf9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_e171] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_left;
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_return_output := BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_8d6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_c3d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_c3ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_9da7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_52d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_6c9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_acad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_1984] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_left;
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_return_output := BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_1184] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_left;
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_return_output := BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_f86b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_bc2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_8b73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_left;
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_return_output := BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_05b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_f5ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_return_output;

     -- opc_brk[uxn_opcodes_h_l1000_c34_6db9] LATENCY=0
     -- Inputs
     -- Outputs
     VAR_opc_brk_uxn_opcodes_h_l1000_c34_6db9_return_output := opc_brk_uxn_opcodes_h_l1000_c34_6db9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_9e37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_left;
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_return_output := BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_13e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_d0fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_91e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_34a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_3a76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_left;
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_return_output := BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_0c75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_left;
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_return_output := BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_285f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_42dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_2438] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_left;
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_return_output := BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_0f04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_left;
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_return_output := BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_bbf2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_52e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_4ce9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_95ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_b9a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_073b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_7675] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_left;
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_return_output := BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_e1fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_67b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_472e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_8971] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_left;
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_return_output := BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_f0ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_264f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_7834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_d0fb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_5059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_9da7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_82d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_c3d3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_5b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_472e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_5e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_3f69_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_04b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_8e75_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_af65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_c3ec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_9f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_1184_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_526d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a427_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_a1a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_307d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_8bb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_acad_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_bd86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_586b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_b1e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_8b73_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_fde3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_3926_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_6c5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_a018_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_f040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7675_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_beeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_f5ef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_dfe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_42dc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_4769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_52d2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_c4ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_f0ef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_44ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_ca87_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_aab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_71db_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_e6ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_c6f5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_7adc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_4959_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_4346_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_1d72_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_d961_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_91e4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_d86d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_7cef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_8d6c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_8a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_0f04_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_b1a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_0b75_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_e28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_1984_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_0198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_d6e5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_12bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_9e37_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_ce7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_264f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_ad42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_4464_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_2367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_285f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_dbbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1eb4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_b6ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_05b8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_f181_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_95ae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_6d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d73_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_4cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_77f6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_c58b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_f86b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_6143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_e599_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_f3ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_13e9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_3d7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_073b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_bd42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_4ce9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_5974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_b9a7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_8724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_67b9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_cdaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_34a6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_2eac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_eea3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_4e7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_6594_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_54aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cf90_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_c253_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_e171_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_77f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_6c9b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_9d06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7899_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_8db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_84b5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_a24a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3a76_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_b54c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_8971_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_f141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_3943_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_c575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_bc2d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_602b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_0c75_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_50f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_e1fd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_1c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_e181_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_af6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_9a7c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_2d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_49bf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_6f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_52e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_4edb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_20bf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_fbdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_cf9e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_5645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_2438_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_6b41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_bbf2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_7834_iftrue := VAR_opc_brk_uxn_opcodes_h_l1000_c34_6db9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_5059] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_5059_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_5d53] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_82d3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_82d3_return_output;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_362a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_5d53_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_3f82] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_5b9e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_return_output;

     -- opc_jci[uxn_opcodes_h_l1001_c39_362a] LATENCY=0
     -- Clock enable
     opc_jci_uxn_opcodes_h_l1001_c39_362a_CLOCK_ENABLE <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_362a_CLOCK_ENABLE;
     -- Inputs
     opc_jci_uxn_opcodes_h_l1001_c39_362a_stack_index <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_362a_stack_index;
     -- Outputs
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_362a_return_output := opc_jci_uxn_opcodes_h_l1001_c39_362a_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_5b9e_return_output;
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_4f20_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_3f82_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_5059_iftrue := VAR_opc_jci_uxn_opcodes_h_l1001_c39_362a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_4939] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_return_output;

     -- opc_jmi[uxn_opcodes_h_l1002_c39_4f20] LATENCY=0
     -- Clock enable
     opc_jmi_uxn_opcodes_h_l1002_c39_4f20_CLOCK_ENABLE <= VAR_opc_jmi_uxn_opcodes_h_l1002_c39_4f20_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_4f20_return_output := opc_jmi_uxn_opcodes_h_l1002_c39_4f20_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_5e95] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_5e95_return_output;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_5cad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_4939_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_82d3_iftrue := VAR_opc_jmi_uxn_opcodes_h_l1002_c39_4f20_return_output;
     -- opc_jsi[uxn_opcodes_h_l1003_c39_5cad] LATENCY=0
     -- Clock enable
     opc_jsi_uxn_opcodes_h_l1003_c39_5cad_CLOCK_ENABLE <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_5cad_CLOCK_ENABLE;
     -- Inputs
     opc_jsi_uxn_opcodes_h_l1003_c39_5cad_ins <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_5cad_ins;
     -- Outputs
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_5cad_return_output := opc_jsi_uxn_opcodes_h_l1003_c39_5cad_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_45d1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_04b3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_04b3_return_output;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_0c05_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_45d1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_5b9e_iftrue := VAR_opc_jsi_uxn_opcodes_h_l1003_c39_5cad_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_e95d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_af65] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_return_output;

     -- opc_lit[uxn_opcodes_h_l1004_c39_0c05] LATENCY=0
     -- Clock enable
     opc_lit_uxn_opcodes_h_l1004_c39_0c05_CLOCK_ENABLE <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_0c05_CLOCK_ENABLE;
     -- Inputs
     opc_lit_uxn_opcodes_h_l1004_c39_0c05_stack_index <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_0c05_stack_index;
     opc_lit_uxn_opcodes_h_l1004_c39_0c05_ins <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_0c05_ins;
     -- Outputs
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_0c05_return_output := opc_lit_uxn_opcodes_h_l1004_c39_0c05_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_af65_return_output;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_25ab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_e95d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_5e95_iftrue := VAR_opc_lit_uxn_opcodes_h_l1004_c39_0c05_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_4a76] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_return_output;

     -- opc_lit2[uxn_opcodes_h_l1005_c39_25ab] LATENCY=0
     -- Clock enable
     opc_lit2_uxn_opcodes_h_l1005_c39_25ab_CLOCK_ENABLE <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_25ab_CLOCK_ENABLE;
     -- Inputs
     opc_lit2_uxn_opcodes_h_l1005_c39_25ab_stack_index <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_25ab_stack_index;
     opc_lit2_uxn_opcodes_h_l1005_c39_25ab_ins <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_25ab_ins;
     -- Outputs
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_25ab_return_output := opc_lit2_uxn_opcodes_h_l1005_c39_25ab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_9f80] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_9f80_return_output;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_db2c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_4a76_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_04b3_iftrue := VAR_opc_lit2_uxn_opcodes_h_l1005_c39_25ab_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_09ab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_return_output;

     -- opc_litr[uxn_opcodes_h_l1006_c39_db2c] LATENCY=0
     -- Clock enable
     opc_litr_uxn_opcodes_h_l1006_c39_db2c_CLOCK_ENABLE <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_db2c_CLOCK_ENABLE;
     -- Inputs
     opc_litr_uxn_opcodes_h_l1006_c39_db2c_stack_index <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_db2c_stack_index;
     opc_litr_uxn_opcodes_h_l1006_c39_db2c_ins <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_db2c_ins;
     -- Outputs
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_db2c_return_output := opc_litr_uxn_opcodes_h_l1006_c39_db2c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_526d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_526d_return_output;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4136_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_09ab_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_af65_iftrue := VAR_opc_litr_uxn_opcodes_h_l1006_c39_db2c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_a1a7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_9e3f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_return_output;

     -- opc_lit2r[uxn_opcodes_h_l1007_c39_4136] LATENCY=0
     -- Clock enable
     opc_lit2r_uxn_opcodes_h_l1007_c39_4136_CLOCK_ENABLE <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4136_CLOCK_ENABLE;
     -- Inputs
     opc_lit2r_uxn_opcodes_h_l1007_c39_4136_stack_index <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4136_stack_index;
     opc_lit2r_uxn_opcodes_h_l1007_c39_4136_ins <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4136_ins;
     -- Outputs
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4136_return_output := opc_lit2r_uxn_opcodes_h_l1007_c39_4136_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_a1a7_return_output;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_edb1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_9e3f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_9f80_iftrue := VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4136_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_3258] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_8bb9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_return_output;

     -- opc_inc[uxn_opcodes_h_l1008_c39_edb1] LATENCY=0
     -- Clock enable
     opc_inc_uxn_opcodes_h_l1008_c39_edb1_CLOCK_ENABLE <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_edb1_CLOCK_ENABLE;
     -- Inputs
     opc_inc_uxn_opcodes_h_l1008_c39_edb1_stack_index <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_edb1_stack_index;
     opc_inc_uxn_opcodes_h_l1008_c39_edb1_ins <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_edb1_ins;
     opc_inc_uxn_opcodes_h_l1008_c39_edb1_k <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_edb1_k;
     -- Outputs
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_edb1_return_output := opc_inc_uxn_opcodes_h_l1008_c39_edb1_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8bb9_return_output;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_3258_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_526d_iftrue := VAR_opc_inc_uxn_opcodes_h_l1008_c39_edb1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_bd86] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_return_output;

     -- opc_inc2[uxn_opcodes_h_l1009_c39_0cdf] LATENCY=0
     -- Clock enable
     opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_CLOCK_ENABLE <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_CLOCK_ENABLE;
     -- Inputs
     opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_stack_index <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_stack_index;
     opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_ins <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_ins;
     opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_k <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_k;
     -- Outputs
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_return_output := opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_aeda] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_bd86_return_output;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_d627_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_aeda_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_a1a7_iftrue := VAR_opc_inc2_uxn_opcodes_h_l1009_c39_0cdf_return_output;
     -- opc_pop[uxn_opcodes_h_l1010_c39_d627] LATENCY=0
     -- Clock enable
     opc_pop_uxn_opcodes_h_l1010_c39_d627_CLOCK_ENABLE <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_d627_CLOCK_ENABLE;
     -- Inputs
     opc_pop_uxn_opcodes_h_l1010_c39_d627_stack_index <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_d627_stack_index;
     opc_pop_uxn_opcodes_h_l1010_c39_d627_ins <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_d627_ins;
     opc_pop_uxn_opcodes_h_l1010_c39_d627_k <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_d627_k;
     -- Outputs
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_d627_return_output := opc_pop_uxn_opcodes_h_l1010_c39_d627_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_b1e0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_1175] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_b1e0_return_output;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_196a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_1175_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_8bb9_iftrue := VAR_opc_pop_uxn_opcodes_h_l1010_c39_d627_return_output;
     -- opc_pop2[uxn_opcodes_h_l1011_c39_196a] LATENCY=0
     -- Clock enable
     opc_pop2_uxn_opcodes_h_l1011_c39_196a_CLOCK_ENABLE <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_196a_CLOCK_ENABLE;
     -- Inputs
     opc_pop2_uxn_opcodes_h_l1011_c39_196a_stack_index <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_196a_stack_index;
     opc_pop2_uxn_opcodes_h_l1011_c39_196a_ins <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_196a_ins;
     opc_pop2_uxn_opcodes_h_l1011_c39_196a_k <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_196a_k;
     -- Outputs
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_196a_return_output := opc_pop2_uxn_opcodes_h_l1011_c39_196a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_fde3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_ae00] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_fde3_return_output;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_f246_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_ae00_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_bd86_iftrue := VAR_opc_pop2_uxn_opcodes_h_l1011_c39_196a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_72d7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_6c5b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_return_output;

     -- opc_nip[uxn_opcodes_h_l1012_c39_f246] LATENCY=0
     -- Clock enable
     opc_nip_uxn_opcodes_h_l1012_c39_f246_CLOCK_ENABLE <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_f246_CLOCK_ENABLE;
     -- Inputs
     opc_nip_uxn_opcodes_h_l1012_c39_f246_stack_index <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_f246_stack_index;
     opc_nip_uxn_opcodes_h_l1012_c39_f246_ins <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_f246_ins;
     opc_nip_uxn_opcodes_h_l1012_c39_f246_k <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_f246_k;
     -- Outputs
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_f246_return_output := opc_nip_uxn_opcodes_h_l1012_c39_f246_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_6c5b_return_output;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_e112_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_72d7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_b1e0_iftrue := VAR_opc_nip_uxn_opcodes_h_l1012_c39_f246_return_output;
     -- opc_nip2[uxn_opcodes_h_l1013_c39_e112] LATENCY=0
     -- Clock enable
     opc_nip2_uxn_opcodes_h_l1013_c39_e112_CLOCK_ENABLE <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_e112_CLOCK_ENABLE;
     -- Inputs
     opc_nip2_uxn_opcodes_h_l1013_c39_e112_stack_index <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_e112_stack_index;
     opc_nip2_uxn_opcodes_h_l1013_c39_e112_ins <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_e112_ins;
     opc_nip2_uxn_opcodes_h_l1013_c39_e112_k <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_e112_k;
     -- Outputs
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_e112_return_output := opc_nip2_uxn_opcodes_h_l1013_c39_e112_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_f040] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_49ec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_f040_return_output;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_c5fd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_49ec_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_fde3_iftrue := VAR_opc_nip2_uxn_opcodes_h_l1013_c39_e112_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_beeb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_return_output;

     -- opc_swp[uxn_opcodes_h_l1014_c39_c5fd] LATENCY=0
     -- Clock enable
     opc_swp_uxn_opcodes_h_l1014_c39_c5fd_CLOCK_ENABLE <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_c5fd_CLOCK_ENABLE;
     -- Inputs
     opc_swp_uxn_opcodes_h_l1014_c39_c5fd_stack_index <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_c5fd_stack_index;
     opc_swp_uxn_opcodes_h_l1014_c39_c5fd_ins <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_c5fd_ins;
     opc_swp_uxn_opcodes_h_l1014_c39_c5fd_k <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_c5fd_k;
     -- Outputs
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_c5fd_return_output := opc_swp_uxn_opcodes_h_l1014_c39_c5fd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_01fc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_beeb_return_output;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_01fc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_6c5b_iftrue := VAR_opc_swp_uxn_opcodes_h_l1014_c39_c5fd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_a899] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_dfe5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_return_output;

     -- opc_swp2[uxn_opcodes_h_l1015_c39_e1ac] LATENCY=0
     -- Clock enable
     opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_CLOCK_ENABLE <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_CLOCK_ENABLE;
     -- Inputs
     opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_stack_index <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_stack_index;
     opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_ins <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_ins;
     opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_k <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_k;
     -- Outputs
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_return_output := opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_dfe5_return_output;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_5b39_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_a899_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_f040_iftrue := VAR_opc_swp2_uxn_opcodes_h_l1015_c39_e1ac_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_4dd6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_return_output;

     -- opc_rot[uxn_opcodes_h_l1016_c39_5b39] LATENCY=0
     -- Clock enable
     opc_rot_uxn_opcodes_h_l1016_c39_5b39_CLOCK_ENABLE <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_5b39_CLOCK_ENABLE;
     -- Inputs
     opc_rot_uxn_opcodes_h_l1016_c39_5b39_stack_index <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_5b39_stack_index;
     opc_rot_uxn_opcodes_h_l1016_c39_5b39_ins <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_5b39_ins;
     opc_rot_uxn_opcodes_h_l1016_c39_5b39_k <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_5b39_k;
     -- Outputs
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_5b39_return_output := opc_rot_uxn_opcodes_h_l1016_c39_5b39_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_4769] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_4769_return_output;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_3178_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_4dd6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_beeb_iftrue := VAR_opc_rot_uxn_opcodes_h_l1016_c39_5b39_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_2745] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_return_output;

     -- opc_rot2[uxn_opcodes_h_l1017_c39_3178] LATENCY=0
     -- Clock enable
     opc_rot2_uxn_opcodes_h_l1017_c39_3178_CLOCK_ENABLE <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_3178_CLOCK_ENABLE;
     -- Inputs
     opc_rot2_uxn_opcodes_h_l1017_c39_3178_stack_index <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_3178_stack_index;
     opc_rot2_uxn_opcodes_h_l1017_c39_3178_ins <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_3178_ins;
     opc_rot2_uxn_opcodes_h_l1017_c39_3178_k <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_3178_k;
     -- Outputs
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_3178_return_output := opc_rot2_uxn_opcodes_h_l1017_c39_3178_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_c4ef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_c4ef_return_output;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_27b0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_2745_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_dfe5_iftrue := VAR_opc_rot2_uxn_opcodes_h_l1017_c39_3178_return_output;
     -- opc_dup[uxn_opcodes_h_l1018_c39_27b0] LATENCY=0
     -- Clock enable
     opc_dup_uxn_opcodes_h_l1018_c39_27b0_CLOCK_ENABLE <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_27b0_CLOCK_ENABLE;
     -- Inputs
     opc_dup_uxn_opcodes_h_l1018_c39_27b0_stack_index <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_27b0_stack_index;
     opc_dup_uxn_opcodes_h_l1018_c39_27b0_ins <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_27b0_ins;
     opc_dup_uxn_opcodes_h_l1018_c39_27b0_k <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_27b0_k;
     -- Outputs
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_27b0_return_output := opc_dup_uxn_opcodes_h_l1018_c39_27b0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_8564] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_44ea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_44ea_return_output;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_8564_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_4769_iftrue := VAR_opc_dup_uxn_opcodes_h_l1018_c39_27b0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_aab0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_return_output;

     -- opc_dup2[uxn_opcodes_h_l1019_c39_4f8c] LATENCY=0
     -- Clock enable
     opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_CLOCK_ENABLE <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_CLOCK_ENABLE;
     -- Inputs
     opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_stack_index <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_stack_index;
     opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_ins <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_ins;
     opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_k <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_k;
     -- Outputs
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_return_output := opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_b57c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_aab0_return_output;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8c15_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_b57c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_c4ef_iftrue := VAR_opc_dup2_uxn_opcodes_h_l1019_c39_4f8c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_67f0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_e6ee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_return_output;

     -- opc_ovr[uxn_opcodes_h_l1020_c39_8c15] LATENCY=0
     -- Clock enable
     opc_ovr_uxn_opcodes_h_l1020_c39_8c15_CLOCK_ENABLE <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8c15_CLOCK_ENABLE;
     -- Inputs
     opc_ovr_uxn_opcodes_h_l1020_c39_8c15_stack_index <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8c15_stack_index;
     opc_ovr_uxn_opcodes_h_l1020_c39_8c15_ins <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8c15_ins;
     opc_ovr_uxn_opcodes_h_l1020_c39_8c15_k <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8c15_k;
     -- Outputs
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8c15_return_output := opc_ovr_uxn_opcodes_h_l1020_c39_8c15_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_e6ee_return_output;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_67f0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_44ea_iftrue := VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8c15_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_7adc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_return_output;

     -- opc_ovr2[uxn_opcodes_h_l1021_c39_b5c3] LATENCY=0
     -- Clock enable
     opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_CLOCK_ENABLE <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_CLOCK_ENABLE;
     -- Inputs
     opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_stack_index <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_stack_index;
     opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_ins <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_ins;
     opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_k <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_k;
     -- Outputs
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_return_output := opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_7117] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_7adc_return_output;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_c3f0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_7117_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_aab0_iftrue := VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_b5c3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_534f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_4346] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_return_output;

     -- opc_equ[uxn_opcodes_h_l1022_c39_c3f0] LATENCY=0
     -- Clock enable
     opc_equ_uxn_opcodes_h_l1022_c39_c3f0_CLOCK_ENABLE <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_c3f0_CLOCK_ENABLE;
     -- Inputs
     opc_equ_uxn_opcodes_h_l1022_c39_c3f0_stack_index <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_c3f0_stack_index;
     opc_equ_uxn_opcodes_h_l1022_c39_c3f0_ins <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_c3f0_ins;
     opc_equ_uxn_opcodes_h_l1022_c39_c3f0_k <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_c3f0_k;
     -- Outputs
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_c3f0_return_output := opc_equ_uxn_opcodes_h_l1022_c39_c3f0_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_4346_return_output;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_242e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_534f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_e6ee_iftrue := VAR_opc_equ_uxn_opcodes_h_l1022_c39_c3f0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_d961] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_return_output;

     -- opc_equ2[uxn_opcodes_h_l1023_c39_242e] LATENCY=0
     -- Clock enable
     opc_equ2_uxn_opcodes_h_l1023_c39_242e_CLOCK_ENABLE <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_242e_CLOCK_ENABLE;
     -- Inputs
     opc_equ2_uxn_opcodes_h_l1023_c39_242e_stack_index <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_242e_stack_index;
     opc_equ2_uxn_opcodes_h_l1023_c39_242e_ins <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_242e_ins;
     opc_equ2_uxn_opcodes_h_l1023_c39_242e_k <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_242e_k;
     -- Outputs
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_242e_return_output := opc_equ2_uxn_opcodes_h_l1023_c39_242e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_9ea8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_d961_return_output;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_986c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_9ea8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_7adc_iftrue := VAR_opc_equ2_uxn_opcodes_h_l1023_c39_242e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_d86d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_return_output;

     -- opc_neq[uxn_opcodes_h_l1024_c39_986c] LATENCY=0
     -- Clock enable
     opc_neq_uxn_opcodes_h_l1024_c39_986c_CLOCK_ENABLE <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_986c_CLOCK_ENABLE;
     -- Inputs
     opc_neq_uxn_opcodes_h_l1024_c39_986c_stack_index <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_986c_stack_index;
     opc_neq_uxn_opcodes_h_l1024_c39_986c_ins <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_986c_ins;
     opc_neq_uxn_opcodes_h_l1024_c39_986c_k <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_986c_k;
     -- Outputs
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_986c_return_output := opc_neq_uxn_opcodes_h_l1024_c39_986c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_ef4b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_d86d_return_output;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_268c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_ef4b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_4346_iftrue := VAR_opc_neq_uxn_opcodes_h_l1024_c39_986c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_9a9f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_return_output;

     -- opc_neq2[uxn_opcodes_h_l1025_c39_268c] LATENCY=0
     -- Clock enable
     opc_neq2_uxn_opcodes_h_l1025_c39_268c_CLOCK_ENABLE <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_268c_CLOCK_ENABLE;
     -- Inputs
     opc_neq2_uxn_opcodes_h_l1025_c39_268c_stack_index <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_268c_stack_index;
     opc_neq2_uxn_opcodes_h_l1025_c39_268c_ins <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_268c_ins;
     opc_neq2_uxn_opcodes_h_l1025_c39_268c_k <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_268c_k;
     -- Outputs
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_268c_return_output := opc_neq2_uxn_opcodes_h_l1025_c39_268c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_ad20] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_9a9f_return_output;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_4552_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad20_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_d961_iftrue := VAR_opc_neq2_uxn_opcodes_h_l1025_c39_268c_return_output;
     -- opc_gth[uxn_opcodes_h_l1026_c39_4552] LATENCY=0
     -- Clock enable
     opc_gth_uxn_opcodes_h_l1026_c39_4552_CLOCK_ENABLE <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_4552_CLOCK_ENABLE;
     -- Inputs
     opc_gth_uxn_opcodes_h_l1026_c39_4552_stack_index <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_4552_stack_index;
     opc_gth_uxn_opcodes_h_l1026_c39_4552_ins <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_4552_ins;
     opc_gth_uxn_opcodes_h_l1026_c39_4552_k <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_4552_k;
     -- Outputs
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_4552_return_output := opc_gth_uxn_opcodes_h_l1026_c39_4552_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_9e75] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_8a4b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_8a4b_return_output;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_721a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_9e75_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_d86d_iftrue := VAR_opc_gth_uxn_opcodes_h_l1026_c39_4552_return_output;
     -- opc_gth2[uxn_opcodes_h_l1027_c39_721a] LATENCY=0
     -- Clock enable
     opc_gth2_uxn_opcodes_h_l1027_c39_721a_CLOCK_ENABLE <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_721a_CLOCK_ENABLE;
     -- Inputs
     opc_gth2_uxn_opcodes_h_l1027_c39_721a_stack_index <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_721a_stack_index;
     opc_gth2_uxn_opcodes_h_l1027_c39_721a_ins <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_721a_ins;
     opc_gth2_uxn_opcodes_h_l1027_c39_721a_k <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_721a_k;
     -- Outputs
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_721a_return_output := opc_gth2_uxn_opcodes_h_l1027_c39_721a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_7b43] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_b1a2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_b1a2_return_output;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_13bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7b43_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a9f_iftrue := VAR_opc_gth2_uxn_opcodes_h_l1027_c39_721a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_e28b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_f6e9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_return_output;

     -- opc_lth[uxn_opcodes_h_l1028_c39_13bf] LATENCY=0
     -- Clock enable
     opc_lth_uxn_opcodes_h_l1028_c39_13bf_CLOCK_ENABLE <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_13bf_CLOCK_ENABLE;
     -- Inputs
     opc_lth_uxn_opcodes_h_l1028_c39_13bf_stack_index <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_13bf_stack_index;
     opc_lth_uxn_opcodes_h_l1028_c39_13bf_ins <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_13bf_ins;
     opc_lth_uxn_opcodes_h_l1028_c39_13bf_k <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_13bf_k;
     -- Outputs
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_13bf_return_output := opc_lth_uxn_opcodes_h_l1028_c39_13bf_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_e28b_return_output;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_76b0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_f6e9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_8a4b_iftrue := VAR_opc_lth_uxn_opcodes_h_l1028_c39_13bf_return_output;
     -- opc_lth2[uxn_opcodes_h_l1029_c39_76b0] LATENCY=0
     -- Clock enable
     opc_lth2_uxn_opcodes_h_l1029_c39_76b0_CLOCK_ENABLE <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_76b0_CLOCK_ENABLE;
     -- Inputs
     opc_lth2_uxn_opcodes_h_l1029_c39_76b0_stack_index <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_76b0_stack_index;
     opc_lth2_uxn_opcodes_h_l1029_c39_76b0_ins <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_76b0_ins;
     opc_lth2_uxn_opcodes_h_l1029_c39_76b0_k <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_76b0_k;
     -- Outputs
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_76b0_return_output := opc_lth2_uxn_opcodes_h_l1029_c39_76b0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_0198] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_9c1c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_0198_return_output;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_443c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_9c1c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_b1a2_iftrue := VAR_opc_lth2_uxn_opcodes_h_l1029_c39_76b0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_12bf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_return_output;

     -- opc_jmp[uxn_opcodes_h_l1030_c39_443c] LATENCY=0
     -- Clock enable
     opc_jmp_uxn_opcodes_h_l1030_c39_443c_CLOCK_ENABLE <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_443c_CLOCK_ENABLE;
     -- Inputs
     opc_jmp_uxn_opcodes_h_l1030_c39_443c_stack_index <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_443c_stack_index;
     opc_jmp_uxn_opcodes_h_l1030_c39_443c_ins <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_443c_ins;
     opc_jmp_uxn_opcodes_h_l1030_c39_443c_k <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_443c_k;
     -- Outputs
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_443c_return_output := opc_jmp_uxn_opcodes_h_l1030_c39_443c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_3038] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_12bf_return_output;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_761c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_3038_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_e28b_iftrue := VAR_opc_jmp_uxn_opcodes_h_l1030_c39_443c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_ce7a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_return_output;

     -- opc_jmp2[uxn_opcodes_h_l1031_c39_761c] LATENCY=0
     -- Clock enable
     opc_jmp2_uxn_opcodes_h_l1031_c39_761c_CLOCK_ENABLE <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_761c_CLOCK_ENABLE;
     -- Inputs
     opc_jmp2_uxn_opcodes_h_l1031_c39_761c_stack_index <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_761c_stack_index;
     opc_jmp2_uxn_opcodes_h_l1031_c39_761c_ins <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_761c_ins;
     opc_jmp2_uxn_opcodes_h_l1031_c39_761c_k <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_761c_k;
     -- Outputs
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_761c_return_output := opc_jmp2_uxn_opcodes_h_l1031_c39_761c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_90ee] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_ce7a_return_output;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9630_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_90ee_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_0198_iftrue := VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_761c_return_output;
     -- opc_jcn[uxn_opcodes_h_l1032_c39_9630] LATENCY=0
     -- Clock enable
     opc_jcn_uxn_opcodes_h_l1032_c39_9630_CLOCK_ENABLE <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9630_CLOCK_ENABLE;
     -- Inputs
     opc_jcn_uxn_opcodes_h_l1032_c39_9630_stack_index <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9630_stack_index;
     opc_jcn_uxn_opcodes_h_l1032_c39_9630_ins <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9630_ins;
     opc_jcn_uxn_opcodes_h_l1032_c39_9630_k <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9630_k;
     -- Outputs
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9630_return_output := opc_jcn_uxn_opcodes_h_l1032_c39_9630_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_ad42] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_5a17] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_ad42_return_output;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_5a17_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_12bf_iftrue := VAR_opc_jcn_uxn_opcodes_h_l1032_c39_9630_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_2367] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_return_output;

     -- opc_jcn2[uxn_opcodes_h_l1033_c39_4ead] LATENCY=0
     -- Clock enable
     opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_CLOCK_ENABLE <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_CLOCK_ENABLE;
     -- Inputs
     opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_stack_index <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_stack_index;
     opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_ins <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_ins;
     opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_k <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_k;
     -- Outputs
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_return_output := opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_85e1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2367_return_output;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4563_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_85e1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_ce7a_iftrue := VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4ead_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_13bd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_return_output;

     -- opc_jsr[uxn_opcodes_h_l1034_c39_4563] LATENCY=0
     -- Clock enable
     opc_jsr_uxn_opcodes_h_l1034_c39_4563_CLOCK_ENABLE <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4563_CLOCK_ENABLE;
     -- Inputs
     opc_jsr_uxn_opcodes_h_l1034_c39_4563_stack_index <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4563_stack_index;
     opc_jsr_uxn_opcodes_h_l1034_c39_4563_ins <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4563_ins;
     opc_jsr_uxn_opcodes_h_l1034_c39_4563_k <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4563_k;
     -- Outputs
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4563_return_output := opc_jsr_uxn_opcodes_h_l1034_c39_4563_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_dbbe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_dbbe_return_output;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7497_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_13bd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_ad42_iftrue := VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4563_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_f19e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_return_output;

     -- opc_jsr2[uxn_opcodes_h_l1035_c39_7497] LATENCY=0
     -- Clock enable
     opc_jsr2_uxn_opcodes_h_l1035_c39_7497_CLOCK_ENABLE <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7497_CLOCK_ENABLE;
     -- Inputs
     opc_jsr2_uxn_opcodes_h_l1035_c39_7497_stack_index <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7497_stack_index;
     opc_jsr2_uxn_opcodes_h_l1035_c39_7497_ins <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7497_ins;
     opc_jsr2_uxn_opcodes_h_l1035_c39_7497_k <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7497_k;
     -- Outputs
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7497_return_output := opc_jsr2_uxn_opcodes_h_l1035_c39_7497_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_b6ac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_b6ac_return_output;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_6964_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_f19e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_2367_iftrue := VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_7497_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_f181] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_4072] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_return_output;

     -- opc_sth[uxn_opcodes_h_l1036_c39_6964] LATENCY=0
     -- Clock enable
     opc_sth_uxn_opcodes_h_l1036_c39_6964_CLOCK_ENABLE <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_6964_CLOCK_ENABLE;
     -- Inputs
     opc_sth_uxn_opcodes_h_l1036_c39_6964_stack_index <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_6964_stack_index;
     opc_sth_uxn_opcodes_h_l1036_c39_6964_ins <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_6964_ins;
     opc_sth_uxn_opcodes_h_l1036_c39_6964_k <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_6964_k;
     -- Outputs
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_6964_return_output := opc_sth_uxn_opcodes_h_l1036_c39_6964_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_f181_return_output;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_84de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4072_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_dbbe_iftrue := VAR_opc_sth_uxn_opcodes_h_l1036_c39_6964_return_output;
     -- opc_sth2[uxn_opcodes_h_l1037_c39_84de] LATENCY=0
     -- Clock enable
     opc_sth2_uxn_opcodes_h_l1037_c39_84de_CLOCK_ENABLE <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_84de_CLOCK_ENABLE;
     -- Inputs
     opc_sth2_uxn_opcodes_h_l1037_c39_84de_stack_index <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_84de_stack_index;
     opc_sth2_uxn_opcodes_h_l1037_c39_84de_ins <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_84de_ins;
     opc_sth2_uxn_opcodes_h_l1037_c39_84de_k <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_84de_k;
     -- Outputs
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_84de_return_output := opc_sth2_uxn_opcodes_h_l1037_c39_84de_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_6d74] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_7f5b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_6d74_return_output;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7f5b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_b6ac_iftrue := VAR_opc_sth2_uxn_opcodes_h_l1037_c39_84de_return_output;
     -- opc_ldz[uxn_opcodes_h_l1038_c39_0dfb] LATENCY=0
     -- Clock enable
     opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_CLOCK_ENABLE <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_CLOCK_ENABLE;
     -- Inputs
     opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_stack_index <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_stack_index;
     opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_ins <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_ins;
     opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_k <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_k;
     -- Outputs
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_return_output := opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_4cdb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_327d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_4cdb_return_output;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_2675_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_327d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_f181_iftrue := VAR_opc_ldz_uxn_opcodes_h_l1038_c39_0dfb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_03a4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_c58b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_return_output;

     -- opc_ldz2[uxn_opcodes_h_l1039_c39_2675] LATENCY=0
     -- Clock enable
     opc_ldz2_uxn_opcodes_h_l1039_c39_2675_CLOCK_ENABLE <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_2675_CLOCK_ENABLE;
     -- Inputs
     opc_ldz2_uxn_opcodes_h_l1039_c39_2675_stack_index <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_2675_stack_index;
     opc_ldz2_uxn_opcodes_h_l1039_c39_2675_ins <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_2675_ins;
     opc_ldz2_uxn_opcodes_h_l1039_c39_2675_k <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_2675_k;
     -- Outputs
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_2675_return_output := opc_ldz2_uxn_opcodes_h_l1039_c39_2675_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_c58b_return_output;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_6994_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_03a4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_6d74_iftrue := VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_2675_return_output;
     -- opc_stz[uxn_opcodes_h_l1040_c39_6994] LATENCY=0
     -- Clock enable
     opc_stz_uxn_opcodes_h_l1040_c39_6994_CLOCK_ENABLE <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_6994_CLOCK_ENABLE;
     -- Inputs
     opc_stz_uxn_opcodes_h_l1040_c39_6994_stack_index <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_6994_stack_index;
     opc_stz_uxn_opcodes_h_l1040_c39_6994_ins <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_6994_ins;
     opc_stz_uxn_opcodes_h_l1040_c39_6994_k <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_6994_k;
     -- Outputs
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_6994_return_output := opc_stz_uxn_opcodes_h_l1040_c39_6994_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_6143] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_65a3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_6143_return_output;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65a3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_4cdb_iftrue := VAR_opc_stz_uxn_opcodes_h_l1040_c39_6994_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_f3ce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_return_output;

     -- opc_stz2[uxn_opcodes_h_l1041_c39_2a8e] LATENCY=0
     -- Clock enable
     opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_CLOCK_ENABLE <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_CLOCK_ENABLE;
     -- Inputs
     opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_stack_index <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_stack_index;
     opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_ins <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_ins;
     opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_k <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_k;
     -- Outputs
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_return_output := opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_61a7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_f3ce_return_output;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_61a7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_c58b_iftrue := VAR_opc_stz2_uxn_opcodes_h_l1041_c39_2a8e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_3d7a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_b066] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_return_output;

     -- opc_ldr[uxn_opcodes_h_l1042_c39_c7ea] LATENCY=0
     -- Clock enable
     opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_CLOCK_ENABLE <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_CLOCK_ENABLE;
     -- Inputs
     opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_stack_index <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_stack_index;
     opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_ins <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_ins;
     opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_k <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_k;
     -- Outputs
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_return_output := opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_3d7a_return_output;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_b066_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_6143_iftrue := VAR_opc_ldr_uxn_opcodes_h_l1042_c39_c7ea_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_bd42] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_return_output;

     -- opc_ldr2[uxn_opcodes_h_l1043_c39_a25d] LATENCY=0
     -- Clock enable
     opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_CLOCK_ENABLE <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_CLOCK_ENABLE;
     -- Inputs
     opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_stack_index <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_stack_index;
     opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_ins <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_ins;
     opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_k <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_k;
     -- Outputs
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_return_output := opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_7e27] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_bd42_return_output;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_3bcb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_7e27_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_f3ce_iftrue := VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a25d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_5974] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_return_output;

     -- opc_str[uxn_opcodes_h_l1044_c39_3bcb] LATENCY=0
     -- Clock enable
     opc_str_uxn_opcodes_h_l1044_c39_3bcb_CLOCK_ENABLE <= VAR_opc_str_uxn_opcodes_h_l1044_c39_3bcb_CLOCK_ENABLE;
     -- Inputs
     opc_str_uxn_opcodes_h_l1044_c39_3bcb_stack_index <= VAR_opc_str_uxn_opcodes_h_l1044_c39_3bcb_stack_index;
     opc_str_uxn_opcodes_h_l1044_c39_3bcb_ins <= VAR_opc_str_uxn_opcodes_h_l1044_c39_3bcb_ins;
     opc_str_uxn_opcodes_h_l1044_c39_3bcb_k <= VAR_opc_str_uxn_opcodes_h_l1044_c39_3bcb_k;
     -- Outputs
     VAR_opc_str_uxn_opcodes_h_l1044_c39_3bcb_return_output := opc_str_uxn_opcodes_h_l1044_c39_3bcb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_09dd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_5974_return_output;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_0238_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_09dd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_3d7a_iftrue := VAR_opc_str_uxn_opcodes_h_l1044_c39_3bcb_return_output;
     -- opc_str2[uxn_opcodes_h_l1045_c39_0238] LATENCY=0
     -- Clock enable
     opc_str2_uxn_opcodes_h_l1045_c39_0238_CLOCK_ENABLE <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_0238_CLOCK_ENABLE;
     -- Inputs
     opc_str2_uxn_opcodes_h_l1045_c39_0238_stack_index <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_0238_stack_index;
     opc_str2_uxn_opcodes_h_l1045_c39_0238_ins <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_0238_ins;
     opc_str2_uxn_opcodes_h_l1045_c39_0238_k <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_0238_k;
     -- Outputs
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_0238_return_output := opc_str2_uxn_opcodes_h_l1045_c39_0238_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_31c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_8724] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_8724_return_output;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_cb7e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_31c8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_bd42_iftrue := VAR_opc_str2_uxn_opcodes_h_l1045_c39_0238_return_output;
     -- opc_lda[uxn_opcodes_h_l1046_c39_cb7e] LATENCY=0
     -- Clock enable
     opc_lda_uxn_opcodes_h_l1046_c39_cb7e_CLOCK_ENABLE <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_cb7e_CLOCK_ENABLE;
     -- Inputs
     opc_lda_uxn_opcodes_h_l1046_c39_cb7e_stack_index <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_cb7e_stack_index;
     opc_lda_uxn_opcodes_h_l1046_c39_cb7e_ins <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_cb7e_ins;
     opc_lda_uxn_opcodes_h_l1046_c39_cb7e_k <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_cb7e_k;
     -- Outputs
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_cb7e_return_output := opc_lda_uxn_opcodes_h_l1046_c39_cb7e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_cdaa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_a29d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_cdaa_return_output;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_34a3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_a29d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_5974_iftrue := VAR_opc_lda_uxn_opcodes_h_l1046_c39_cb7e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_08ed] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_2eac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_return_output;

     -- opc_lda2[uxn_opcodes_h_l1047_c39_34a3] LATENCY=0
     -- Clock enable
     opc_lda2_uxn_opcodes_h_l1047_c39_34a3_CLOCK_ENABLE <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_34a3_CLOCK_ENABLE;
     -- Inputs
     opc_lda2_uxn_opcodes_h_l1047_c39_34a3_stack_index <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_34a3_stack_index;
     opc_lda2_uxn_opcodes_h_l1047_c39_34a3_ins <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_34a3_ins;
     opc_lda2_uxn_opcodes_h_l1047_c39_34a3_k <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_34a3_k;
     -- Outputs
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_34a3_return_output := opc_lda2_uxn_opcodes_h_l1047_c39_34a3_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_2eac_return_output;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_f60b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_08ed_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_8724_iftrue := VAR_opc_lda2_uxn_opcodes_h_l1047_c39_34a3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_4e7f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_return_output;

     -- opc_sta[uxn_opcodes_h_l1048_c39_f60b] LATENCY=0
     -- Clock enable
     opc_sta_uxn_opcodes_h_l1048_c39_f60b_CLOCK_ENABLE <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_f60b_CLOCK_ENABLE;
     -- Inputs
     opc_sta_uxn_opcodes_h_l1048_c39_f60b_stack_index <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_f60b_stack_index;
     opc_sta_uxn_opcodes_h_l1048_c39_f60b_ins <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_f60b_ins;
     opc_sta_uxn_opcodes_h_l1048_c39_f60b_k <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_f60b_k;
     -- Outputs
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_f60b_return_output := opc_sta_uxn_opcodes_h_l1048_c39_f60b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_c858] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_4e7f_return_output;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c94e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_c858_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_cdaa_iftrue := VAR_opc_sta_uxn_opcodes_h_l1048_c39_f60b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_54aa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_1bc2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_return_output;

     -- opc_sta2[uxn_opcodes_h_l1049_c39_c94e] LATENCY=0
     -- Clock enable
     opc_sta2_uxn_opcodes_h_l1049_c39_c94e_CLOCK_ENABLE <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c94e_CLOCK_ENABLE;
     -- Inputs
     opc_sta2_uxn_opcodes_h_l1049_c39_c94e_stack_index <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c94e_stack_index;
     opc_sta2_uxn_opcodes_h_l1049_c39_c94e_ins <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c94e_ins;
     opc_sta2_uxn_opcodes_h_l1049_c39_c94e_k <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c94e_k;
     -- Outputs
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c94e_return_output := opc_sta2_uxn_opcodes_h_l1049_c39_c94e_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_54aa_return_output;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_1dff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_1bc2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_2eac_iftrue := VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c94e_return_output;
     -- opc_dei[uxn_opcodes_h_l1050_c39_1dff] LATENCY=0
     -- Clock enable
     opc_dei_uxn_opcodes_h_l1050_c39_1dff_CLOCK_ENABLE <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_1dff_CLOCK_ENABLE;
     -- Inputs
     opc_dei_uxn_opcodes_h_l1050_c39_1dff_stack_index <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_1dff_stack_index;
     opc_dei_uxn_opcodes_h_l1050_c39_1dff_ins <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_1dff_ins;
     opc_dei_uxn_opcodes_h_l1050_c39_1dff_k <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_1dff_k;
     -- Outputs
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_1dff_return_output := opc_dei_uxn_opcodes_h_l1050_c39_1dff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_567e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_c253] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_c253_return_output;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e29e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_567e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_4e7f_iftrue := VAR_opc_dei_uxn_opcodes_h_l1050_c39_1dff_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_9b93] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_77f8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_return_output;

     -- opc_dei2[uxn_opcodes_h_l1051_c39_e29e] LATENCY=0
     -- Clock enable
     opc_dei2_uxn_opcodes_h_l1051_c39_e29e_CLOCK_ENABLE <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e29e_CLOCK_ENABLE;
     -- Inputs
     opc_dei2_uxn_opcodes_h_l1051_c39_e29e_stack_index <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e29e_stack_index;
     opc_dei2_uxn_opcodes_h_l1051_c39_e29e_ins <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e29e_ins;
     opc_dei2_uxn_opcodes_h_l1051_c39_e29e_k <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e29e_k;
     -- Outputs
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e29e_return_output := opc_dei2_uxn_opcodes_h_l1051_c39_e29e_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_77f8_return_output;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_444c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_9b93_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_54aa_iftrue := VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e29e_return_output;
     -- opc_deo[uxn_opcodes_h_l1052_c39_444c] LATENCY=0
     -- Clock enable
     opc_deo_uxn_opcodes_h_l1052_c39_444c_CLOCK_ENABLE <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_444c_CLOCK_ENABLE;
     -- Inputs
     opc_deo_uxn_opcodes_h_l1052_c39_444c_stack_index <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_444c_stack_index;
     opc_deo_uxn_opcodes_h_l1052_c39_444c_ins <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_444c_ins;
     opc_deo_uxn_opcodes_h_l1052_c39_444c_k <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_444c_k;
     -- Outputs
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_444c_return_output := opc_deo_uxn_opcodes_h_l1052_c39_444c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_ec0e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_9d06] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_9d06_return_output;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_f18b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_ec0e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_c253_iftrue := VAR_opc_deo_uxn_opcodes_h_l1052_c39_444c_return_output;
     -- opc_deo2[uxn_opcodes_h_l1053_c39_f18b] LATENCY=0
     -- Clock enable
     opc_deo2_uxn_opcodes_h_l1053_c39_f18b_CLOCK_ENABLE <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_f18b_CLOCK_ENABLE;
     -- Inputs
     opc_deo2_uxn_opcodes_h_l1053_c39_f18b_stack_index <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_f18b_stack_index;
     opc_deo2_uxn_opcodes_h_l1053_c39_f18b_ins <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_f18b_ins;
     opc_deo2_uxn_opcodes_h_l1053_c39_f18b_k <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_f18b_k;
     -- Outputs
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_f18b_return_output := opc_deo2_uxn_opcodes_h_l1053_c39_f18b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_592e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_8db0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_8db0_return_output;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_eb76_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_592e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_77f8_iftrue := VAR_opc_deo2_uxn_opcodes_h_l1053_c39_f18b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_a24a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_9769] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_return_output;

     -- opc_add[uxn_opcodes_h_l1054_c39_eb76] LATENCY=0
     -- Clock enable
     opc_add_uxn_opcodes_h_l1054_c39_eb76_CLOCK_ENABLE <= VAR_opc_add_uxn_opcodes_h_l1054_c39_eb76_CLOCK_ENABLE;
     -- Inputs
     opc_add_uxn_opcodes_h_l1054_c39_eb76_stack_index <= VAR_opc_add_uxn_opcodes_h_l1054_c39_eb76_stack_index;
     opc_add_uxn_opcodes_h_l1054_c39_eb76_ins <= VAR_opc_add_uxn_opcodes_h_l1054_c39_eb76_ins;
     opc_add_uxn_opcodes_h_l1054_c39_eb76_k <= VAR_opc_add_uxn_opcodes_h_l1054_c39_eb76_k;
     -- Outputs
     VAR_opc_add_uxn_opcodes_h_l1054_c39_eb76_return_output := opc_add_uxn_opcodes_h_l1054_c39_eb76_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a24a_return_output;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_9d77_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_9769_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_9d06_iftrue := VAR_opc_add_uxn_opcodes_h_l1054_c39_eb76_return_output;
     -- opc_add2[uxn_opcodes_h_l1055_c39_9d77] LATENCY=0
     -- Clock enable
     opc_add2_uxn_opcodes_h_l1055_c39_9d77_CLOCK_ENABLE <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_9d77_CLOCK_ENABLE;
     -- Inputs
     opc_add2_uxn_opcodes_h_l1055_c39_9d77_stack_index <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_9d77_stack_index;
     opc_add2_uxn_opcodes_h_l1055_c39_9d77_ins <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_9d77_ins;
     opc_add2_uxn_opcodes_h_l1055_c39_9d77_k <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_9d77_k;
     -- Outputs
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_9d77_return_output := opc_add2_uxn_opcodes_h_l1055_c39_9d77_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_e217] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_b54c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_b54c_return_output;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_65ca_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_e217_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_8db0_iftrue := VAR_opc_add2_uxn_opcodes_h_l1055_c39_9d77_return_output;
     -- opc_sub[uxn_opcodes_h_l1056_c39_65ca] LATENCY=0
     -- Clock enable
     opc_sub_uxn_opcodes_h_l1056_c39_65ca_CLOCK_ENABLE <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_65ca_CLOCK_ENABLE;
     -- Inputs
     opc_sub_uxn_opcodes_h_l1056_c39_65ca_stack_index <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_65ca_stack_index;
     opc_sub_uxn_opcodes_h_l1056_c39_65ca_ins <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_65ca_ins;
     opc_sub_uxn_opcodes_h_l1056_c39_65ca_k <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_65ca_k;
     -- Outputs
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_65ca_return_output := opc_sub_uxn_opcodes_h_l1056_c39_65ca_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_488a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_f141] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_f141_return_output;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0279_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_488a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_a24a_iftrue := VAR_opc_sub_uxn_opcodes_h_l1056_c39_65ca_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_81ed] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_c575] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_return_output;

     -- opc_sub2[uxn_opcodes_h_l1057_c39_0279] LATENCY=0
     -- Clock enable
     opc_sub2_uxn_opcodes_h_l1057_c39_0279_CLOCK_ENABLE <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0279_CLOCK_ENABLE;
     -- Inputs
     opc_sub2_uxn_opcodes_h_l1057_c39_0279_stack_index <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0279_stack_index;
     opc_sub2_uxn_opcodes_h_l1057_c39_0279_ins <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0279_ins;
     opc_sub2_uxn_opcodes_h_l1057_c39_0279_k <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0279_k;
     -- Outputs
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0279_return_output := opc_sub2_uxn_opcodes_h_l1057_c39_0279_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_c575_return_output;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_18b8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_81ed_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_b54c_iftrue := VAR_opc_sub2_uxn_opcodes_h_l1057_c39_0279_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_048d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_return_output;

     -- opc_mul[uxn_opcodes_h_l1058_c39_18b8] LATENCY=0
     -- Clock enable
     opc_mul_uxn_opcodes_h_l1058_c39_18b8_CLOCK_ENABLE <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_18b8_CLOCK_ENABLE;
     -- Inputs
     opc_mul_uxn_opcodes_h_l1058_c39_18b8_stack_index <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_18b8_stack_index;
     opc_mul_uxn_opcodes_h_l1058_c39_18b8_ins <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_18b8_ins;
     opc_mul_uxn_opcodes_h_l1058_c39_18b8_k <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_18b8_k;
     -- Outputs
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_18b8_return_output := opc_mul_uxn_opcodes_h_l1058_c39_18b8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_602b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_602b_return_output;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_4623_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_048d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_f141_iftrue := VAR_opc_mul_uxn_opcodes_h_l1058_c39_18b8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_50f7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_return_output;

     -- opc_mul2[uxn_opcodes_h_l1059_c39_4623] LATENCY=0
     -- Clock enable
     opc_mul2_uxn_opcodes_h_l1059_c39_4623_CLOCK_ENABLE <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_4623_CLOCK_ENABLE;
     -- Inputs
     opc_mul2_uxn_opcodes_h_l1059_c39_4623_stack_index <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_4623_stack_index;
     opc_mul2_uxn_opcodes_h_l1059_c39_4623_ins <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_4623_ins;
     opc_mul2_uxn_opcodes_h_l1059_c39_4623_k <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_4623_k;
     -- Outputs
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_4623_return_output := opc_mul2_uxn_opcodes_h_l1059_c39_4623_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_def9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_50f7_return_output;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_c18c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_def9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_c575_iftrue := VAR_opc_mul2_uxn_opcodes_h_l1059_c39_4623_return_output;
     -- opc_div[uxn_opcodes_h_l1060_c39_c18c] LATENCY=0
     -- Clock enable
     opc_div_uxn_opcodes_h_l1060_c39_c18c_CLOCK_ENABLE <= VAR_opc_div_uxn_opcodes_h_l1060_c39_c18c_CLOCK_ENABLE;
     -- Inputs
     opc_div_uxn_opcodes_h_l1060_c39_c18c_stack_index <= VAR_opc_div_uxn_opcodes_h_l1060_c39_c18c_stack_index;
     opc_div_uxn_opcodes_h_l1060_c39_c18c_ins <= VAR_opc_div_uxn_opcodes_h_l1060_c39_c18c_ins;
     opc_div_uxn_opcodes_h_l1060_c39_c18c_k <= VAR_opc_div_uxn_opcodes_h_l1060_c39_c18c_k;
     -- Outputs
     VAR_opc_div_uxn_opcodes_h_l1060_c39_c18c_return_output := opc_div_uxn_opcodes_h_l1060_c39_c18c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_1c17] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_e8dd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_1c17_return_output;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_4306_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_e8dd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_602b_iftrue := VAR_opc_div_uxn_opcodes_h_l1060_c39_c18c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_af6f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_0644] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_return_output;

     -- opc_div2[uxn_opcodes_h_l1061_c39_4306] LATENCY=0
     -- Clock enable
     opc_div2_uxn_opcodes_h_l1061_c39_4306_CLOCK_ENABLE <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_4306_CLOCK_ENABLE;
     -- Inputs
     opc_div2_uxn_opcodes_h_l1061_c39_4306_stack_index <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_4306_stack_index;
     opc_div2_uxn_opcodes_h_l1061_c39_4306_ins <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_4306_ins;
     opc_div2_uxn_opcodes_h_l1061_c39_4306_k <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_4306_k;
     -- Outputs
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_4306_return_output := opc_div2_uxn_opcodes_h_l1061_c39_4306_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_af6f_return_output;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_beaf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_0644_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_50f7_iftrue := VAR_opc_div2_uxn_opcodes_h_l1061_c39_4306_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_8bea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_return_output;

     -- opc_and[uxn_opcodes_h_l1062_c39_beaf] LATENCY=0
     -- Clock enable
     opc_and_uxn_opcodes_h_l1062_c39_beaf_CLOCK_ENABLE <= VAR_opc_and_uxn_opcodes_h_l1062_c39_beaf_CLOCK_ENABLE;
     -- Inputs
     opc_and_uxn_opcodes_h_l1062_c39_beaf_stack_index <= VAR_opc_and_uxn_opcodes_h_l1062_c39_beaf_stack_index;
     opc_and_uxn_opcodes_h_l1062_c39_beaf_ins <= VAR_opc_and_uxn_opcodes_h_l1062_c39_beaf_ins;
     opc_and_uxn_opcodes_h_l1062_c39_beaf_k <= VAR_opc_and_uxn_opcodes_h_l1062_c39_beaf_k;
     -- Outputs
     VAR_opc_and_uxn_opcodes_h_l1062_c39_beaf_return_output := opc_and_uxn_opcodes_h_l1062_c39_beaf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_2d03] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_2d03_return_output;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_4cda_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_8bea_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_1c17_iftrue := VAR_opc_and_uxn_opcodes_h_l1062_c39_beaf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_6f40] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_return_output;

     -- opc_and2[uxn_opcodes_h_l1063_c39_4cda] LATENCY=0
     -- Clock enable
     opc_and2_uxn_opcodes_h_l1063_c39_4cda_CLOCK_ENABLE <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_4cda_CLOCK_ENABLE;
     -- Inputs
     opc_and2_uxn_opcodes_h_l1063_c39_4cda_stack_index <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_4cda_stack_index;
     opc_and2_uxn_opcodes_h_l1063_c39_4cda_ins <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_4cda_ins;
     opc_and2_uxn_opcodes_h_l1063_c39_4cda_k <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_4cda_k;
     -- Outputs
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_4cda_return_output := opc_and2_uxn_opcodes_h_l1063_c39_4cda_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_bf04] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_6f40_return_output;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_17ed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_bf04_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_af6f_iftrue := VAR_opc_and2_uxn_opcodes_h_l1063_c39_4cda_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_0787] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_4edb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_return_output;

     -- opc_ora[uxn_opcodes_h_l1064_c39_17ed] LATENCY=0
     -- Clock enable
     opc_ora_uxn_opcodes_h_l1064_c39_17ed_CLOCK_ENABLE <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_17ed_CLOCK_ENABLE;
     -- Inputs
     opc_ora_uxn_opcodes_h_l1064_c39_17ed_stack_index <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_17ed_stack_index;
     opc_ora_uxn_opcodes_h_l1064_c39_17ed_ins <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_17ed_ins;
     opc_ora_uxn_opcodes_h_l1064_c39_17ed_k <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_17ed_k;
     -- Outputs
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_17ed_return_output := opc_ora_uxn_opcodes_h_l1064_c39_17ed_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_4edb_return_output;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_3b66_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_0787_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_2d03_iftrue := VAR_opc_ora_uxn_opcodes_h_l1064_c39_17ed_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_fbdc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_5176] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_return_output;

     -- opc_ora2[uxn_opcodes_h_l1065_c39_3b66] LATENCY=0
     -- Clock enable
     opc_ora2_uxn_opcodes_h_l1065_c39_3b66_CLOCK_ENABLE <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_3b66_CLOCK_ENABLE;
     -- Inputs
     opc_ora2_uxn_opcodes_h_l1065_c39_3b66_stack_index <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_3b66_stack_index;
     opc_ora2_uxn_opcodes_h_l1065_c39_3b66_ins <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_3b66_ins;
     opc_ora2_uxn_opcodes_h_l1065_c39_3b66_k <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_3b66_k;
     -- Outputs
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_3b66_return_output := opc_ora2_uxn_opcodes_h_l1065_c39_3b66_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_fbdc_return_output;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_2d57_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_5176_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_6f40_iftrue := VAR_opc_ora2_uxn_opcodes_h_l1065_c39_3b66_return_output;
     -- opc_eor[uxn_opcodes_h_l1066_c39_2d57] LATENCY=0
     -- Clock enable
     opc_eor_uxn_opcodes_h_l1066_c39_2d57_CLOCK_ENABLE <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_2d57_CLOCK_ENABLE;
     -- Inputs
     opc_eor_uxn_opcodes_h_l1066_c39_2d57_stack_index <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_2d57_stack_index;
     opc_eor_uxn_opcodes_h_l1066_c39_2d57_ins <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_2d57_ins;
     opc_eor_uxn_opcodes_h_l1066_c39_2d57_k <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_2d57_k;
     -- Outputs
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_2d57_return_output := opc_eor_uxn_opcodes_h_l1066_c39_2d57_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_1642] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_5645] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_5645_return_output;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_49c5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_1642_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_4edb_iftrue := VAR_opc_eor_uxn_opcodes_h_l1066_c39_2d57_return_output;
     -- opc_eor2[uxn_opcodes_h_l1067_c39_49c5] LATENCY=0
     -- Clock enable
     opc_eor2_uxn_opcodes_h_l1067_c39_49c5_CLOCK_ENABLE <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_49c5_CLOCK_ENABLE;
     -- Inputs
     opc_eor2_uxn_opcodes_h_l1067_c39_49c5_stack_index <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_49c5_stack_index;
     opc_eor2_uxn_opcodes_h_l1067_c39_49c5_ins <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_49c5_ins;
     opc_eor2_uxn_opcodes_h_l1067_c39_49c5_k <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_49c5_k;
     -- Outputs
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_49c5_return_output := opc_eor2_uxn_opcodes_h_l1067_c39_49c5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_6b41] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_cd32] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_return_output;

     -- Submodule level 70
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_6b41_return_output;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_8c1c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_cd32_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_fbdc_iftrue := VAR_opc_eor2_uxn_opcodes_h_l1067_c39_49c5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_432b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_return_output;

     -- opc_sft[uxn_opcodes_h_l1068_c39_8c1c] LATENCY=0
     -- Clock enable
     opc_sft_uxn_opcodes_h_l1068_c39_8c1c_CLOCK_ENABLE <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_8c1c_CLOCK_ENABLE;
     -- Inputs
     opc_sft_uxn_opcodes_h_l1068_c39_8c1c_stack_index <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_8c1c_stack_index;
     opc_sft_uxn_opcodes_h_l1068_c39_8c1c_ins <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_8c1c_ins;
     opc_sft_uxn_opcodes_h_l1068_c39_8c1c_k <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_8c1c_k;
     -- Outputs
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_8c1c_return_output := opc_sft_uxn_opcodes_h_l1068_c39_8c1c_return_output;

     -- Submodule level 71
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_8375_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_432b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_5645_iftrue := VAR_opc_sft_uxn_opcodes_h_l1068_c39_8c1c_return_output;
     -- opc_sft2[uxn_opcodes_h_l1069_c39_8375] LATENCY=0
     -- Clock enable
     opc_sft2_uxn_opcodes_h_l1069_c39_8375_CLOCK_ENABLE <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_8375_CLOCK_ENABLE;
     -- Inputs
     opc_sft2_uxn_opcodes_h_l1069_c39_8375_stack_index <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_8375_stack_index;
     opc_sft2_uxn_opcodes_h_l1069_c39_8375_ins <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_8375_ins;
     opc_sft2_uxn_opcodes_h_l1069_c39_8375_k <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_8375_k;
     -- Outputs
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_8375_return_output := opc_sft2_uxn_opcodes_h_l1069_c39_8375_return_output;

     -- Submodule level 72
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_6b41_iftrue := VAR_opc_sft2_uxn_opcodes_h_l1069_c39_8375_return_output;
     -- result_MUX[uxn_opcodes_h_l1069_c7_6b41] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1069_c7_6b41_cond <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_6b41_cond;
     result_MUX_uxn_opcodes_h_l1069_c7_6b41_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_6b41_iftrue;
     result_MUX_uxn_opcodes_h_l1069_c7_6b41_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_6b41_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_6b41_return_output := result_MUX_uxn_opcodes_h_l1069_c7_6b41_return_output;

     -- Submodule level 73
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_5645_iffalse := VAR_result_MUX_uxn_opcodes_h_l1069_c7_6b41_return_output;
     -- result_MUX[uxn_opcodes_h_l1068_c7_5645] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1068_c7_5645_cond <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_5645_cond;
     result_MUX_uxn_opcodes_h_l1068_c7_5645_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_5645_iftrue;
     result_MUX_uxn_opcodes_h_l1068_c7_5645_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_5645_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_5645_return_output := result_MUX_uxn_opcodes_h_l1068_c7_5645_return_output;

     -- Submodule level 74
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_fbdc_iffalse := VAR_result_MUX_uxn_opcodes_h_l1068_c7_5645_return_output;
     -- result_MUX[uxn_opcodes_h_l1067_c7_fbdc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1067_c7_fbdc_cond <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_fbdc_cond;
     result_MUX_uxn_opcodes_h_l1067_c7_fbdc_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_fbdc_iftrue;
     result_MUX_uxn_opcodes_h_l1067_c7_fbdc_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_fbdc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_fbdc_return_output := result_MUX_uxn_opcodes_h_l1067_c7_fbdc_return_output;

     -- Submodule level 75
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_4edb_iffalse := VAR_result_MUX_uxn_opcodes_h_l1067_c7_fbdc_return_output;
     -- result_MUX[uxn_opcodes_h_l1066_c7_4edb] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1066_c7_4edb_cond <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_4edb_cond;
     result_MUX_uxn_opcodes_h_l1066_c7_4edb_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_4edb_iftrue;
     result_MUX_uxn_opcodes_h_l1066_c7_4edb_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_4edb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_4edb_return_output := result_MUX_uxn_opcodes_h_l1066_c7_4edb_return_output;

     -- Submodule level 76
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_6f40_iffalse := VAR_result_MUX_uxn_opcodes_h_l1066_c7_4edb_return_output;
     -- result_MUX[uxn_opcodes_h_l1065_c7_6f40] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1065_c7_6f40_cond <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_6f40_cond;
     result_MUX_uxn_opcodes_h_l1065_c7_6f40_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_6f40_iftrue;
     result_MUX_uxn_opcodes_h_l1065_c7_6f40_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_6f40_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_6f40_return_output := result_MUX_uxn_opcodes_h_l1065_c7_6f40_return_output;

     -- Submodule level 77
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_2d03_iffalse := VAR_result_MUX_uxn_opcodes_h_l1065_c7_6f40_return_output;
     -- result_MUX[uxn_opcodes_h_l1064_c7_2d03] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1064_c7_2d03_cond <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_2d03_cond;
     result_MUX_uxn_opcodes_h_l1064_c7_2d03_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_2d03_iftrue;
     result_MUX_uxn_opcodes_h_l1064_c7_2d03_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_2d03_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_2d03_return_output := result_MUX_uxn_opcodes_h_l1064_c7_2d03_return_output;

     -- Submodule level 78
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_af6f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1064_c7_2d03_return_output;
     -- result_MUX[uxn_opcodes_h_l1063_c7_af6f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1063_c7_af6f_cond <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_af6f_cond;
     result_MUX_uxn_opcodes_h_l1063_c7_af6f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_af6f_iftrue;
     result_MUX_uxn_opcodes_h_l1063_c7_af6f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_af6f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_af6f_return_output := result_MUX_uxn_opcodes_h_l1063_c7_af6f_return_output;

     -- Submodule level 79
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_1c17_iffalse := VAR_result_MUX_uxn_opcodes_h_l1063_c7_af6f_return_output;
     -- result_MUX[uxn_opcodes_h_l1062_c7_1c17] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1062_c7_1c17_cond <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_1c17_cond;
     result_MUX_uxn_opcodes_h_l1062_c7_1c17_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_1c17_iftrue;
     result_MUX_uxn_opcodes_h_l1062_c7_1c17_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_1c17_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_1c17_return_output := result_MUX_uxn_opcodes_h_l1062_c7_1c17_return_output;

     -- Submodule level 80
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_50f7_iffalse := VAR_result_MUX_uxn_opcodes_h_l1062_c7_1c17_return_output;
     -- result_MUX[uxn_opcodes_h_l1061_c7_50f7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1061_c7_50f7_cond <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_50f7_cond;
     result_MUX_uxn_opcodes_h_l1061_c7_50f7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_50f7_iftrue;
     result_MUX_uxn_opcodes_h_l1061_c7_50f7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_50f7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_50f7_return_output := result_MUX_uxn_opcodes_h_l1061_c7_50f7_return_output;

     -- Submodule level 81
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_602b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1061_c7_50f7_return_output;
     -- result_MUX[uxn_opcodes_h_l1060_c7_602b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1060_c7_602b_cond <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_602b_cond;
     result_MUX_uxn_opcodes_h_l1060_c7_602b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_602b_iftrue;
     result_MUX_uxn_opcodes_h_l1060_c7_602b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_602b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_602b_return_output := result_MUX_uxn_opcodes_h_l1060_c7_602b_return_output;

     -- Submodule level 82
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_c575_iffalse := VAR_result_MUX_uxn_opcodes_h_l1060_c7_602b_return_output;
     -- result_MUX[uxn_opcodes_h_l1059_c7_c575] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1059_c7_c575_cond <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_c575_cond;
     result_MUX_uxn_opcodes_h_l1059_c7_c575_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_c575_iftrue;
     result_MUX_uxn_opcodes_h_l1059_c7_c575_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_c575_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_c575_return_output := result_MUX_uxn_opcodes_h_l1059_c7_c575_return_output;

     -- Submodule level 83
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_f141_iffalse := VAR_result_MUX_uxn_opcodes_h_l1059_c7_c575_return_output;
     -- result_MUX[uxn_opcodes_h_l1058_c7_f141] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1058_c7_f141_cond <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_f141_cond;
     result_MUX_uxn_opcodes_h_l1058_c7_f141_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_f141_iftrue;
     result_MUX_uxn_opcodes_h_l1058_c7_f141_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_f141_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_f141_return_output := result_MUX_uxn_opcodes_h_l1058_c7_f141_return_output;

     -- Submodule level 84
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_b54c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1058_c7_f141_return_output;
     -- result_MUX[uxn_opcodes_h_l1057_c7_b54c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1057_c7_b54c_cond <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_b54c_cond;
     result_MUX_uxn_opcodes_h_l1057_c7_b54c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_b54c_iftrue;
     result_MUX_uxn_opcodes_h_l1057_c7_b54c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_b54c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_b54c_return_output := result_MUX_uxn_opcodes_h_l1057_c7_b54c_return_output;

     -- Submodule level 85
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_a24a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1057_c7_b54c_return_output;
     -- result_MUX[uxn_opcodes_h_l1056_c7_a24a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1056_c7_a24a_cond <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_a24a_cond;
     result_MUX_uxn_opcodes_h_l1056_c7_a24a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_a24a_iftrue;
     result_MUX_uxn_opcodes_h_l1056_c7_a24a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_a24a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_a24a_return_output := result_MUX_uxn_opcodes_h_l1056_c7_a24a_return_output;

     -- Submodule level 86
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_8db0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1056_c7_a24a_return_output;
     -- result_MUX[uxn_opcodes_h_l1055_c7_8db0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1055_c7_8db0_cond <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_8db0_cond;
     result_MUX_uxn_opcodes_h_l1055_c7_8db0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_8db0_iftrue;
     result_MUX_uxn_opcodes_h_l1055_c7_8db0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_8db0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_8db0_return_output := result_MUX_uxn_opcodes_h_l1055_c7_8db0_return_output;

     -- Submodule level 87
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_9d06_iffalse := VAR_result_MUX_uxn_opcodes_h_l1055_c7_8db0_return_output;
     -- result_MUX[uxn_opcodes_h_l1054_c7_9d06] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1054_c7_9d06_cond <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_9d06_cond;
     result_MUX_uxn_opcodes_h_l1054_c7_9d06_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_9d06_iftrue;
     result_MUX_uxn_opcodes_h_l1054_c7_9d06_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_9d06_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_9d06_return_output := result_MUX_uxn_opcodes_h_l1054_c7_9d06_return_output;

     -- Submodule level 88
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_77f8_iffalse := VAR_result_MUX_uxn_opcodes_h_l1054_c7_9d06_return_output;
     -- result_MUX[uxn_opcodes_h_l1053_c7_77f8] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1053_c7_77f8_cond <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_77f8_cond;
     result_MUX_uxn_opcodes_h_l1053_c7_77f8_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_77f8_iftrue;
     result_MUX_uxn_opcodes_h_l1053_c7_77f8_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_77f8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_77f8_return_output := result_MUX_uxn_opcodes_h_l1053_c7_77f8_return_output;

     -- Submodule level 89
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_c253_iffalse := VAR_result_MUX_uxn_opcodes_h_l1053_c7_77f8_return_output;
     -- result_MUX[uxn_opcodes_h_l1052_c7_c253] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1052_c7_c253_cond <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_c253_cond;
     result_MUX_uxn_opcodes_h_l1052_c7_c253_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_c253_iftrue;
     result_MUX_uxn_opcodes_h_l1052_c7_c253_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_c253_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_c253_return_output := result_MUX_uxn_opcodes_h_l1052_c7_c253_return_output;

     -- Submodule level 90
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_54aa_iffalse := VAR_result_MUX_uxn_opcodes_h_l1052_c7_c253_return_output;
     -- result_MUX[uxn_opcodes_h_l1051_c7_54aa] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1051_c7_54aa_cond <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_54aa_cond;
     result_MUX_uxn_opcodes_h_l1051_c7_54aa_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_54aa_iftrue;
     result_MUX_uxn_opcodes_h_l1051_c7_54aa_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_54aa_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_54aa_return_output := result_MUX_uxn_opcodes_h_l1051_c7_54aa_return_output;

     -- Submodule level 91
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_4e7f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1051_c7_54aa_return_output;
     -- result_MUX[uxn_opcodes_h_l1050_c7_4e7f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1050_c7_4e7f_cond <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_4e7f_cond;
     result_MUX_uxn_opcodes_h_l1050_c7_4e7f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_4e7f_iftrue;
     result_MUX_uxn_opcodes_h_l1050_c7_4e7f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_4e7f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_4e7f_return_output := result_MUX_uxn_opcodes_h_l1050_c7_4e7f_return_output;

     -- Submodule level 92
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_2eac_iffalse := VAR_result_MUX_uxn_opcodes_h_l1050_c7_4e7f_return_output;
     -- result_MUX[uxn_opcodes_h_l1049_c7_2eac] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1049_c7_2eac_cond <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_2eac_cond;
     result_MUX_uxn_opcodes_h_l1049_c7_2eac_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_2eac_iftrue;
     result_MUX_uxn_opcodes_h_l1049_c7_2eac_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_2eac_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_2eac_return_output := result_MUX_uxn_opcodes_h_l1049_c7_2eac_return_output;

     -- Submodule level 93
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_cdaa_iffalse := VAR_result_MUX_uxn_opcodes_h_l1049_c7_2eac_return_output;
     -- result_MUX[uxn_opcodes_h_l1048_c7_cdaa] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1048_c7_cdaa_cond <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_cdaa_cond;
     result_MUX_uxn_opcodes_h_l1048_c7_cdaa_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_cdaa_iftrue;
     result_MUX_uxn_opcodes_h_l1048_c7_cdaa_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_cdaa_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_cdaa_return_output := result_MUX_uxn_opcodes_h_l1048_c7_cdaa_return_output;

     -- Submodule level 94
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_8724_iffalse := VAR_result_MUX_uxn_opcodes_h_l1048_c7_cdaa_return_output;
     -- result_MUX[uxn_opcodes_h_l1047_c7_8724] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1047_c7_8724_cond <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_8724_cond;
     result_MUX_uxn_opcodes_h_l1047_c7_8724_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_8724_iftrue;
     result_MUX_uxn_opcodes_h_l1047_c7_8724_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_8724_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_8724_return_output := result_MUX_uxn_opcodes_h_l1047_c7_8724_return_output;

     -- Submodule level 95
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_5974_iffalse := VAR_result_MUX_uxn_opcodes_h_l1047_c7_8724_return_output;
     -- result_MUX[uxn_opcodes_h_l1046_c7_5974] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1046_c7_5974_cond <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_5974_cond;
     result_MUX_uxn_opcodes_h_l1046_c7_5974_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_5974_iftrue;
     result_MUX_uxn_opcodes_h_l1046_c7_5974_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_5974_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_5974_return_output := result_MUX_uxn_opcodes_h_l1046_c7_5974_return_output;

     -- Submodule level 96
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_bd42_iffalse := VAR_result_MUX_uxn_opcodes_h_l1046_c7_5974_return_output;
     -- result_MUX[uxn_opcodes_h_l1045_c7_bd42] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1045_c7_bd42_cond <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_bd42_cond;
     result_MUX_uxn_opcodes_h_l1045_c7_bd42_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_bd42_iftrue;
     result_MUX_uxn_opcodes_h_l1045_c7_bd42_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_bd42_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_bd42_return_output := result_MUX_uxn_opcodes_h_l1045_c7_bd42_return_output;

     -- Submodule level 97
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_3d7a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1045_c7_bd42_return_output;
     -- result_MUX[uxn_opcodes_h_l1044_c7_3d7a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1044_c7_3d7a_cond <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_3d7a_cond;
     result_MUX_uxn_opcodes_h_l1044_c7_3d7a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_3d7a_iftrue;
     result_MUX_uxn_opcodes_h_l1044_c7_3d7a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_3d7a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_3d7a_return_output := result_MUX_uxn_opcodes_h_l1044_c7_3d7a_return_output;

     -- Submodule level 98
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_f3ce_iffalse := VAR_result_MUX_uxn_opcodes_h_l1044_c7_3d7a_return_output;
     -- result_MUX[uxn_opcodes_h_l1043_c7_f3ce] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1043_c7_f3ce_cond <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_f3ce_cond;
     result_MUX_uxn_opcodes_h_l1043_c7_f3ce_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_f3ce_iftrue;
     result_MUX_uxn_opcodes_h_l1043_c7_f3ce_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_f3ce_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_f3ce_return_output := result_MUX_uxn_opcodes_h_l1043_c7_f3ce_return_output;

     -- Submodule level 99
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_6143_iffalse := VAR_result_MUX_uxn_opcodes_h_l1043_c7_f3ce_return_output;
     -- result_MUX[uxn_opcodes_h_l1042_c7_6143] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1042_c7_6143_cond <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_6143_cond;
     result_MUX_uxn_opcodes_h_l1042_c7_6143_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_6143_iftrue;
     result_MUX_uxn_opcodes_h_l1042_c7_6143_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_6143_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_6143_return_output := result_MUX_uxn_opcodes_h_l1042_c7_6143_return_output;

     -- Submodule level 100
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_c58b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1042_c7_6143_return_output;
     -- result_MUX[uxn_opcodes_h_l1041_c7_c58b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1041_c7_c58b_cond <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_c58b_cond;
     result_MUX_uxn_opcodes_h_l1041_c7_c58b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_c58b_iftrue;
     result_MUX_uxn_opcodes_h_l1041_c7_c58b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_c58b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_c58b_return_output := result_MUX_uxn_opcodes_h_l1041_c7_c58b_return_output;

     -- Submodule level 101
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_4cdb_iffalse := VAR_result_MUX_uxn_opcodes_h_l1041_c7_c58b_return_output;
     -- result_MUX[uxn_opcodes_h_l1040_c7_4cdb] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1040_c7_4cdb_cond <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_4cdb_cond;
     result_MUX_uxn_opcodes_h_l1040_c7_4cdb_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_4cdb_iftrue;
     result_MUX_uxn_opcodes_h_l1040_c7_4cdb_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_4cdb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_4cdb_return_output := result_MUX_uxn_opcodes_h_l1040_c7_4cdb_return_output;

     -- Submodule level 102
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_6d74_iffalse := VAR_result_MUX_uxn_opcodes_h_l1040_c7_4cdb_return_output;
     -- result_MUX[uxn_opcodes_h_l1039_c7_6d74] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1039_c7_6d74_cond <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_6d74_cond;
     result_MUX_uxn_opcodes_h_l1039_c7_6d74_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_6d74_iftrue;
     result_MUX_uxn_opcodes_h_l1039_c7_6d74_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_6d74_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_6d74_return_output := result_MUX_uxn_opcodes_h_l1039_c7_6d74_return_output;

     -- Submodule level 103
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_f181_iffalse := VAR_result_MUX_uxn_opcodes_h_l1039_c7_6d74_return_output;
     -- result_MUX[uxn_opcodes_h_l1038_c7_f181] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1038_c7_f181_cond <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_f181_cond;
     result_MUX_uxn_opcodes_h_l1038_c7_f181_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_f181_iftrue;
     result_MUX_uxn_opcodes_h_l1038_c7_f181_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_f181_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_f181_return_output := result_MUX_uxn_opcodes_h_l1038_c7_f181_return_output;

     -- Submodule level 104
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_b6ac_iffalse := VAR_result_MUX_uxn_opcodes_h_l1038_c7_f181_return_output;
     -- result_MUX[uxn_opcodes_h_l1037_c7_b6ac] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1037_c7_b6ac_cond <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_b6ac_cond;
     result_MUX_uxn_opcodes_h_l1037_c7_b6ac_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_b6ac_iftrue;
     result_MUX_uxn_opcodes_h_l1037_c7_b6ac_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_b6ac_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_b6ac_return_output := result_MUX_uxn_opcodes_h_l1037_c7_b6ac_return_output;

     -- Submodule level 105
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_dbbe_iffalse := VAR_result_MUX_uxn_opcodes_h_l1037_c7_b6ac_return_output;
     -- result_MUX[uxn_opcodes_h_l1036_c7_dbbe] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1036_c7_dbbe_cond <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_dbbe_cond;
     result_MUX_uxn_opcodes_h_l1036_c7_dbbe_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_dbbe_iftrue;
     result_MUX_uxn_opcodes_h_l1036_c7_dbbe_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_dbbe_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_dbbe_return_output := result_MUX_uxn_opcodes_h_l1036_c7_dbbe_return_output;

     -- Submodule level 106
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_2367_iffalse := VAR_result_MUX_uxn_opcodes_h_l1036_c7_dbbe_return_output;
     -- result_MUX[uxn_opcodes_h_l1035_c7_2367] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1035_c7_2367_cond <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_2367_cond;
     result_MUX_uxn_opcodes_h_l1035_c7_2367_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_2367_iftrue;
     result_MUX_uxn_opcodes_h_l1035_c7_2367_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_2367_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_2367_return_output := result_MUX_uxn_opcodes_h_l1035_c7_2367_return_output;

     -- Submodule level 107
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_ad42_iffalse := VAR_result_MUX_uxn_opcodes_h_l1035_c7_2367_return_output;
     -- result_MUX[uxn_opcodes_h_l1034_c7_ad42] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1034_c7_ad42_cond <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_ad42_cond;
     result_MUX_uxn_opcodes_h_l1034_c7_ad42_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_ad42_iftrue;
     result_MUX_uxn_opcodes_h_l1034_c7_ad42_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_ad42_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_ad42_return_output := result_MUX_uxn_opcodes_h_l1034_c7_ad42_return_output;

     -- Submodule level 108
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_ce7a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1034_c7_ad42_return_output;
     -- result_MUX[uxn_opcodes_h_l1033_c7_ce7a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1033_c7_ce7a_cond <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_ce7a_cond;
     result_MUX_uxn_opcodes_h_l1033_c7_ce7a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_ce7a_iftrue;
     result_MUX_uxn_opcodes_h_l1033_c7_ce7a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_ce7a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_ce7a_return_output := result_MUX_uxn_opcodes_h_l1033_c7_ce7a_return_output;

     -- Submodule level 109
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_12bf_iffalse := VAR_result_MUX_uxn_opcodes_h_l1033_c7_ce7a_return_output;
     -- result_MUX[uxn_opcodes_h_l1032_c7_12bf] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1032_c7_12bf_cond <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_12bf_cond;
     result_MUX_uxn_opcodes_h_l1032_c7_12bf_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_12bf_iftrue;
     result_MUX_uxn_opcodes_h_l1032_c7_12bf_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_12bf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_12bf_return_output := result_MUX_uxn_opcodes_h_l1032_c7_12bf_return_output;

     -- Submodule level 110
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_0198_iffalse := VAR_result_MUX_uxn_opcodes_h_l1032_c7_12bf_return_output;
     -- result_MUX[uxn_opcodes_h_l1031_c7_0198] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1031_c7_0198_cond <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_0198_cond;
     result_MUX_uxn_opcodes_h_l1031_c7_0198_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_0198_iftrue;
     result_MUX_uxn_opcodes_h_l1031_c7_0198_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_0198_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_0198_return_output := result_MUX_uxn_opcodes_h_l1031_c7_0198_return_output;

     -- Submodule level 111
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_e28b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1031_c7_0198_return_output;
     -- result_MUX[uxn_opcodes_h_l1030_c7_e28b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1030_c7_e28b_cond <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_e28b_cond;
     result_MUX_uxn_opcodes_h_l1030_c7_e28b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_e28b_iftrue;
     result_MUX_uxn_opcodes_h_l1030_c7_e28b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_e28b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_e28b_return_output := result_MUX_uxn_opcodes_h_l1030_c7_e28b_return_output;

     -- Submodule level 112
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_b1a2_iffalse := VAR_result_MUX_uxn_opcodes_h_l1030_c7_e28b_return_output;
     -- result_MUX[uxn_opcodes_h_l1029_c7_b1a2] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1029_c7_b1a2_cond <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_b1a2_cond;
     result_MUX_uxn_opcodes_h_l1029_c7_b1a2_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_b1a2_iftrue;
     result_MUX_uxn_opcodes_h_l1029_c7_b1a2_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_b1a2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_b1a2_return_output := result_MUX_uxn_opcodes_h_l1029_c7_b1a2_return_output;

     -- Submodule level 113
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_8a4b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1029_c7_b1a2_return_output;
     -- result_MUX[uxn_opcodes_h_l1028_c7_8a4b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1028_c7_8a4b_cond <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_8a4b_cond;
     result_MUX_uxn_opcodes_h_l1028_c7_8a4b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_8a4b_iftrue;
     result_MUX_uxn_opcodes_h_l1028_c7_8a4b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_8a4b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_8a4b_return_output := result_MUX_uxn_opcodes_h_l1028_c7_8a4b_return_output;

     -- Submodule level 114
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a9f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1028_c7_8a4b_return_output;
     -- result_MUX[uxn_opcodes_h_l1027_c7_9a9f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1027_c7_9a9f_cond <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a9f_cond;
     result_MUX_uxn_opcodes_h_l1027_c7_9a9f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a9f_iftrue;
     result_MUX_uxn_opcodes_h_l1027_c7_9a9f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a9f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a9f_return_output := result_MUX_uxn_opcodes_h_l1027_c7_9a9f_return_output;

     -- Submodule level 115
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_d86d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1027_c7_9a9f_return_output;
     -- result_MUX[uxn_opcodes_h_l1026_c7_d86d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1026_c7_d86d_cond <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_d86d_cond;
     result_MUX_uxn_opcodes_h_l1026_c7_d86d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_d86d_iftrue;
     result_MUX_uxn_opcodes_h_l1026_c7_d86d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_d86d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_d86d_return_output := result_MUX_uxn_opcodes_h_l1026_c7_d86d_return_output;

     -- Submodule level 116
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_d961_iffalse := VAR_result_MUX_uxn_opcodes_h_l1026_c7_d86d_return_output;
     -- result_MUX[uxn_opcodes_h_l1025_c7_d961] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1025_c7_d961_cond <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_d961_cond;
     result_MUX_uxn_opcodes_h_l1025_c7_d961_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_d961_iftrue;
     result_MUX_uxn_opcodes_h_l1025_c7_d961_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_d961_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_d961_return_output := result_MUX_uxn_opcodes_h_l1025_c7_d961_return_output;

     -- Submodule level 117
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_4346_iffalse := VAR_result_MUX_uxn_opcodes_h_l1025_c7_d961_return_output;
     -- result_MUX[uxn_opcodes_h_l1024_c7_4346] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1024_c7_4346_cond <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_4346_cond;
     result_MUX_uxn_opcodes_h_l1024_c7_4346_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_4346_iftrue;
     result_MUX_uxn_opcodes_h_l1024_c7_4346_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_4346_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_4346_return_output := result_MUX_uxn_opcodes_h_l1024_c7_4346_return_output;

     -- Submodule level 118
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_7adc_iffalse := VAR_result_MUX_uxn_opcodes_h_l1024_c7_4346_return_output;
     -- result_MUX[uxn_opcodes_h_l1023_c7_7adc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1023_c7_7adc_cond <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_7adc_cond;
     result_MUX_uxn_opcodes_h_l1023_c7_7adc_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_7adc_iftrue;
     result_MUX_uxn_opcodes_h_l1023_c7_7adc_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_7adc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_7adc_return_output := result_MUX_uxn_opcodes_h_l1023_c7_7adc_return_output;

     -- Submodule level 119
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_e6ee_iffalse := VAR_result_MUX_uxn_opcodes_h_l1023_c7_7adc_return_output;
     -- result_MUX[uxn_opcodes_h_l1022_c7_e6ee] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1022_c7_e6ee_cond <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_e6ee_cond;
     result_MUX_uxn_opcodes_h_l1022_c7_e6ee_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_e6ee_iftrue;
     result_MUX_uxn_opcodes_h_l1022_c7_e6ee_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_e6ee_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_e6ee_return_output := result_MUX_uxn_opcodes_h_l1022_c7_e6ee_return_output;

     -- Submodule level 120
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_aab0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1022_c7_e6ee_return_output;
     -- result_MUX[uxn_opcodes_h_l1021_c7_aab0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1021_c7_aab0_cond <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_aab0_cond;
     result_MUX_uxn_opcodes_h_l1021_c7_aab0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_aab0_iftrue;
     result_MUX_uxn_opcodes_h_l1021_c7_aab0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_aab0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_aab0_return_output := result_MUX_uxn_opcodes_h_l1021_c7_aab0_return_output;

     -- Submodule level 121
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_44ea_iffalse := VAR_result_MUX_uxn_opcodes_h_l1021_c7_aab0_return_output;
     -- result_MUX[uxn_opcodes_h_l1020_c7_44ea] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1020_c7_44ea_cond <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_44ea_cond;
     result_MUX_uxn_opcodes_h_l1020_c7_44ea_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_44ea_iftrue;
     result_MUX_uxn_opcodes_h_l1020_c7_44ea_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_44ea_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_44ea_return_output := result_MUX_uxn_opcodes_h_l1020_c7_44ea_return_output;

     -- Submodule level 122
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_c4ef_iffalse := VAR_result_MUX_uxn_opcodes_h_l1020_c7_44ea_return_output;
     -- result_MUX[uxn_opcodes_h_l1019_c7_c4ef] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1019_c7_c4ef_cond <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_c4ef_cond;
     result_MUX_uxn_opcodes_h_l1019_c7_c4ef_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_c4ef_iftrue;
     result_MUX_uxn_opcodes_h_l1019_c7_c4ef_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_c4ef_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_c4ef_return_output := result_MUX_uxn_opcodes_h_l1019_c7_c4ef_return_output;

     -- Submodule level 123
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_4769_iffalse := VAR_result_MUX_uxn_opcodes_h_l1019_c7_c4ef_return_output;
     -- result_MUX[uxn_opcodes_h_l1018_c7_4769] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1018_c7_4769_cond <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_4769_cond;
     result_MUX_uxn_opcodes_h_l1018_c7_4769_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_4769_iftrue;
     result_MUX_uxn_opcodes_h_l1018_c7_4769_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_4769_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_4769_return_output := result_MUX_uxn_opcodes_h_l1018_c7_4769_return_output;

     -- Submodule level 124
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_dfe5_iffalse := VAR_result_MUX_uxn_opcodes_h_l1018_c7_4769_return_output;
     -- result_MUX[uxn_opcodes_h_l1017_c7_dfe5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1017_c7_dfe5_cond <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_dfe5_cond;
     result_MUX_uxn_opcodes_h_l1017_c7_dfe5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_dfe5_iftrue;
     result_MUX_uxn_opcodes_h_l1017_c7_dfe5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_dfe5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_dfe5_return_output := result_MUX_uxn_opcodes_h_l1017_c7_dfe5_return_output;

     -- Submodule level 125
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_beeb_iffalse := VAR_result_MUX_uxn_opcodes_h_l1017_c7_dfe5_return_output;
     -- result_MUX[uxn_opcodes_h_l1016_c7_beeb] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1016_c7_beeb_cond <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_beeb_cond;
     result_MUX_uxn_opcodes_h_l1016_c7_beeb_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_beeb_iftrue;
     result_MUX_uxn_opcodes_h_l1016_c7_beeb_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_beeb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_beeb_return_output := result_MUX_uxn_opcodes_h_l1016_c7_beeb_return_output;

     -- Submodule level 126
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_f040_iffalse := VAR_result_MUX_uxn_opcodes_h_l1016_c7_beeb_return_output;
     -- result_MUX[uxn_opcodes_h_l1015_c7_f040] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1015_c7_f040_cond <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_f040_cond;
     result_MUX_uxn_opcodes_h_l1015_c7_f040_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_f040_iftrue;
     result_MUX_uxn_opcodes_h_l1015_c7_f040_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_f040_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_f040_return_output := result_MUX_uxn_opcodes_h_l1015_c7_f040_return_output;

     -- Submodule level 127
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_6c5b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1015_c7_f040_return_output;
     -- result_MUX[uxn_opcodes_h_l1014_c7_6c5b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1014_c7_6c5b_cond <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_6c5b_cond;
     result_MUX_uxn_opcodes_h_l1014_c7_6c5b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_6c5b_iftrue;
     result_MUX_uxn_opcodes_h_l1014_c7_6c5b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_6c5b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_6c5b_return_output := result_MUX_uxn_opcodes_h_l1014_c7_6c5b_return_output;

     -- Submodule level 128
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_fde3_iffalse := VAR_result_MUX_uxn_opcodes_h_l1014_c7_6c5b_return_output;
     -- result_MUX[uxn_opcodes_h_l1013_c7_fde3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1013_c7_fde3_cond <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_fde3_cond;
     result_MUX_uxn_opcodes_h_l1013_c7_fde3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_fde3_iftrue;
     result_MUX_uxn_opcodes_h_l1013_c7_fde3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_fde3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_fde3_return_output := result_MUX_uxn_opcodes_h_l1013_c7_fde3_return_output;

     -- Submodule level 129
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_b1e0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1013_c7_fde3_return_output;
     -- result_MUX[uxn_opcodes_h_l1012_c7_b1e0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1012_c7_b1e0_cond <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_b1e0_cond;
     result_MUX_uxn_opcodes_h_l1012_c7_b1e0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_b1e0_iftrue;
     result_MUX_uxn_opcodes_h_l1012_c7_b1e0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_b1e0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_b1e0_return_output := result_MUX_uxn_opcodes_h_l1012_c7_b1e0_return_output;

     -- Submodule level 130
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_bd86_iffalse := VAR_result_MUX_uxn_opcodes_h_l1012_c7_b1e0_return_output;
     -- result_MUX[uxn_opcodes_h_l1011_c7_bd86] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1011_c7_bd86_cond <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_bd86_cond;
     result_MUX_uxn_opcodes_h_l1011_c7_bd86_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_bd86_iftrue;
     result_MUX_uxn_opcodes_h_l1011_c7_bd86_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_bd86_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_bd86_return_output := result_MUX_uxn_opcodes_h_l1011_c7_bd86_return_output;

     -- Submodule level 131
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_8bb9_iffalse := VAR_result_MUX_uxn_opcodes_h_l1011_c7_bd86_return_output;
     -- result_MUX[uxn_opcodes_h_l1010_c7_8bb9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1010_c7_8bb9_cond <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_8bb9_cond;
     result_MUX_uxn_opcodes_h_l1010_c7_8bb9_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_8bb9_iftrue;
     result_MUX_uxn_opcodes_h_l1010_c7_8bb9_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_8bb9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_8bb9_return_output := result_MUX_uxn_opcodes_h_l1010_c7_8bb9_return_output;

     -- Submodule level 132
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_a1a7_iffalse := VAR_result_MUX_uxn_opcodes_h_l1010_c7_8bb9_return_output;
     -- result_MUX[uxn_opcodes_h_l1009_c7_a1a7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1009_c7_a1a7_cond <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_a1a7_cond;
     result_MUX_uxn_opcodes_h_l1009_c7_a1a7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_a1a7_iftrue;
     result_MUX_uxn_opcodes_h_l1009_c7_a1a7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_a1a7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_a1a7_return_output := result_MUX_uxn_opcodes_h_l1009_c7_a1a7_return_output;

     -- Submodule level 133
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_526d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1009_c7_a1a7_return_output;
     -- result_MUX[uxn_opcodes_h_l1008_c7_526d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1008_c7_526d_cond <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_526d_cond;
     result_MUX_uxn_opcodes_h_l1008_c7_526d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_526d_iftrue;
     result_MUX_uxn_opcodes_h_l1008_c7_526d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_526d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_526d_return_output := result_MUX_uxn_opcodes_h_l1008_c7_526d_return_output;

     -- Submodule level 134
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_9f80_iffalse := VAR_result_MUX_uxn_opcodes_h_l1008_c7_526d_return_output;
     -- result_MUX[uxn_opcodes_h_l1007_c7_9f80] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1007_c7_9f80_cond <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_9f80_cond;
     result_MUX_uxn_opcodes_h_l1007_c7_9f80_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_9f80_iftrue;
     result_MUX_uxn_opcodes_h_l1007_c7_9f80_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_9f80_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_9f80_return_output := result_MUX_uxn_opcodes_h_l1007_c7_9f80_return_output;

     -- Submodule level 135
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_af65_iffalse := VAR_result_MUX_uxn_opcodes_h_l1007_c7_9f80_return_output;
     -- result_MUX[uxn_opcodes_h_l1006_c7_af65] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1006_c7_af65_cond <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_af65_cond;
     result_MUX_uxn_opcodes_h_l1006_c7_af65_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_af65_iftrue;
     result_MUX_uxn_opcodes_h_l1006_c7_af65_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_af65_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_af65_return_output := result_MUX_uxn_opcodes_h_l1006_c7_af65_return_output;

     -- Submodule level 136
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_04b3_iffalse := VAR_result_MUX_uxn_opcodes_h_l1006_c7_af65_return_output;
     -- result_MUX[uxn_opcodes_h_l1005_c7_04b3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1005_c7_04b3_cond <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_04b3_cond;
     result_MUX_uxn_opcodes_h_l1005_c7_04b3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_04b3_iftrue;
     result_MUX_uxn_opcodes_h_l1005_c7_04b3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_04b3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_04b3_return_output := result_MUX_uxn_opcodes_h_l1005_c7_04b3_return_output;

     -- Submodule level 137
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_5e95_iffalse := VAR_result_MUX_uxn_opcodes_h_l1005_c7_04b3_return_output;
     -- result_MUX[uxn_opcodes_h_l1004_c7_5e95] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1004_c7_5e95_cond <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_5e95_cond;
     result_MUX_uxn_opcodes_h_l1004_c7_5e95_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_5e95_iftrue;
     result_MUX_uxn_opcodes_h_l1004_c7_5e95_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_5e95_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_5e95_return_output := result_MUX_uxn_opcodes_h_l1004_c7_5e95_return_output;

     -- Submodule level 138
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_5b9e_iffalse := VAR_result_MUX_uxn_opcodes_h_l1004_c7_5e95_return_output;
     -- result_MUX[uxn_opcodes_h_l1003_c7_5b9e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1003_c7_5b9e_cond <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_5b9e_cond;
     result_MUX_uxn_opcodes_h_l1003_c7_5b9e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_5b9e_iftrue;
     result_MUX_uxn_opcodes_h_l1003_c7_5b9e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_5b9e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_5b9e_return_output := result_MUX_uxn_opcodes_h_l1003_c7_5b9e_return_output;

     -- Submodule level 139
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_82d3_iffalse := VAR_result_MUX_uxn_opcodes_h_l1003_c7_5b9e_return_output;
     -- result_MUX[uxn_opcodes_h_l1002_c7_82d3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1002_c7_82d3_cond <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_82d3_cond;
     result_MUX_uxn_opcodes_h_l1002_c7_82d3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_82d3_iftrue;
     result_MUX_uxn_opcodes_h_l1002_c7_82d3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_82d3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_82d3_return_output := result_MUX_uxn_opcodes_h_l1002_c7_82d3_return_output;

     -- Submodule level 140
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_5059_iffalse := VAR_result_MUX_uxn_opcodes_h_l1002_c7_82d3_return_output;
     -- result_MUX[uxn_opcodes_h_l1001_c7_5059] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1001_c7_5059_cond <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_5059_cond;
     result_MUX_uxn_opcodes_h_l1001_c7_5059_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_5059_iftrue;
     result_MUX_uxn_opcodes_h_l1001_c7_5059_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_5059_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_5059_return_output := result_MUX_uxn_opcodes_h_l1001_c7_5059_return_output;

     -- Submodule level 141
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_7834_iffalse := VAR_result_MUX_uxn_opcodes_h_l1001_c7_5059_return_output;
     -- result_MUX[uxn_opcodes_h_l1000_c2_7834] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1000_c2_7834_cond <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_7834_cond;
     result_MUX_uxn_opcodes_h_l1000_c2_7834_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_7834_iftrue;
     result_MUX_uxn_opcodes_h_l1000_c2_7834_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_7834_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_7834_return_output := result_MUX_uxn_opcodes_h_l1000_c2_7834_return_output;

     -- Submodule level 142
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l1000_c2_7834_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l1000_c2_7834_return_output;
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
