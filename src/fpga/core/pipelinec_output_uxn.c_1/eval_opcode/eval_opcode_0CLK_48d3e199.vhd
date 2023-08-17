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
entity eval_opcode_0CLK_48d3e199 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 opcode : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end eval_opcode_0CLK_48d3e199;
architecture arch of eval_opcode_0CLK_48d3e199 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_ba33]
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_7499]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1000_c2_3295]
signal result_MUX_uxn_opcodes_h_l1000_c2_3295_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_3295_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_3295_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_3295_return_output : unsigned(0 downto 0);

-- opc_brk[uxn_opcodes_h_l1000_c34_0bb7]
signal opc_brk_uxn_opcodes_h_l1000_c34_0bb7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_b535]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_72a5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_6f36]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1001_c7_7499]
signal result_MUX_uxn_opcodes_h_l1001_c7_7499_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_7499_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_7499_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_7499_return_output : unsigned(0 downto 0);

-- opc_jci[uxn_opcodes_h_l1001_c39_f224]
signal opc_jci_uxn_opcodes_h_l1001_c39_f224_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_f224_stack_index : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_f224_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_bc96]
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_ef4e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_cde3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1002_c7_6f36]
signal result_MUX_uxn_opcodes_h_l1002_c7_6f36_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_6f36_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_6f36_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_6f36_return_output : unsigned(0 downto 0);

-- opc_jmi[uxn_opcodes_h_l1002_c39_0549]
signal opc_jmi_uxn_opcodes_h_l1002_c39_0549_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmi_uxn_opcodes_h_l1002_c39_0549_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_9b98]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_d330]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_2368]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1003_c7_cde3]
signal result_MUX_uxn_opcodes_h_l1003_c7_cde3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_cde3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_cde3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_cde3_return_output : unsigned(0 downto 0);

-- opc_jsi[uxn_opcodes_h_l1003_c39_9d7c]
signal opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_ins : unsigned(7 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_73c7]
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_1d4f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_f48a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1004_c7_2368]
signal result_MUX_uxn_opcodes_h_l1004_c7_2368_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_2368_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_2368_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_2368_return_output : unsigned(0 downto 0);

-- opc_lit[uxn_opcodes_h_l1004_c39_a53f]
signal opc_lit_uxn_opcodes_h_l1004_c39_a53f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_a53f_stack_index : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_a53f_ins : unsigned(7 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_a53f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_09a9]
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_4daa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_30fd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1005_c7_f48a]
signal result_MUX_uxn_opcodes_h_l1005_c7_f48a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_f48a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_f48a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_f48a_return_output : unsigned(0 downto 0);

-- opc_lit2[uxn_opcodes_h_l1005_c39_dcc8]
signal opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_stack_index : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_ins : unsigned(7 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_5c07]
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_632d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_72aa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1006_c7_30fd]
signal result_MUX_uxn_opcodes_h_l1006_c7_30fd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_30fd_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_30fd_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_30fd_return_output : unsigned(0 downto 0);

-- opc_litr[uxn_opcodes_h_l1006_c39_36be]
signal opc_litr_uxn_opcodes_h_l1006_c39_36be_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_36be_stack_index : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_36be_ins : unsigned(7 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_36be_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_744d]
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_942d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_879d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1007_c7_72aa]
signal result_MUX_uxn_opcodes_h_l1007_c7_72aa_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_72aa_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_72aa_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_72aa_return_output : unsigned(0 downto 0);

-- opc_lit2r[uxn_opcodes_h_l1007_c39_807f]
signal opc_lit2r_uxn_opcodes_h_l1007_c39_807f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_807f_stack_index : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_807f_ins : unsigned(7 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_807f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_9748]
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_e1b1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_9260]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1008_c7_879d]
signal result_MUX_uxn_opcodes_h_l1008_c7_879d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_879d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_879d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_879d_return_output : unsigned(0 downto 0);

-- opc_inc[uxn_opcodes_h_l1008_c39_680e]
signal opc_inc_uxn_opcodes_h_l1008_c39_680e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_680e_stack_index : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_680e_ins : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_680e_k : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_680e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_1210]
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_387e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_8ad9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1009_c7_9260]
signal result_MUX_uxn_opcodes_h_l1009_c7_9260_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_9260_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_9260_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_9260_return_output : unsigned(0 downto 0);

-- opc_inc2[uxn_opcodes_h_l1009_c39_b7c5]
signal opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_stack_index : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_ins : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_k : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_9635]
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_f4d8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_c4c9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1010_c7_8ad9]
signal result_MUX_uxn_opcodes_h_l1010_c7_8ad9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_8ad9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_8ad9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_8ad9_return_output : unsigned(0 downto 0);

-- opc_pop[uxn_opcodes_h_l1010_c39_1668]
signal opc_pop_uxn_opcodes_h_l1010_c39_1668_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_1668_stack_index : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_1668_ins : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_1668_k : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_1668_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_65a3]
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_bb6f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_78a9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1011_c7_c4c9]
signal result_MUX_uxn_opcodes_h_l1011_c7_c4c9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_c4c9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_c4c9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_c4c9_return_output : unsigned(0 downto 0);

-- opc_pop2[uxn_opcodes_h_l1011_c39_4f95]
signal opc_pop2_uxn_opcodes_h_l1011_c39_4f95_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_4f95_stack_index : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_4f95_ins : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_4f95_k : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_4f95_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_2169]
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_62d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_5abc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1012_c7_78a9]
signal result_MUX_uxn_opcodes_h_l1012_c7_78a9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_78a9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_78a9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_78a9_return_output : unsigned(0 downto 0);

-- opc_nip[uxn_opcodes_h_l1012_c39_f23d]
signal opc_nip_uxn_opcodes_h_l1012_c39_f23d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_f23d_stack_index : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_f23d_ins : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_f23d_k : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_f23d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_71fa]
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_38a8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_d146]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1013_c7_5abc]
signal result_MUX_uxn_opcodes_h_l1013_c7_5abc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_5abc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_5abc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_5abc_return_output : unsigned(0 downto 0);

-- opc_nip2[uxn_opcodes_h_l1013_c39_86b9]
signal opc_nip2_uxn_opcodes_h_l1013_c39_86b9_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_86b9_stack_index : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_86b9_ins : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_86b9_k : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_86b9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_55d0]
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_27a1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_307c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1014_c7_d146]
signal result_MUX_uxn_opcodes_h_l1014_c7_d146_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_d146_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_d146_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_d146_return_output : unsigned(0 downto 0);

-- opc_swp[uxn_opcodes_h_l1014_c39_6057]
signal opc_swp_uxn_opcodes_h_l1014_c39_6057_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_6057_stack_index : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_6057_ins : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_6057_k : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_6057_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_55b3]
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_937e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_814a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1015_c7_307c]
signal result_MUX_uxn_opcodes_h_l1015_c7_307c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_307c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_307c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_307c_return_output : unsigned(0 downto 0);

-- opc_swp2[uxn_opcodes_h_l1015_c39_f047]
signal opc_swp2_uxn_opcodes_h_l1015_c39_f047_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_f047_stack_index : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_f047_ins : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_f047_k : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_f047_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_9350]
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_1fba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_2599]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1016_c7_814a]
signal result_MUX_uxn_opcodes_h_l1016_c7_814a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_814a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_814a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_814a_return_output : unsigned(0 downto 0);

-- opc_rot[uxn_opcodes_h_l1016_c39_6ee8]
signal opc_rot_uxn_opcodes_h_l1016_c39_6ee8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_6ee8_stack_index : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_6ee8_ins : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_6ee8_k : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_6ee8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_b0e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_fc48]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_7852]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1017_c7_2599]
signal result_MUX_uxn_opcodes_h_l1017_c7_2599_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_2599_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_2599_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_2599_return_output : unsigned(0 downto 0);

-- opc_rot2[uxn_opcodes_h_l1017_c39_a43a]
signal opc_rot2_uxn_opcodes_h_l1017_c39_a43a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_a43a_stack_index : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_a43a_ins : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_a43a_k : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_a43a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_7754]
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_9997]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_3567]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1018_c7_7852]
signal result_MUX_uxn_opcodes_h_l1018_c7_7852_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_7852_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_7852_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_7852_return_output : unsigned(0 downto 0);

-- opc_dup[uxn_opcodes_h_l1018_c39_ed1c]
signal opc_dup_uxn_opcodes_h_l1018_c39_ed1c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_ed1c_stack_index : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_ed1c_ins : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_ed1c_k : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_ed1c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_9c24]
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_50af]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_8e81]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1019_c7_3567]
signal result_MUX_uxn_opcodes_h_l1019_c7_3567_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_3567_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_3567_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_3567_return_output : unsigned(0 downto 0);

-- opc_dup2[uxn_opcodes_h_l1019_c39_79f2]
signal opc_dup2_uxn_opcodes_h_l1019_c39_79f2_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_79f2_stack_index : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_79f2_ins : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_79f2_k : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_79f2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_3742]
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_125d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_0ef7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1020_c7_8e81]
signal result_MUX_uxn_opcodes_h_l1020_c7_8e81_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_8e81_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_8e81_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_8e81_return_output : unsigned(0 downto 0);

-- opc_ovr[uxn_opcodes_h_l1020_c39_8e77]
signal opc_ovr_uxn_opcodes_h_l1020_c39_8e77_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_8e77_stack_index : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_8e77_ins : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_8e77_k : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_8e77_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_c8f8]
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_9711]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_b2f3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1021_c7_0ef7]
signal result_MUX_uxn_opcodes_h_l1021_c7_0ef7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_0ef7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_0ef7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_0ef7_return_output : unsigned(0 downto 0);

-- opc_ovr2[uxn_opcodes_h_l1021_c39_90a5]
signal opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_stack_index : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_ins : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_k : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_0ee8]
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_4c15]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_2922]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1022_c7_b2f3]
signal result_MUX_uxn_opcodes_h_l1022_c7_b2f3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_b2f3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_b2f3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_b2f3_return_output : unsigned(0 downto 0);

-- opc_equ[uxn_opcodes_h_l1022_c39_036f]
signal opc_equ_uxn_opcodes_h_l1022_c39_036f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_036f_stack_index : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_036f_ins : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_036f_k : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_036f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_43c9]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_5101]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_b3fa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1023_c7_2922]
signal result_MUX_uxn_opcodes_h_l1023_c7_2922_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_2922_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_2922_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_2922_return_output : unsigned(0 downto 0);

-- opc_equ2[uxn_opcodes_h_l1023_c39_ea78]
signal opc_equ2_uxn_opcodes_h_l1023_c39_ea78_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_ea78_stack_index : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_ea78_ins : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_ea78_k : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_ea78_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_0536]
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_6844]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_c74f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1024_c7_b3fa]
signal result_MUX_uxn_opcodes_h_l1024_c7_b3fa_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_b3fa_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_b3fa_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_b3fa_return_output : unsigned(0 downto 0);

-- opc_neq[uxn_opcodes_h_l1024_c39_e004]
signal opc_neq_uxn_opcodes_h_l1024_c39_e004_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_e004_stack_index : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_e004_ins : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_e004_k : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_e004_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_df84]
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_dd28]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_9a91]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1025_c7_c74f]
signal result_MUX_uxn_opcodes_h_l1025_c7_c74f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_c74f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_c74f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_c74f_return_output : unsigned(0 downto 0);

-- opc_neq2[uxn_opcodes_h_l1025_c39_e04e]
signal opc_neq2_uxn_opcodes_h_l1025_c39_e04e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_e04e_stack_index : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_e04e_ins : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_e04e_k : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_e04e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_345c]
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_4b14]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_ca1b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1026_c7_9a91]
signal result_MUX_uxn_opcodes_h_l1026_c7_9a91_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_9a91_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_9a91_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_9a91_return_output : unsigned(0 downto 0);

-- opc_gth[uxn_opcodes_h_l1026_c39_fd76]
signal opc_gth_uxn_opcodes_h_l1026_c39_fd76_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_fd76_stack_index : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_fd76_ins : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_fd76_k : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_fd76_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_3bc5]
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_fc73]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_462f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1027_c7_ca1b]
signal result_MUX_uxn_opcodes_h_l1027_c7_ca1b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_ca1b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_ca1b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_ca1b_return_output : unsigned(0 downto 0);

-- opc_gth2[uxn_opcodes_h_l1027_c39_c423]
signal opc_gth2_uxn_opcodes_h_l1027_c39_c423_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_c423_stack_index : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_c423_ins : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_c423_k : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_c423_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_9e19]
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_315d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_7b7b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1028_c7_462f]
signal result_MUX_uxn_opcodes_h_l1028_c7_462f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_462f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_462f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_462f_return_output : unsigned(0 downto 0);

-- opc_lth[uxn_opcodes_h_l1028_c39_a09a]
signal opc_lth_uxn_opcodes_h_l1028_c39_a09a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_a09a_stack_index : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_a09a_ins : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_a09a_k : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_a09a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_8be8]
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_58e7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_4804]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1029_c7_7b7b]
signal result_MUX_uxn_opcodes_h_l1029_c7_7b7b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_7b7b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_7b7b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_7b7b_return_output : unsigned(0 downto 0);

-- opc_lth2[uxn_opcodes_h_l1029_c39_b2cb]
signal opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_stack_index : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_ins : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_k : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_114b]
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_e5c5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_273d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1030_c7_4804]
signal result_MUX_uxn_opcodes_h_l1030_c7_4804_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_4804_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_4804_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_4804_return_output : unsigned(0 downto 0);

-- opc_jmp[uxn_opcodes_h_l1030_c39_00ca]
signal opc_jmp_uxn_opcodes_h_l1030_c39_00ca_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_00ca_stack_index : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_00ca_ins : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_00ca_k : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_00ca_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_6291]
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_80eb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_2296]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1031_c7_273d]
signal result_MUX_uxn_opcodes_h_l1031_c7_273d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_273d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_273d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_273d_return_output : unsigned(0 downto 0);

-- opc_jmp2[uxn_opcodes_h_l1031_c39_92d8]
signal opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_stack_index : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_ins : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_k : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_c84f]
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_4ee8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_51d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1032_c7_2296]
signal result_MUX_uxn_opcodes_h_l1032_c7_2296_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_2296_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_2296_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_2296_return_output : unsigned(0 downto 0);

-- opc_jcn[uxn_opcodes_h_l1032_c39_749e]
signal opc_jcn_uxn_opcodes_h_l1032_c39_749e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_749e_stack_index : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_749e_ins : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_749e_k : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_749e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_7437]
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_16a5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_aced]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1033_c7_51d1]
signal result_MUX_uxn_opcodes_h_l1033_c7_51d1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_51d1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_51d1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_51d1_return_output : unsigned(0 downto 0);

-- opc_jcn2[uxn_opcodes_h_l1033_c39_5568]
signal opc_jcn2_uxn_opcodes_h_l1033_c39_5568_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_5568_stack_index : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_5568_ins : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_5568_k : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_5568_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_029f]
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_78f3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_2527]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1034_c7_aced]
signal result_MUX_uxn_opcodes_h_l1034_c7_aced_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_aced_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_aced_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_aced_return_output : unsigned(0 downto 0);

-- opc_jsr[uxn_opcodes_h_l1034_c39_8fb6]
signal opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_stack_index : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_ins : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_k : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_7f17]
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_d2d2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_921a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1035_c7_2527]
signal result_MUX_uxn_opcodes_h_l1035_c7_2527_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_2527_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_2527_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_2527_return_output : unsigned(0 downto 0);

-- opc_jsr2[uxn_opcodes_h_l1035_c39_d17e]
signal opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_stack_index : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_ins : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_k : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_1819]
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_d4f2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_a56a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1036_c7_921a]
signal result_MUX_uxn_opcodes_h_l1036_c7_921a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_921a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_921a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_921a_return_output : unsigned(0 downto 0);

-- opc_sth[uxn_opcodes_h_l1036_c39_b171]
signal opc_sth_uxn_opcodes_h_l1036_c39_b171_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_b171_stack_index : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_b171_ins : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_b171_k : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_b171_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_3ff5]
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_4b53]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_c06d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1037_c7_a56a]
signal result_MUX_uxn_opcodes_h_l1037_c7_a56a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_a56a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_a56a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_a56a_return_output : unsigned(0 downto 0);

-- opc_sth2[uxn_opcodes_h_l1037_c39_3575]
signal opc_sth2_uxn_opcodes_h_l1037_c39_3575_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_3575_stack_index : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_3575_ins : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_3575_k : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_3575_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_eef8]
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_c9d1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_3c6d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1038_c7_c06d]
signal result_MUX_uxn_opcodes_h_l1038_c7_c06d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_c06d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_c06d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_c06d_return_output : unsigned(0 downto 0);

-- opc_ldz[uxn_opcodes_h_l1038_c39_cf9b]
signal opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_stack_index : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_ins : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_k : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_87b3]
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_1415]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_8044]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1039_c7_3c6d]
signal result_MUX_uxn_opcodes_h_l1039_c7_3c6d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_3c6d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_3c6d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_3c6d_return_output : unsigned(0 downto 0);

-- opc_ldz2[uxn_opcodes_h_l1039_c39_d9b9]
signal opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_stack_index : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_ins : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_k : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_a3d0]
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_2506]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_7fd2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1040_c7_8044]
signal result_MUX_uxn_opcodes_h_l1040_c7_8044_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_8044_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_8044_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_8044_return_output : unsigned(0 downto 0);

-- opc_stz[uxn_opcodes_h_l1040_c39_4e7a]
signal opc_stz_uxn_opcodes_h_l1040_c39_4e7a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_4e7a_stack_index : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_4e7a_ins : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_4e7a_k : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_4e7a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_479f]
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_273b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_59b6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1041_c7_7fd2]
signal result_MUX_uxn_opcodes_h_l1041_c7_7fd2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_7fd2_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_7fd2_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_7fd2_return_output : unsigned(0 downto 0);

-- opc_stz2[uxn_opcodes_h_l1041_c39_c70c]
signal opc_stz2_uxn_opcodes_h_l1041_c39_c70c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_c70c_stack_index : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_c70c_ins : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_c70c_k : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_c70c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_bdd8]
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_3025]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_94cd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1042_c7_59b6]
signal result_MUX_uxn_opcodes_h_l1042_c7_59b6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_59b6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_59b6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_59b6_return_output : unsigned(0 downto 0);

-- opc_ldr[uxn_opcodes_h_l1042_c39_d0a6]
signal opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_stack_index : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_ins : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_k : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_a32d]
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_3950]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_bc59]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1043_c7_94cd]
signal result_MUX_uxn_opcodes_h_l1043_c7_94cd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_94cd_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_94cd_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_94cd_return_output : unsigned(0 downto 0);

-- opc_ldr2[uxn_opcodes_h_l1043_c39_c1e4]
signal opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_stack_index : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_ins : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_k : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_b286]
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_bc18]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_633b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1044_c7_bc59]
signal result_MUX_uxn_opcodes_h_l1044_c7_bc59_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_bc59_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_bc59_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_bc59_return_output : unsigned(0 downto 0);

-- opc_str[uxn_opcodes_h_l1044_c39_d36a]
signal opc_str_uxn_opcodes_h_l1044_c39_d36a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_d36a_stack_index : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_d36a_ins : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_d36a_k : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_d36a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_b317]
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_dd97]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_0b3d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1045_c7_633b]
signal result_MUX_uxn_opcodes_h_l1045_c7_633b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_633b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_633b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_633b_return_output : unsigned(0 downto 0);

-- opc_str2[uxn_opcodes_h_l1045_c39_ca6b]
signal opc_str2_uxn_opcodes_h_l1045_c39_ca6b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_ca6b_stack_index : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_ca6b_ins : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_ca6b_k : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_ca6b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_cb94]
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_c6f9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_a82c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1046_c7_0b3d]
signal result_MUX_uxn_opcodes_h_l1046_c7_0b3d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_0b3d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_0b3d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_0b3d_return_output : unsigned(0 downto 0);

-- opc_lda[uxn_opcodes_h_l1046_c39_ced1]
signal opc_lda_uxn_opcodes_h_l1046_c39_ced1_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_ced1_stack_index : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_ced1_ins : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_ced1_k : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_ced1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_26e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_d76b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_72e3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1047_c7_a82c]
signal result_MUX_uxn_opcodes_h_l1047_c7_a82c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_a82c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_a82c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_a82c_return_output : unsigned(0 downto 0);

-- opc_lda2[uxn_opcodes_h_l1047_c39_76a3]
signal opc_lda2_uxn_opcodes_h_l1047_c39_76a3_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_76a3_stack_index : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_76a3_ins : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_76a3_k : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_76a3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_c726]
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_d0bd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_9c56]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1048_c7_72e3]
signal result_MUX_uxn_opcodes_h_l1048_c7_72e3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_72e3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_72e3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_72e3_return_output : unsigned(0 downto 0);

-- opc_sta[uxn_opcodes_h_l1048_c39_051e]
signal opc_sta_uxn_opcodes_h_l1048_c39_051e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_051e_stack_index : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_051e_ins : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_051e_k : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_051e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_09b0]
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_b18a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_db9e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1049_c7_9c56]
signal result_MUX_uxn_opcodes_h_l1049_c7_9c56_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_9c56_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_9c56_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_9c56_return_output : unsigned(0 downto 0);

-- opc_sta2[uxn_opcodes_h_l1049_c39_2b32]
signal opc_sta2_uxn_opcodes_h_l1049_c39_2b32_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_2b32_stack_index : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_2b32_ins : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_2b32_k : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_2b32_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_74e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_3790]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_6b7e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1050_c7_db9e]
signal result_MUX_uxn_opcodes_h_l1050_c7_db9e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_db9e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_db9e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_db9e_return_output : unsigned(0 downto 0);

-- opc_dei[uxn_opcodes_h_l1050_c39_28e3]
signal opc_dei_uxn_opcodes_h_l1050_c39_28e3_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_28e3_stack_index : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_28e3_ins : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_28e3_k : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_28e3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_2004]
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_45bc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_bee1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1051_c7_6b7e]
signal result_MUX_uxn_opcodes_h_l1051_c7_6b7e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_6b7e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_6b7e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_6b7e_return_output : unsigned(0 downto 0);

-- opc_dei2[uxn_opcodes_h_l1051_c39_e46f]
signal opc_dei2_uxn_opcodes_h_l1051_c39_e46f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_e46f_stack_index : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_e46f_ins : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_e46f_k : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_e46f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_5542]
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_675b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_f2da]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1052_c7_bee1]
signal result_MUX_uxn_opcodes_h_l1052_c7_bee1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_bee1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_bee1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_bee1_return_output : unsigned(0 downto 0);

-- opc_deo[uxn_opcodes_h_l1052_c39_69b6]
signal opc_deo_uxn_opcodes_h_l1052_c39_69b6_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_69b6_stack_index : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_69b6_ins : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_69b6_k : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_69b6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_9ac1]
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_7514]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_35d8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1053_c7_f2da]
signal result_MUX_uxn_opcodes_h_l1053_c7_f2da_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_f2da_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_f2da_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_f2da_return_output : unsigned(0 downto 0);

-- opc_deo2[uxn_opcodes_h_l1053_c39_cc30]
signal opc_deo2_uxn_opcodes_h_l1053_c39_cc30_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_cc30_stack_index : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_cc30_ins : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_cc30_k : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_cc30_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_84ca]
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_a096]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_d1b7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1054_c7_35d8]
signal result_MUX_uxn_opcodes_h_l1054_c7_35d8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_35d8_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_35d8_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_35d8_return_output : unsigned(0 downto 0);

-- opc_add[uxn_opcodes_h_l1054_c39_c851]
signal opc_add_uxn_opcodes_h_l1054_c39_c851_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_c851_stack_index : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_c851_ins : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_c851_k : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_c851_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_f963]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_acf3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_a347]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1055_c7_d1b7]
signal result_MUX_uxn_opcodes_h_l1055_c7_d1b7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_d1b7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_d1b7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_d1b7_return_output : unsigned(0 downto 0);

-- opc_add2[uxn_opcodes_h_l1055_c39_61d6]
signal opc_add2_uxn_opcodes_h_l1055_c39_61d6_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_61d6_stack_index : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_61d6_ins : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_61d6_k : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_61d6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_cbec]
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_15cf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_d8d8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1056_c7_a347]
signal result_MUX_uxn_opcodes_h_l1056_c7_a347_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_a347_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_a347_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_a347_return_output : unsigned(0 downto 0);

-- opc_sub[uxn_opcodes_h_l1056_c39_9af1]
signal opc_sub_uxn_opcodes_h_l1056_c39_9af1_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_9af1_stack_index : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_9af1_ins : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_9af1_k : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_9af1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_a993]
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_92b3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_0436]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1057_c7_d8d8]
signal result_MUX_uxn_opcodes_h_l1057_c7_d8d8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_d8d8_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_d8d8_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_d8d8_return_output : unsigned(0 downto 0);

-- opc_sub2[uxn_opcodes_h_l1057_c39_699e]
signal opc_sub2_uxn_opcodes_h_l1057_c39_699e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_699e_stack_index : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_699e_ins : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_699e_k : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_699e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_cde5]
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_0348]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_d385]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1058_c7_0436]
signal result_MUX_uxn_opcodes_h_l1058_c7_0436_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_0436_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_0436_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_0436_return_output : unsigned(0 downto 0);

-- opc_mul[uxn_opcodes_h_l1058_c39_14bf]
signal opc_mul_uxn_opcodes_h_l1058_c39_14bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_14bf_stack_index : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_14bf_ins : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_14bf_k : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_14bf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_b337]
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_b39f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_310c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1059_c7_d385]
signal result_MUX_uxn_opcodes_h_l1059_c7_d385_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_d385_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_d385_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_d385_return_output : unsigned(0 downto 0);

-- opc_mul2[uxn_opcodes_h_l1059_c39_b2ff]
signal opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_stack_index : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_ins : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_k : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_7ee5]
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_cd2d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_76c7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1060_c7_310c]
signal result_MUX_uxn_opcodes_h_l1060_c7_310c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_310c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_310c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_310c_return_output : unsigned(0 downto 0);

-- opc_div[uxn_opcodes_h_l1060_c39_dec5]
signal opc_div_uxn_opcodes_h_l1060_c39_dec5_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_dec5_stack_index : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_dec5_ins : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_dec5_k : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_dec5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_733b]
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_920e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_e68d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1061_c7_76c7]
signal result_MUX_uxn_opcodes_h_l1061_c7_76c7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_76c7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_76c7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_76c7_return_output : unsigned(0 downto 0);

-- opc_div2[uxn_opcodes_h_l1061_c39_de16]
signal opc_div2_uxn_opcodes_h_l1061_c39_de16_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_de16_stack_index : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_de16_ins : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_de16_k : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_de16_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_0cb9]
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_8bdb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_b7b0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1062_c7_e68d]
signal result_MUX_uxn_opcodes_h_l1062_c7_e68d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_e68d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_e68d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_e68d_return_output : unsigned(0 downto 0);

-- opc_and[uxn_opcodes_h_l1062_c39_beee]
signal opc_and_uxn_opcodes_h_l1062_c39_beee_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_beee_stack_index : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_beee_ins : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_beee_k : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_beee_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_e960]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_13f2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_633b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1063_c7_b7b0]
signal result_MUX_uxn_opcodes_h_l1063_c7_b7b0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_b7b0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_b7b0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_b7b0_return_output : unsigned(0 downto 0);

-- opc_and2[uxn_opcodes_h_l1063_c39_a0e1]
signal opc_and2_uxn_opcodes_h_l1063_c39_a0e1_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_a0e1_stack_index : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_a0e1_ins : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_a0e1_k : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_a0e1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_1f8a]
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_1179]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_808b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1064_c7_633b]
signal result_MUX_uxn_opcodes_h_l1064_c7_633b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_633b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_633b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_633b_return_output : unsigned(0 downto 0);

-- opc_ora[uxn_opcodes_h_l1064_c39_ee70]
signal opc_ora_uxn_opcodes_h_l1064_c39_ee70_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_ee70_stack_index : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_ee70_ins : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_ee70_k : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_ee70_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_e758]
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_fabb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_cdb3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1065_c7_808b]
signal result_MUX_uxn_opcodes_h_l1065_c7_808b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_808b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_808b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_808b_return_output : unsigned(0 downto 0);

-- opc_ora2[uxn_opcodes_h_l1065_c39_a408]
signal opc_ora2_uxn_opcodes_h_l1065_c39_a408_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_a408_stack_index : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_a408_ins : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_a408_k : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_a408_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_4ffe]
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_4204]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_07f5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1066_c7_cdb3]
signal result_MUX_uxn_opcodes_h_l1066_c7_cdb3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_cdb3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_cdb3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_cdb3_return_output : unsigned(0 downto 0);

-- opc_eor[uxn_opcodes_h_l1066_c39_d395]
signal opc_eor_uxn_opcodes_h_l1066_c39_d395_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_d395_stack_index : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_d395_ins : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_d395_k : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_d395_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_d3d1]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_c819]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_41ea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1067_c7_07f5]
signal result_MUX_uxn_opcodes_h_l1067_c7_07f5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_07f5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_07f5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_07f5_return_output : unsigned(0 downto 0);

-- opc_eor2[uxn_opcodes_h_l1067_c39_9082]
signal opc_eor2_uxn_opcodes_h_l1067_c39_9082_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_9082_stack_index : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_9082_ins : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_9082_k : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_9082_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_3ec8]
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_964c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_5c66]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1068_c7_41ea]
signal result_MUX_uxn_opcodes_h_l1068_c7_41ea_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_41ea_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_41ea_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_41ea_return_output : unsigned(0 downto 0);

-- opc_sft[uxn_opcodes_h_l1068_c39_2250]
signal opc_sft_uxn_opcodes_h_l1068_c39_2250_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_2250_stack_index : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_2250_ins : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_2250_k : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_2250_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_162f]
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_a3ab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1069_c7_5c66]
signal result_MUX_uxn_opcodes_h_l1069_c7_5c66_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_5c66_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_5c66_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_5c66_return_output : unsigned(0 downto 0);

-- opc_sft2[uxn_opcodes_h_l1069_c39_1a77]
signal opc_sft2_uxn_opcodes_h_l1069_c39_1a77_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_1a77_stack_index : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_1a77_ins : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_1a77_k : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_1a77_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_left,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_right,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_return_output);

-- result_MUX_uxn_opcodes_h_l1000_c2_3295
result_MUX_uxn_opcodes_h_l1000_c2_3295 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1000_c2_3295_cond,
result_MUX_uxn_opcodes_h_l1000_c2_3295_iftrue,
result_MUX_uxn_opcodes_h_l1000_c2_3295_iffalse,
result_MUX_uxn_opcodes_h_l1000_c2_3295_return_output);

-- opc_brk_uxn_opcodes_h_l1000_c34_0bb7
opc_brk_uxn_opcodes_h_l1000_c34_0bb7 : entity work.opc_brk_0CLK_de264c78 port map (
opc_brk_uxn_opcodes_h_l1000_c34_0bb7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_return_output);

-- result_MUX_uxn_opcodes_h_l1001_c7_7499
result_MUX_uxn_opcodes_h_l1001_c7_7499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1001_c7_7499_cond,
result_MUX_uxn_opcodes_h_l1001_c7_7499_iftrue,
result_MUX_uxn_opcodes_h_l1001_c7_7499_iffalse,
result_MUX_uxn_opcodes_h_l1001_c7_7499_return_output);

-- opc_jci_uxn_opcodes_h_l1001_c39_f224
opc_jci_uxn_opcodes_h_l1001_c39_f224 : entity work.opc_jci_0CLK_5e87bcb8 port map (
clk,
opc_jci_uxn_opcodes_h_l1001_c39_f224_CLOCK_ENABLE,
opc_jci_uxn_opcodes_h_l1001_c39_f224_stack_index,
opc_jci_uxn_opcodes_h_l1001_c39_f224_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_left,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_right,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_return_output);

-- result_MUX_uxn_opcodes_h_l1002_c7_6f36
result_MUX_uxn_opcodes_h_l1002_c7_6f36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1002_c7_6f36_cond,
result_MUX_uxn_opcodes_h_l1002_c7_6f36_iftrue,
result_MUX_uxn_opcodes_h_l1002_c7_6f36_iffalse,
result_MUX_uxn_opcodes_h_l1002_c7_6f36_return_output);

-- opc_jmi_uxn_opcodes_h_l1002_c39_0549
opc_jmi_uxn_opcodes_h_l1002_c39_0549 : entity work.opc_jmi_0CLK_8329ae76 port map (
clk,
opc_jmi_uxn_opcodes_h_l1002_c39_0549_CLOCK_ENABLE,
opc_jmi_uxn_opcodes_h_l1002_c39_0549_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_return_output);

-- result_MUX_uxn_opcodes_h_l1003_c7_cde3
result_MUX_uxn_opcodes_h_l1003_c7_cde3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1003_c7_cde3_cond,
result_MUX_uxn_opcodes_h_l1003_c7_cde3_iftrue,
result_MUX_uxn_opcodes_h_l1003_c7_cde3_iffalse,
result_MUX_uxn_opcodes_h_l1003_c7_cde3_return_output);

-- opc_jsi_uxn_opcodes_h_l1003_c39_9d7c
opc_jsi_uxn_opcodes_h_l1003_c39_9d7c : entity work.opc_jsi_0CLK_398245e9 port map (
clk,
opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_CLOCK_ENABLE,
opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_ins,
opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_left,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_right,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_return_output);

-- result_MUX_uxn_opcodes_h_l1004_c7_2368
result_MUX_uxn_opcodes_h_l1004_c7_2368 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1004_c7_2368_cond,
result_MUX_uxn_opcodes_h_l1004_c7_2368_iftrue,
result_MUX_uxn_opcodes_h_l1004_c7_2368_iffalse,
result_MUX_uxn_opcodes_h_l1004_c7_2368_return_output);

-- opc_lit_uxn_opcodes_h_l1004_c39_a53f
opc_lit_uxn_opcodes_h_l1004_c39_a53f : entity work.opc_lit_0CLK_22ccf33b port map (
clk,
opc_lit_uxn_opcodes_h_l1004_c39_a53f_CLOCK_ENABLE,
opc_lit_uxn_opcodes_h_l1004_c39_a53f_stack_index,
opc_lit_uxn_opcodes_h_l1004_c39_a53f_ins,
opc_lit_uxn_opcodes_h_l1004_c39_a53f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_left,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_right,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_return_output);

-- result_MUX_uxn_opcodes_h_l1005_c7_f48a
result_MUX_uxn_opcodes_h_l1005_c7_f48a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1005_c7_f48a_cond,
result_MUX_uxn_opcodes_h_l1005_c7_f48a_iftrue,
result_MUX_uxn_opcodes_h_l1005_c7_f48a_iffalse,
result_MUX_uxn_opcodes_h_l1005_c7_f48a_return_output);

-- opc_lit2_uxn_opcodes_h_l1005_c39_dcc8
opc_lit2_uxn_opcodes_h_l1005_c39_dcc8 : entity work.opc_lit2_0CLK_c8a3fae9 port map (
clk,
opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_CLOCK_ENABLE,
opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_stack_index,
opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_ins,
opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_left,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_right,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_return_output);

-- result_MUX_uxn_opcodes_h_l1006_c7_30fd
result_MUX_uxn_opcodes_h_l1006_c7_30fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1006_c7_30fd_cond,
result_MUX_uxn_opcodes_h_l1006_c7_30fd_iftrue,
result_MUX_uxn_opcodes_h_l1006_c7_30fd_iffalse,
result_MUX_uxn_opcodes_h_l1006_c7_30fd_return_output);

-- opc_litr_uxn_opcodes_h_l1006_c39_36be
opc_litr_uxn_opcodes_h_l1006_c39_36be : entity work.opc_litr_0CLK_22ccf33b port map (
clk,
opc_litr_uxn_opcodes_h_l1006_c39_36be_CLOCK_ENABLE,
opc_litr_uxn_opcodes_h_l1006_c39_36be_stack_index,
opc_litr_uxn_opcodes_h_l1006_c39_36be_ins,
opc_litr_uxn_opcodes_h_l1006_c39_36be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_left,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_right,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_return_output);

-- result_MUX_uxn_opcodes_h_l1007_c7_72aa
result_MUX_uxn_opcodes_h_l1007_c7_72aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1007_c7_72aa_cond,
result_MUX_uxn_opcodes_h_l1007_c7_72aa_iftrue,
result_MUX_uxn_opcodes_h_l1007_c7_72aa_iffalse,
result_MUX_uxn_opcodes_h_l1007_c7_72aa_return_output);

-- opc_lit2r_uxn_opcodes_h_l1007_c39_807f
opc_lit2r_uxn_opcodes_h_l1007_c39_807f : entity work.opc_lit2r_0CLK_c8a3fae9 port map (
clk,
opc_lit2r_uxn_opcodes_h_l1007_c39_807f_CLOCK_ENABLE,
opc_lit2r_uxn_opcodes_h_l1007_c39_807f_stack_index,
opc_lit2r_uxn_opcodes_h_l1007_c39_807f_ins,
opc_lit2r_uxn_opcodes_h_l1007_c39_807f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_left,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_right,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_return_output);

-- result_MUX_uxn_opcodes_h_l1008_c7_879d
result_MUX_uxn_opcodes_h_l1008_c7_879d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1008_c7_879d_cond,
result_MUX_uxn_opcodes_h_l1008_c7_879d_iftrue,
result_MUX_uxn_opcodes_h_l1008_c7_879d_iffalse,
result_MUX_uxn_opcodes_h_l1008_c7_879d_return_output);

-- opc_inc_uxn_opcodes_h_l1008_c39_680e
opc_inc_uxn_opcodes_h_l1008_c39_680e : entity work.opc_inc_0CLK_ce634803 port map (
clk,
opc_inc_uxn_opcodes_h_l1008_c39_680e_CLOCK_ENABLE,
opc_inc_uxn_opcodes_h_l1008_c39_680e_stack_index,
opc_inc_uxn_opcodes_h_l1008_c39_680e_ins,
opc_inc_uxn_opcodes_h_l1008_c39_680e_k,
opc_inc_uxn_opcodes_h_l1008_c39_680e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_left,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_right,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_return_output);

-- result_MUX_uxn_opcodes_h_l1009_c7_9260
result_MUX_uxn_opcodes_h_l1009_c7_9260 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1009_c7_9260_cond,
result_MUX_uxn_opcodes_h_l1009_c7_9260_iftrue,
result_MUX_uxn_opcodes_h_l1009_c7_9260_iffalse,
result_MUX_uxn_opcodes_h_l1009_c7_9260_return_output);

-- opc_inc2_uxn_opcodes_h_l1009_c39_b7c5
opc_inc2_uxn_opcodes_h_l1009_c39_b7c5 : entity work.opc_inc2_0CLK_8d9312eb port map (
clk,
opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_CLOCK_ENABLE,
opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_stack_index,
opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_ins,
opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_k,
opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_left,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_right,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_return_output);

-- result_MUX_uxn_opcodes_h_l1010_c7_8ad9
result_MUX_uxn_opcodes_h_l1010_c7_8ad9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1010_c7_8ad9_cond,
result_MUX_uxn_opcodes_h_l1010_c7_8ad9_iftrue,
result_MUX_uxn_opcodes_h_l1010_c7_8ad9_iffalse,
result_MUX_uxn_opcodes_h_l1010_c7_8ad9_return_output);

-- opc_pop_uxn_opcodes_h_l1010_c39_1668
opc_pop_uxn_opcodes_h_l1010_c39_1668 : entity work.opc_pop_0CLK_8c0b86ae port map (
clk,
opc_pop_uxn_opcodes_h_l1010_c39_1668_CLOCK_ENABLE,
opc_pop_uxn_opcodes_h_l1010_c39_1668_stack_index,
opc_pop_uxn_opcodes_h_l1010_c39_1668_ins,
opc_pop_uxn_opcodes_h_l1010_c39_1668_k,
opc_pop_uxn_opcodes_h_l1010_c39_1668_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_left,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_right,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_return_output);

-- result_MUX_uxn_opcodes_h_l1011_c7_c4c9
result_MUX_uxn_opcodes_h_l1011_c7_c4c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1011_c7_c4c9_cond,
result_MUX_uxn_opcodes_h_l1011_c7_c4c9_iftrue,
result_MUX_uxn_opcodes_h_l1011_c7_c4c9_iffalse,
result_MUX_uxn_opcodes_h_l1011_c7_c4c9_return_output);

-- opc_pop2_uxn_opcodes_h_l1011_c39_4f95
opc_pop2_uxn_opcodes_h_l1011_c39_4f95 : entity work.opc_pop2_0CLK_8c0b86ae port map (
clk,
opc_pop2_uxn_opcodes_h_l1011_c39_4f95_CLOCK_ENABLE,
opc_pop2_uxn_opcodes_h_l1011_c39_4f95_stack_index,
opc_pop2_uxn_opcodes_h_l1011_c39_4f95_ins,
opc_pop2_uxn_opcodes_h_l1011_c39_4f95_k,
opc_pop2_uxn_opcodes_h_l1011_c39_4f95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_left,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_right,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_return_output);

-- result_MUX_uxn_opcodes_h_l1012_c7_78a9
result_MUX_uxn_opcodes_h_l1012_c7_78a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1012_c7_78a9_cond,
result_MUX_uxn_opcodes_h_l1012_c7_78a9_iftrue,
result_MUX_uxn_opcodes_h_l1012_c7_78a9_iffalse,
result_MUX_uxn_opcodes_h_l1012_c7_78a9_return_output);

-- opc_nip_uxn_opcodes_h_l1012_c39_f23d
opc_nip_uxn_opcodes_h_l1012_c39_f23d : entity work.opc_nip_0CLK_920a8842 port map (
clk,
opc_nip_uxn_opcodes_h_l1012_c39_f23d_CLOCK_ENABLE,
opc_nip_uxn_opcodes_h_l1012_c39_f23d_stack_index,
opc_nip_uxn_opcodes_h_l1012_c39_f23d_ins,
opc_nip_uxn_opcodes_h_l1012_c39_f23d_k,
opc_nip_uxn_opcodes_h_l1012_c39_f23d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_left,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_right,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_return_output);

-- result_MUX_uxn_opcodes_h_l1013_c7_5abc
result_MUX_uxn_opcodes_h_l1013_c7_5abc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1013_c7_5abc_cond,
result_MUX_uxn_opcodes_h_l1013_c7_5abc_iftrue,
result_MUX_uxn_opcodes_h_l1013_c7_5abc_iffalse,
result_MUX_uxn_opcodes_h_l1013_c7_5abc_return_output);

-- opc_nip2_uxn_opcodes_h_l1013_c39_86b9
opc_nip2_uxn_opcodes_h_l1013_c39_86b9 : entity work.opc_nip2_0CLK_96553693 port map (
clk,
opc_nip2_uxn_opcodes_h_l1013_c39_86b9_CLOCK_ENABLE,
opc_nip2_uxn_opcodes_h_l1013_c39_86b9_stack_index,
opc_nip2_uxn_opcodes_h_l1013_c39_86b9_ins,
opc_nip2_uxn_opcodes_h_l1013_c39_86b9_k,
opc_nip2_uxn_opcodes_h_l1013_c39_86b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_left,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_right,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_return_output);

-- result_MUX_uxn_opcodes_h_l1014_c7_d146
result_MUX_uxn_opcodes_h_l1014_c7_d146 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1014_c7_d146_cond,
result_MUX_uxn_opcodes_h_l1014_c7_d146_iftrue,
result_MUX_uxn_opcodes_h_l1014_c7_d146_iffalse,
result_MUX_uxn_opcodes_h_l1014_c7_d146_return_output);

-- opc_swp_uxn_opcodes_h_l1014_c39_6057
opc_swp_uxn_opcodes_h_l1014_c39_6057 : entity work.opc_swp_0CLK_df440f49 port map (
clk,
opc_swp_uxn_opcodes_h_l1014_c39_6057_CLOCK_ENABLE,
opc_swp_uxn_opcodes_h_l1014_c39_6057_stack_index,
opc_swp_uxn_opcodes_h_l1014_c39_6057_ins,
opc_swp_uxn_opcodes_h_l1014_c39_6057_k,
opc_swp_uxn_opcodes_h_l1014_c39_6057_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_left,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_right,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_return_output);

-- result_MUX_uxn_opcodes_h_l1015_c7_307c
result_MUX_uxn_opcodes_h_l1015_c7_307c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1015_c7_307c_cond,
result_MUX_uxn_opcodes_h_l1015_c7_307c_iftrue,
result_MUX_uxn_opcodes_h_l1015_c7_307c_iffalse,
result_MUX_uxn_opcodes_h_l1015_c7_307c_return_output);

-- opc_swp2_uxn_opcodes_h_l1015_c39_f047
opc_swp2_uxn_opcodes_h_l1015_c39_f047 : entity work.opc_swp2_0CLK_926a773a port map (
clk,
opc_swp2_uxn_opcodes_h_l1015_c39_f047_CLOCK_ENABLE,
opc_swp2_uxn_opcodes_h_l1015_c39_f047_stack_index,
opc_swp2_uxn_opcodes_h_l1015_c39_f047_ins,
opc_swp2_uxn_opcodes_h_l1015_c39_f047_k,
opc_swp2_uxn_opcodes_h_l1015_c39_f047_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_left,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_right,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_return_output);

-- result_MUX_uxn_opcodes_h_l1016_c7_814a
result_MUX_uxn_opcodes_h_l1016_c7_814a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1016_c7_814a_cond,
result_MUX_uxn_opcodes_h_l1016_c7_814a_iftrue,
result_MUX_uxn_opcodes_h_l1016_c7_814a_iffalse,
result_MUX_uxn_opcodes_h_l1016_c7_814a_return_output);

-- opc_rot_uxn_opcodes_h_l1016_c39_6ee8
opc_rot_uxn_opcodes_h_l1016_c39_6ee8 : entity work.opc_rot_0CLK_2b6aba52 port map (
clk,
opc_rot_uxn_opcodes_h_l1016_c39_6ee8_CLOCK_ENABLE,
opc_rot_uxn_opcodes_h_l1016_c39_6ee8_stack_index,
opc_rot_uxn_opcodes_h_l1016_c39_6ee8_ins,
opc_rot_uxn_opcodes_h_l1016_c39_6ee8_k,
opc_rot_uxn_opcodes_h_l1016_c39_6ee8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_return_output);

-- result_MUX_uxn_opcodes_h_l1017_c7_2599
result_MUX_uxn_opcodes_h_l1017_c7_2599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1017_c7_2599_cond,
result_MUX_uxn_opcodes_h_l1017_c7_2599_iftrue,
result_MUX_uxn_opcodes_h_l1017_c7_2599_iffalse,
result_MUX_uxn_opcodes_h_l1017_c7_2599_return_output);

-- opc_rot2_uxn_opcodes_h_l1017_c39_a43a
opc_rot2_uxn_opcodes_h_l1017_c39_a43a : entity work.opc_rot2_0CLK_b6a715c8 port map (
clk,
opc_rot2_uxn_opcodes_h_l1017_c39_a43a_CLOCK_ENABLE,
opc_rot2_uxn_opcodes_h_l1017_c39_a43a_stack_index,
opc_rot2_uxn_opcodes_h_l1017_c39_a43a_ins,
opc_rot2_uxn_opcodes_h_l1017_c39_a43a_k,
opc_rot2_uxn_opcodes_h_l1017_c39_a43a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_left,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_right,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_return_output);

-- result_MUX_uxn_opcodes_h_l1018_c7_7852
result_MUX_uxn_opcodes_h_l1018_c7_7852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1018_c7_7852_cond,
result_MUX_uxn_opcodes_h_l1018_c7_7852_iftrue,
result_MUX_uxn_opcodes_h_l1018_c7_7852_iffalse,
result_MUX_uxn_opcodes_h_l1018_c7_7852_return_output);

-- opc_dup_uxn_opcodes_h_l1018_c39_ed1c
opc_dup_uxn_opcodes_h_l1018_c39_ed1c : entity work.opc_dup_0CLK_b35fcc95 port map (
clk,
opc_dup_uxn_opcodes_h_l1018_c39_ed1c_CLOCK_ENABLE,
opc_dup_uxn_opcodes_h_l1018_c39_ed1c_stack_index,
opc_dup_uxn_opcodes_h_l1018_c39_ed1c_ins,
opc_dup_uxn_opcodes_h_l1018_c39_ed1c_k,
opc_dup_uxn_opcodes_h_l1018_c39_ed1c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_left,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_right,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_return_output);

-- result_MUX_uxn_opcodes_h_l1019_c7_3567
result_MUX_uxn_opcodes_h_l1019_c7_3567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1019_c7_3567_cond,
result_MUX_uxn_opcodes_h_l1019_c7_3567_iftrue,
result_MUX_uxn_opcodes_h_l1019_c7_3567_iffalse,
result_MUX_uxn_opcodes_h_l1019_c7_3567_return_output);

-- opc_dup2_uxn_opcodes_h_l1019_c39_79f2
opc_dup2_uxn_opcodes_h_l1019_c39_79f2 : entity work.opc_dup2_0CLK_2d792ee4 port map (
clk,
opc_dup2_uxn_opcodes_h_l1019_c39_79f2_CLOCK_ENABLE,
opc_dup2_uxn_opcodes_h_l1019_c39_79f2_stack_index,
opc_dup2_uxn_opcodes_h_l1019_c39_79f2_ins,
opc_dup2_uxn_opcodes_h_l1019_c39_79f2_k,
opc_dup2_uxn_opcodes_h_l1019_c39_79f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_left,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_right,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_return_output);

-- result_MUX_uxn_opcodes_h_l1020_c7_8e81
result_MUX_uxn_opcodes_h_l1020_c7_8e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1020_c7_8e81_cond,
result_MUX_uxn_opcodes_h_l1020_c7_8e81_iftrue,
result_MUX_uxn_opcodes_h_l1020_c7_8e81_iffalse,
result_MUX_uxn_opcodes_h_l1020_c7_8e81_return_output);

-- opc_ovr_uxn_opcodes_h_l1020_c39_8e77
opc_ovr_uxn_opcodes_h_l1020_c39_8e77 : entity work.opc_ovr_0CLK_7426ea5f port map (
clk,
opc_ovr_uxn_opcodes_h_l1020_c39_8e77_CLOCK_ENABLE,
opc_ovr_uxn_opcodes_h_l1020_c39_8e77_stack_index,
opc_ovr_uxn_opcodes_h_l1020_c39_8e77_ins,
opc_ovr_uxn_opcodes_h_l1020_c39_8e77_k,
opc_ovr_uxn_opcodes_h_l1020_c39_8e77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_left,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_right,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_return_output);

-- result_MUX_uxn_opcodes_h_l1021_c7_0ef7
result_MUX_uxn_opcodes_h_l1021_c7_0ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1021_c7_0ef7_cond,
result_MUX_uxn_opcodes_h_l1021_c7_0ef7_iftrue,
result_MUX_uxn_opcodes_h_l1021_c7_0ef7_iffalse,
result_MUX_uxn_opcodes_h_l1021_c7_0ef7_return_output);

-- opc_ovr2_uxn_opcodes_h_l1021_c39_90a5
opc_ovr2_uxn_opcodes_h_l1021_c39_90a5 : entity work.opc_ovr2_0CLK_d55c588b port map (
clk,
opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_CLOCK_ENABLE,
opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_stack_index,
opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_ins,
opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_k,
opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_left,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_right,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_return_output);

-- result_MUX_uxn_opcodes_h_l1022_c7_b2f3
result_MUX_uxn_opcodes_h_l1022_c7_b2f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1022_c7_b2f3_cond,
result_MUX_uxn_opcodes_h_l1022_c7_b2f3_iftrue,
result_MUX_uxn_opcodes_h_l1022_c7_b2f3_iffalse,
result_MUX_uxn_opcodes_h_l1022_c7_b2f3_return_output);

-- opc_equ_uxn_opcodes_h_l1022_c39_036f
opc_equ_uxn_opcodes_h_l1022_c39_036f : entity work.opc_equ_0CLK_0f17f38b port map (
clk,
opc_equ_uxn_opcodes_h_l1022_c39_036f_CLOCK_ENABLE,
opc_equ_uxn_opcodes_h_l1022_c39_036f_stack_index,
opc_equ_uxn_opcodes_h_l1022_c39_036f_ins,
opc_equ_uxn_opcodes_h_l1022_c39_036f_k,
opc_equ_uxn_opcodes_h_l1022_c39_036f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_return_output);

-- result_MUX_uxn_opcodes_h_l1023_c7_2922
result_MUX_uxn_opcodes_h_l1023_c7_2922 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1023_c7_2922_cond,
result_MUX_uxn_opcodes_h_l1023_c7_2922_iftrue,
result_MUX_uxn_opcodes_h_l1023_c7_2922_iffalse,
result_MUX_uxn_opcodes_h_l1023_c7_2922_return_output);

-- opc_equ2_uxn_opcodes_h_l1023_c39_ea78
opc_equ2_uxn_opcodes_h_l1023_c39_ea78 : entity work.opc_equ2_0CLK_8f6b64dc port map (
clk,
opc_equ2_uxn_opcodes_h_l1023_c39_ea78_CLOCK_ENABLE,
opc_equ2_uxn_opcodes_h_l1023_c39_ea78_stack_index,
opc_equ2_uxn_opcodes_h_l1023_c39_ea78_ins,
opc_equ2_uxn_opcodes_h_l1023_c39_ea78_k,
opc_equ2_uxn_opcodes_h_l1023_c39_ea78_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_left,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_right,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_return_output);

-- result_MUX_uxn_opcodes_h_l1024_c7_b3fa
result_MUX_uxn_opcodes_h_l1024_c7_b3fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1024_c7_b3fa_cond,
result_MUX_uxn_opcodes_h_l1024_c7_b3fa_iftrue,
result_MUX_uxn_opcodes_h_l1024_c7_b3fa_iffalse,
result_MUX_uxn_opcodes_h_l1024_c7_b3fa_return_output);

-- opc_neq_uxn_opcodes_h_l1024_c39_e004
opc_neq_uxn_opcodes_h_l1024_c39_e004 : entity work.opc_neq_0CLK_0f17f38b port map (
clk,
opc_neq_uxn_opcodes_h_l1024_c39_e004_CLOCK_ENABLE,
opc_neq_uxn_opcodes_h_l1024_c39_e004_stack_index,
opc_neq_uxn_opcodes_h_l1024_c39_e004_ins,
opc_neq_uxn_opcodes_h_l1024_c39_e004_k,
opc_neq_uxn_opcodes_h_l1024_c39_e004_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_left,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_right,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_return_output);

-- result_MUX_uxn_opcodes_h_l1025_c7_c74f
result_MUX_uxn_opcodes_h_l1025_c7_c74f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1025_c7_c74f_cond,
result_MUX_uxn_opcodes_h_l1025_c7_c74f_iftrue,
result_MUX_uxn_opcodes_h_l1025_c7_c74f_iffalse,
result_MUX_uxn_opcodes_h_l1025_c7_c74f_return_output);

-- opc_neq2_uxn_opcodes_h_l1025_c39_e04e
opc_neq2_uxn_opcodes_h_l1025_c39_e04e : entity work.opc_neq2_0CLK_8f6b64dc port map (
clk,
opc_neq2_uxn_opcodes_h_l1025_c39_e04e_CLOCK_ENABLE,
opc_neq2_uxn_opcodes_h_l1025_c39_e04e_stack_index,
opc_neq2_uxn_opcodes_h_l1025_c39_e04e_ins,
opc_neq2_uxn_opcodes_h_l1025_c39_e04e_k,
opc_neq2_uxn_opcodes_h_l1025_c39_e04e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_left,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_right,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_return_output);

-- result_MUX_uxn_opcodes_h_l1026_c7_9a91
result_MUX_uxn_opcodes_h_l1026_c7_9a91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1026_c7_9a91_cond,
result_MUX_uxn_opcodes_h_l1026_c7_9a91_iftrue,
result_MUX_uxn_opcodes_h_l1026_c7_9a91_iffalse,
result_MUX_uxn_opcodes_h_l1026_c7_9a91_return_output);

-- opc_gth_uxn_opcodes_h_l1026_c39_fd76
opc_gth_uxn_opcodes_h_l1026_c39_fd76 : entity work.opc_gth_0CLK_0f17f38b port map (
clk,
opc_gth_uxn_opcodes_h_l1026_c39_fd76_CLOCK_ENABLE,
opc_gth_uxn_opcodes_h_l1026_c39_fd76_stack_index,
opc_gth_uxn_opcodes_h_l1026_c39_fd76_ins,
opc_gth_uxn_opcodes_h_l1026_c39_fd76_k,
opc_gth_uxn_opcodes_h_l1026_c39_fd76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_left,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_right,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_return_output);

-- result_MUX_uxn_opcodes_h_l1027_c7_ca1b
result_MUX_uxn_opcodes_h_l1027_c7_ca1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1027_c7_ca1b_cond,
result_MUX_uxn_opcodes_h_l1027_c7_ca1b_iftrue,
result_MUX_uxn_opcodes_h_l1027_c7_ca1b_iffalse,
result_MUX_uxn_opcodes_h_l1027_c7_ca1b_return_output);

-- opc_gth2_uxn_opcodes_h_l1027_c39_c423
opc_gth2_uxn_opcodes_h_l1027_c39_c423 : entity work.opc_gth2_0CLK_8f6b64dc port map (
clk,
opc_gth2_uxn_opcodes_h_l1027_c39_c423_CLOCK_ENABLE,
opc_gth2_uxn_opcodes_h_l1027_c39_c423_stack_index,
opc_gth2_uxn_opcodes_h_l1027_c39_c423_ins,
opc_gth2_uxn_opcodes_h_l1027_c39_c423_k,
opc_gth2_uxn_opcodes_h_l1027_c39_c423_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_left,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_right,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_return_output);

-- result_MUX_uxn_opcodes_h_l1028_c7_462f
result_MUX_uxn_opcodes_h_l1028_c7_462f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1028_c7_462f_cond,
result_MUX_uxn_opcodes_h_l1028_c7_462f_iftrue,
result_MUX_uxn_opcodes_h_l1028_c7_462f_iffalse,
result_MUX_uxn_opcodes_h_l1028_c7_462f_return_output);

-- opc_lth_uxn_opcodes_h_l1028_c39_a09a
opc_lth_uxn_opcodes_h_l1028_c39_a09a : entity work.opc_lth_0CLK_0f17f38b port map (
clk,
opc_lth_uxn_opcodes_h_l1028_c39_a09a_CLOCK_ENABLE,
opc_lth_uxn_opcodes_h_l1028_c39_a09a_stack_index,
opc_lth_uxn_opcodes_h_l1028_c39_a09a_ins,
opc_lth_uxn_opcodes_h_l1028_c39_a09a_k,
opc_lth_uxn_opcodes_h_l1028_c39_a09a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_left,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_right,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_return_output);

-- result_MUX_uxn_opcodes_h_l1029_c7_7b7b
result_MUX_uxn_opcodes_h_l1029_c7_7b7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1029_c7_7b7b_cond,
result_MUX_uxn_opcodes_h_l1029_c7_7b7b_iftrue,
result_MUX_uxn_opcodes_h_l1029_c7_7b7b_iffalse,
result_MUX_uxn_opcodes_h_l1029_c7_7b7b_return_output);

-- opc_lth2_uxn_opcodes_h_l1029_c39_b2cb
opc_lth2_uxn_opcodes_h_l1029_c39_b2cb : entity work.opc_lth2_0CLK_8f6b64dc port map (
clk,
opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_CLOCK_ENABLE,
opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_stack_index,
opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_ins,
opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_k,
opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_left,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_right,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_return_output);

-- result_MUX_uxn_opcodes_h_l1030_c7_4804
result_MUX_uxn_opcodes_h_l1030_c7_4804 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1030_c7_4804_cond,
result_MUX_uxn_opcodes_h_l1030_c7_4804_iftrue,
result_MUX_uxn_opcodes_h_l1030_c7_4804_iffalse,
result_MUX_uxn_opcodes_h_l1030_c7_4804_return_output);

-- opc_jmp_uxn_opcodes_h_l1030_c39_00ca
opc_jmp_uxn_opcodes_h_l1030_c39_00ca : entity work.opc_jmp_0CLK_6296f90f port map (
clk,
opc_jmp_uxn_opcodes_h_l1030_c39_00ca_CLOCK_ENABLE,
opc_jmp_uxn_opcodes_h_l1030_c39_00ca_stack_index,
opc_jmp_uxn_opcodes_h_l1030_c39_00ca_ins,
opc_jmp_uxn_opcodes_h_l1030_c39_00ca_k,
opc_jmp_uxn_opcodes_h_l1030_c39_00ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_left,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_right,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_return_output);

-- result_MUX_uxn_opcodes_h_l1031_c7_273d
result_MUX_uxn_opcodes_h_l1031_c7_273d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1031_c7_273d_cond,
result_MUX_uxn_opcodes_h_l1031_c7_273d_iftrue,
result_MUX_uxn_opcodes_h_l1031_c7_273d_iffalse,
result_MUX_uxn_opcodes_h_l1031_c7_273d_return_output);

-- opc_jmp2_uxn_opcodes_h_l1031_c39_92d8
opc_jmp2_uxn_opcodes_h_l1031_c39_92d8 : entity work.opc_jmp2_0CLK_267ca175 port map (
clk,
opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_CLOCK_ENABLE,
opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_stack_index,
opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_ins,
opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_k,
opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_left,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_right,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_return_output);

-- result_MUX_uxn_opcodes_h_l1032_c7_2296
result_MUX_uxn_opcodes_h_l1032_c7_2296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1032_c7_2296_cond,
result_MUX_uxn_opcodes_h_l1032_c7_2296_iftrue,
result_MUX_uxn_opcodes_h_l1032_c7_2296_iffalse,
result_MUX_uxn_opcodes_h_l1032_c7_2296_return_output);

-- opc_jcn_uxn_opcodes_h_l1032_c39_749e
opc_jcn_uxn_opcodes_h_l1032_c39_749e : entity work.opc_jcn_0CLK_7c6909f0 port map (
clk,
opc_jcn_uxn_opcodes_h_l1032_c39_749e_CLOCK_ENABLE,
opc_jcn_uxn_opcodes_h_l1032_c39_749e_stack_index,
opc_jcn_uxn_opcodes_h_l1032_c39_749e_ins,
opc_jcn_uxn_opcodes_h_l1032_c39_749e_k,
opc_jcn_uxn_opcodes_h_l1032_c39_749e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_left,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_right,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_return_output);

-- result_MUX_uxn_opcodes_h_l1033_c7_51d1
result_MUX_uxn_opcodes_h_l1033_c7_51d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1033_c7_51d1_cond,
result_MUX_uxn_opcodes_h_l1033_c7_51d1_iftrue,
result_MUX_uxn_opcodes_h_l1033_c7_51d1_iffalse,
result_MUX_uxn_opcodes_h_l1033_c7_51d1_return_output);

-- opc_jcn2_uxn_opcodes_h_l1033_c39_5568
opc_jcn2_uxn_opcodes_h_l1033_c39_5568 : entity work.opc_jcn2_0CLK_d6b79ff3 port map (
clk,
opc_jcn2_uxn_opcodes_h_l1033_c39_5568_CLOCK_ENABLE,
opc_jcn2_uxn_opcodes_h_l1033_c39_5568_stack_index,
opc_jcn2_uxn_opcodes_h_l1033_c39_5568_ins,
opc_jcn2_uxn_opcodes_h_l1033_c39_5568_k,
opc_jcn2_uxn_opcodes_h_l1033_c39_5568_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_left,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_right,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_return_output);

-- result_MUX_uxn_opcodes_h_l1034_c7_aced
result_MUX_uxn_opcodes_h_l1034_c7_aced : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1034_c7_aced_cond,
result_MUX_uxn_opcodes_h_l1034_c7_aced_iftrue,
result_MUX_uxn_opcodes_h_l1034_c7_aced_iffalse,
result_MUX_uxn_opcodes_h_l1034_c7_aced_return_output);

-- opc_jsr_uxn_opcodes_h_l1034_c39_8fb6
opc_jsr_uxn_opcodes_h_l1034_c39_8fb6 : entity work.opc_jsr_0CLK_95c25791 port map (
clk,
opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_CLOCK_ENABLE,
opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_stack_index,
opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_ins,
opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_k,
opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_left,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_right,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_return_output);

-- result_MUX_uxn_opcodes_h_l1035_c7_2527
result_MUX_uxn_opcodes_h_l1035_c7_2527 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1035_c7_2527_cond,
result_MUX_uxn_opcodes_h_l1035_c7_2527_iftrue,
result_MUX_uxn_opcodes_h_l1035_c7_2527_iffalse,
result_MUX_uxn_opcodes_h_l1035_c7_2527_return_output);

-- opc_jsr2_uxn_opcodes_h_l1035_c39_d17e
opc_jsr2_uxn_opcodes_h_l1035_c39_d17e : entity work.opc_jsr2_0CLK_e3a6b7fb port map (
clk,
opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_CLOCK_ENABLE,
opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_stack_index,
opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_ins,
opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_k,
opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_left,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_right,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_return_output);

-- result_MUX_uxn_opcodes_h_l1036_c7_921a
result_MUX_uxn_opcodes_h_l1036_c7_921a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1036_c7_921a_cond,
result_MUX_uxn_opcodes_h_l1036_c7_921a_iftrue,
result_MUX_uxn_opcodes_h_l1036_c7_921a_iffalse,
result_MUX_uxn_opcodes_h_l1036_c7_921a_return_output);

-- opc_sth_uxn_opcodes_h_l1036_c39_b171
opc_sth_uxn_opcodes_h_l1036_c39_b171 : entity work.opc_sth_0CLK_d60b8445 port map (
clk,
opc_sth_uxn_opcodes_h_l1036_c39_b171_CLOCK_ENABLE,
opc_sth_uxn_opcodes_h_l1036_c39_b171_stack_index,
opc_sth_uxn_opcodes_h_l1036_c39_b171_ins,
opc_sth_uxn_opcodes_h_l1036_c39_b171_k,
opc_sth_uxn_opcodes_h_l1036_c39_b171_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_left,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_right,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_return_output);

-- result_MUX_uxn_opcodes_h_l1037_c7_a56a
result_MUX_uxn_opcodes_h_l1037_c7_a56a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1037_c7_a56a_cond,
result_MUX_uxn_opcodes_h_l1037_c7_a56a_iftrue,
result_MUX_uxn_opcodes_h_l1037_c7_a56a_iffalse,
result_MUX_uxn_opcodes_h_l1037_c7_a56a_return_output);

-- opc_sth2_uxn_opcodes_h_l1037_c39_3575
opc_sth2_uxn_opcodes_h_l1037_c39_3575 : entity work.opc_sth2_0CLK_46c6aa87 port map (
clk,
opc_sth2_uxn_opcodes_h_l1037_c39_3575_CLOCK_ENABLE,
opc_sth2_uxn_opcodes_h_l1037_c39_3575_stack_index,
opc_sth2_uxn_opcodes_h_l1037_c39_3575_ins,
opc_sth2_uxn_opcodes_h_l1037_c39_3575_k,
opc_sth2_uxn_opcodes_h_l1037_c39_3575_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_left,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_right,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_return_output);

-- result_MUX_uxn_opcodes_h_l1038_c7_c06d
result_MUX_uxn_opcodes_h_l1038_c7_c06d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1038_c7_c06d_cond,
result_MUX_uxn_opcodes_h_l1038_c7_c06d_iftrue,
result_MUX_uxn_opcodes_h_l1038_c7_c06d_iffalse,
result_MUX_uxn_opcodes_h_l1038_c7_c06d_return_output);

-- opc_ldz_uxn_opcodes_h_l1038_c39_cf9b
opc_ldz_uxn_opcodes_h_l1038_c39_cf9b : entity work.opc_ldz_0CLK_50573c61 port map (
clk,
opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_CLOCK_ENABLE,
opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_stack_index,
opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_ins,
opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_k,
opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_left,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_right,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_return_output);

-- result_MUX_uxn_opcodes_h_l1039_c7_3c6d
result_MUX_uxn_opcodes_h_l1039_c7_3c6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1039_c7_3c6d_cond,
result_MUX_uxn_opcodes_h_l1039_c7_3c6d_iftrue,
result_MUX_uxn_opcodes_h_l1039_c7_3c6d_iffalse,
result_MUX_uxn_opcodes_h_l1039_c7_3c6d_return_output);

-- opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9
opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9 : entity work.opc_ldz2_0CLK_c4b716c7 port map (
clk,
opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_CLOCK_ENABLE,
opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_stack_index,
opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_ins,
opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_k,
opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_left,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_right,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_return_output);

-- result_MUX_uxn_opcodes_h_l1040_c7_8044
result_MUX_uxn_opcodes_h_l1040_c7_8044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1040_c7_8044_cond,
result_MUX_uxn_opcodes_h_l1040_c7_8044_iftrue,
result_MUX_uxn_opcodes_h_l1040_c7_8044_iffalse,
result_MUX_uxn_opcodes_h_l1040_c7_8044_return_output);

-- opc_stz_uxn_opcodes_h_l1040_c39_4e7a
opc_stz_uxn_opcodes_h_l1040_c39_4e7a : entity work.opc_stz_0CLK_faa0cad7 port map (
clk,
opc_stz_uxn_opcodes_h_l1040_c39_4e7a_CLOCK_ENABLE,
opc_stz_uxn_opcodes_h_l1040_c39_4e7a_stack_index,
opc_stz_uxn_opcodes_h_l1040_c39_4e7a_ins,
opc_stz_uxn_opcodes_h_l1040_c39_4e7a_k,
opc_stz_uxn_opcodes_h_l1040_c39_4e7a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_left,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_right,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_return_output);

-- result_MUX_uxn_opcodes_h_l1041_c7_7fd2
result_MUX_uxn_opcodes_h_l1041_c7_7fd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1041_c7_7fd2_cond,
result_MUX_uxn_opcodes_h_l1041_c7_7fd2_iftrue,
result_MUX_uxn_opcodes_h_l1041_c7_7fd2_iffalse,
result_MUX_uxn_opcodes_h_l1041_c7_7fd2_return_output);

-- opc_stz2_uxn_opcodes_h_l1041_c39_c70c
opc_stz2_uxn_opcodes_h_l1041_c39_c70c : entity work.opc_stz2_0CLK_ae901d29 port map (
clk,
opc_stz2_uxn_opcodes_h_l1041_c39_c70c_CLOCK_ENABLE,
opc_stz2_uxn_opcodes_h_l1041_c39_c70c_stack_index,
opc_stz2_uxn_opcodes_h_l1041_c39_c70c_ins,
opc_stz2_uxn_opcodes_h_l1041_c39_c70c_k,
opc_stz2_uxn_opcodes_h_l1041_c39_c70c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_left,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_right,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_return_output);

-- result_MUX_uxn_opcodes_h_l1042_c7_59b6
result_MUX_uxn_opcodes_h_l1042_c7_59b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1042_c7_59b6_cond,
result_MUX_uxn_opcodes_h_l1042_c7_59b6_iftrue,
result_MUX_uxn_opcodes_h_l1042_c7_59b6_iffalse,
result_MUX_uxn_opcodes_h_l1042_c7_59b6_return_output);

-- opc_ldr_uxn_opcodes_h_l1042_c39_d0a6
opc_ldr_uxn_opcodes_h_l1042_c39_d0a6 : entity work.opc_ldr_0CLK_b22cbafb port map (
clk,
opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_CLOCK_ENABLE,
opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_stack_index,
opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_ins,
opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_k,
opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_left,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_right,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_return_output);

-- result_MUX_uxn_opcodes_h_l1043_c7_94cd
result_MUX_uxn_opcodes_h_l1043_c7_94cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1043_c7_94cd_cond,
result_MUX_uxn_opcodes_h_l1043_c7_94cd_iftrue,
result_MUX_uxn_opcodes_h_l1043_c7_94cd_iffalse,
result_MUX_uxn_opcodes_h_l1043_c7_94cd_return_output);

-- opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4
opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4 : entity work.opc_ldr2_0CLK_2a23943e port map (
clk,
opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_CLOCK_ENABLE,
opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_stack_index,
opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_ins,
opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_k,
opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_left,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_right,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_return_output);

-- result_MUX_uxn_opcodes_h_l1044_c7_bc59
result_MUX_uxn_opcodes_h_l1044_c7_bc59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1044_c7_bc59_cond,
result_MUX_uxn_opcodes_h_l1044_c7_bc59_iftrue,
result_MUX_uxn_opcodes_h_l1044_c7_bc59_iffalse,
result_MUX_uxn_opcodes_h_l1044_c7_bc59_return_output);

-- opc_str_uxn_opcodes_h_l1044_c39_d36a
opc_str_uxn_opcodes_h_l1044_c39_d36a : entity work.opc_str_0CLK_81c67800 port map (
clk,
opc_str_uxn_opcodes_h_l1044_c39_d36a_CLOCK_ENABLE,
opc_str_uxn_opcodes_h_l1044_c39_d36a_stack_index,
opc_str_uxn_opcodes_h_l1044_c39_d36a_ins,
opc_str_uxn_opcodes_h_l1044_c39_d36a_k,
opc_str_uxn_opcodes_h_l1044_c39_d36a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_left,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_right,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_return_output);

-- result_MUX_uxn_opcodes_h_l1045_c7_633b
result_MUX_uxn_opcodes_h_l1045_c7_633b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1045_c7_633b_cond,
result_MUX_uxn_opcodes_h_l1045_c7_633b_iftrue,
result_MUX_uxn_opcodes_h_l1045_c7_633b_iffalse,
result_MUX_uxn_opcodes_h_l1045_c7_633b_return_output);

-- opc_str2_uxn_opcodes_h_l1045_c39_ca6b
opc_str2_uxn_opcodes_h_l1045_c39_ca6b : entity work.opc_str2_0CLK_7c7ba8cb port map (
clk,
opc_str2_uxn_opcodes_h_l1045_c39_ca6b_CLOCK_ENABLE,
opc_str2_uxn_opcodes_h_l1045_c39_ca6b_stack_index,
opc_str2_uxn_opcodes_h_l1045_c39_ca6b_ins,
opc_str2_uxn_opcodes_h_l1045_c39_ca6b_k,
opc_str2_uxn_opcodes_h_l1045_c39_ca6b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_left,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_right,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_return_output);

-- result_MUX_uxn_opcodes_h_l1046_c7_0b3d
result_MUX_uxn_opcodes_h_l1046_c7_0b3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1046_c7_0b3d_cond,
result_MUX_uxn_opcodes_h_l1046_c7_0b3d_iftrue,
result_MUX_uxn_opcodes_h_l1046_c7_0b3d_iffalse,
result_MUX_uxn_opcodes_h_l1046_c7_0b3d_return_output);

-- opc_lda_uxn_opcodes_h_l1046_c39_ced1
opc_lda_uxn_opcodes_h_l1046_c39_ced1 : entity work.opc_lda_0CLK_e051f58c port map (
clk,
opc_lda_uxn_opcodes_h_l1046_c39_ced1_CLOCK_ENABLE,
opc_lda_uxn_opcodes_h_l1046_c39_ced1_stack_index,
opc_lda_uxn_opcodes_h_l1046_c39_ced1_ins,
opc_lda_uxn_opcodes_h_l1046_c39_ced1_k,
opc_lda_uxn_opcodes_h_l1046_c39_ced1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_return_output);

-- result_MUX_uxn_opcodes_h_l1047_c7_a82c
result_MUX_uxn_opcodes_h_l1047_c7_a82c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1047_c7_a82c_cond,
result_MUX_uxn_opcodes_h_l1047_c7_a82c_iftrue,
result_MUX_uxn_opcodes_h_l1047_c7_a82c_iffalse,
result_MUX_uxn_opcodes_h_l1047_c7_a82c_return_output);

-- opc_lda2_uxn_opcodes_h_l1047_c39_76a3
opc_lda2_uxn_opcodes_h_l1047_c39_76a3 : entity work.opc_lda2_0CLK_e051f58c port map (
clk,
opc_lda2_uxn_opcodes_h_l1047_c39_76a3_CLOCK_ENABLE,
opc_lda2_uxn_opcodes_h_l1047_c39_76a3_stack_index,
opc_lda2_uxn_opcodes_h_l1047_c39_76a3_ins,
opc_lda2_uxn_opcodes_h_l1047_c39_76a3_k,
opc_lda2_uxn_opcodes_h_l1047_c39_76a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_left,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_right,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_return_output);

-- result_MUX_uxn_opcodes_h_l1048_c7_72e3
result_MUX_uxn_opcodes_h_l1048_c7_72e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1048_c7_72e3_cond,
result_MUX_uxn_opcodes_h_l1048_c7_72e3_iftrue,
result_MUX_uxn_opcodes_h_l1048_c7_72e3_iffalse,
result_MUX_uxn_opcodes_h_l1048_c7_72e3_return_output);

-- opc_sta_uxn_opcodes_h_l1048_c39_051e
opc_sta_uxn_opcodes_h_l1048_c39_051e : entity work.opc_sta_0CLK_0f3c573c port map (
clk,
opc_sta_uxn_opcodes_h_l1048_c39_051e_CLOCK_ENABLE,
opc_sta_uxn_opcodes_h_l1048_c39_051e_stack_index,
opc_sta_uxn_opcodes_h_l1048_c39_051e_ins,
opc_sta_uxn_opcodes_h_l1048_c39_051e_k,
opc_sta_uxn_opcodes_h_l1048_c39_051e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_left,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_right,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_return_output);

-- result_MUX_uxn_opcodes_h_l1049_c7_9c56
result_MUX_uxn_opcodes_h_l1049_c7_9c56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1049_c7_9c56_cond,
result_MUX_uxn_opcodes_h_l1049_c7_9c56_iftrue,
result_MUX_uxn_opcodes_h_l1049_c7_9c56_iffalse,
result_MUX_uxn_opcodes_h_l1049_c7_9c56_return_output);

-- opc_sta2_uxn_opcodes_h_l1049_c39_2b32
opc_sta2_uxn_opcodes_h_l1049_c39_2b32 : entity work.opc_sta2_0CLK_a2a181d9 port map (
clk,
opc_sta2_uxn_opcodes_h_l1049_c39_2b32_CLOCK_ENABLE,
opc_sta2_uxn_opcodes_h_l1049_c39_2b32_stack_index,
opc_sta2_uxn_opcodes_h_l1049_c39_2b32_ins,
opc_sta2_uxn_opcodes_h_l1049_c39_2b32_k,
opc_sta2_uxn_opcodes_h_l1049_c39_2b32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_return_output);

-- result_MUX_uxn_opcodes_h_l1050_c7_db9e
result_MUX_uxn_opcodes_h_l1050_c7_db9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1050_c7_db9e_cond,
result_MUX_uxn_opcodes_h_l1050_c7_db9e_iftrue,
result_MUX_uxn_opcodes_h_l1050_c7_db9e_iffalse,
result_MUX_uxn_opcodes_h_l1050_c7_db9e_return_output);

-- opc_dei_uxn_opcodes_h_l1050_c39_28e3
opc_dei_uxn_opcodes_h_l1050_c39_28e3 : entity work.opc_dei_0CLK_e24090d2 port map (
clk,
opc_dei_uxn_opcodes_h_l1050_c39_28e3_CLOCK_ENABLE,
opc_dei_uxn_opcodes_h_l1050_c39_28e3_stack_index,
opc_dei_uxn_opcodes_h_l1050_c39_28e3_ins,
opc_dei_uxn_opcodes_h_l1050_c39_28e3_k,
opc_dei_uxn_opcodes_h_l1050_c39_28e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_left,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_right,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_return_output);

-- result_MUX_uxn_opcodes_h_l1051_c7_6b7e
result_MUX_uxn_opcodes_h_l1051_c7_6b7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1051_c7_6b7e_cond,
result_MUX_uxn_opcodes_h_l1051_c7_6b7e_iftrue,
result_MUX_uxn_opcodes_h_l1051_c7_6b7e_iffalse,
result_MUX_uxn_opcodes_h_l1051_c7_6b7e_return_output);

-- opc_dei2_uxn_opcodes_h_l1051_c39_e46f
opc_dei2_uxn_opcodes_h_l1051_c39_e46f : entity work.opc_dei2_0CLK_0ab02ad9 port map (
clk,
opc_dei2_uxn_opcodes_h_l1051_c39_e46f_CLOCK_ENABLE,
opc_dei2_uxn_opcodes_h_l1051_c39_e46f_stack_index,
opc_dei2_uxn_opcodes_h_l1051_c39_e46f_ins,
opc_dei2_uxn_opcodes_h_l1051_c39_e46f_k,
opc_dei2_uxn_opcodes_h_l1051_c39_e46f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_left,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_right,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_return_output);

-- result_MUX_uxn_opcodes_h_l1052_c7_bee1
result_MUX_uxn_opcodes_h_l1052_c7_bee1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1052_c7_bee1_cond,
result_MUX_uxn_opcodes_h_l1052_c7_bee1_iftrue,
result_MUX_uxn_opcodes_h_l1052_c7_bee1_iffalse,
result_MUX_uxn_opcodes_h_l1052_c7_bee1_return_output);

-- opc_deo_uxn_opcodes_h_l1052_c39_69b6
opc_deo_uxn_opcodes_h_l1052_c39_69b6 : entity work.opc_deo_0CLK_a522552e port map (
clk,
opc_deo_uxn_opcodes_h_l1052_c39_69b6_CLOCK_ENABLE,
opc_deo_uxn_opcodes_h_l1052_c39_69b6_stack_index,
opc_deo_uxn_opcodes_h_l1052_c39_69b6_ins,
opc_deo_uxn_opcodes_h_l1052_c39_69b6_k,
opc_deo_uxn_opcodes_h_l1052_c39_69b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_left,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_right,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_return_output);

-- result_MUX_uxn_opcodes_h_l1053_c7_f2da
result_MUX_uxn_opcodes_h_l1053_c7_f2da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1053_c7_f2da_cond,
result_MUX_uxn_opcodes_h_l1053_c7_f2da_iftrue,
result_MUX_uxn_opcodes_h_l1053_c7_f2da_iffalse,
result_MUX_uxn_opcodes_h_l1053_c7_f2da_return_output);

-- opc_deo2_uxn_opcodes_h_l1053_c39_cc30
opc_deo2_uxn_opcodes_h_l1053_c39_cc30 : entity work.opc_deo2_0CLK_a4f0ae02 port map (
clk,
opc_deo2_uxn_opcodes_h_l1053_c39_cc30_CLOCK_ENABLE,
opc_deo2_uxn_opcodes_h_l1053_c39_cc30_stack_index,
opc_deo2_uxn_opcodes_h_l1053_c39_cc30_ins,
opc_deo2_uxn_opcodes_h_l1053_c39_cc30_k,
opc_deo2_uxn_opcodes_h_l1053_c39_cc30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_left,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_right,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_return_output);

-- result_MUX_uxn_opcodes_h_l1054_c7_35d8
result_MUX_uxn_opcodes_h_l1054_c7_35d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1054_c7_35d8_cond,
result_MUX_uxn_opcodes_h_l1054_c7_35d8_iftrue,
result_MUX_uxn_opcodes_h_l1054_c7_35d8_iffalse,
result_MUX_uxn_opcodes_h_l1054_c7_35d8_return_output);

-- opc_add_uxn_opcodes_h_l1054_c39_c851
opc_add_uxn_opcodes_h_l1054_c39_c851 : entity work.opc_add_0CLK_c28e6654 port map (
clk,
opc_add_uxn_opcodes_h_l1054_c39_c851_CLOCK_ENABLE,
opc_add_uxn_opcodes_h_l1054_c39_c851_stack_index,
opc_add_uxn_opcodes_h_l1054_c39_c851_ins,
opc_add_uxn_opcodes_h_l1054_c39_c851_k,
opc_add_uxn_opcodes_h_l1054_c39_c851_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_return_output);

-- result_MUX_uxn_opcodes_h_l1055_c7_d1b7
result_MUX_uxn_opcodes_h_l1055_c7_d1b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1055_c7_d1b7_cond,
result_MUX_uxn_opcodes_h_l1055_c7_d1b7_iftrue,
result_MUX_uxn_opcodes_h_l1055_c7_d1b7_iffalse,
result_MUX_uxn_opcodes_h_l1055_c7_d1b7_return_output);

-- opc_add2_uxn_opcodes_h_l1055_c39_61d6
opc_add2_uxn_opcodes_h_l1055_c39_61d6 : entity work.opc_add2_0CLK_88a23eea port map (
clk,
opc_add2_uxn_opcodes_h_l1055_c39_61d6_CLOCK_ENABLE,
opc_add2_uxn_opcodes_h_l1055_c39_61d6_stack_index,
opc_add2_uxn_opcodes_h_l1055_c39_61d6_ins,
opc_add2_uxn_opcodes_h_l1055_c39_61d6_k,
opc_add2_uxn_opcodes_h_l1055_c39_61d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_left,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_right,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_return_output);

-- result_MUX_uxn_opcodes_h_l1056_c7_a347
result_MUX_uxn_opcodes_h_l1056_c7_a347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1056_c7_a347_cond,
result_MUX_uxn_opcodes_h_l1056_c7_a347_iftrue,
result_MUX_uxn_opcodes_h_l1056_c7_a347_iffalse,
result_MUX_uxn_opcodes_h_l1056_c7_a347_return_output);

-- opc_sub_uxn_opcodes_h_l1056_c39_9af1
opc_sub_uxn_opcodes_h_l1056_c39_9af1 : entity work.opc_sub_0CLK_c28e6654 port map (
clk,
opc_sub_uxn_opcodes_h_l1056_c39_9af1_CLOCK_ENABLE,
opc_sub_uxn_opcodes_h_l1056_c39_9af1_stack_index,
opc_sub_uxn_opcodes_h_l1056_c39_9af1_ins,
opc_sub_uxn_opcodes_h_l1056_c39_9af1_k,
opc_sub_uxn_opcodes_h_l1056_c39_9af1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_left,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_right,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_return_output);

-- result_MUX_uxn_opcodes_h_l1057_c7_d8d8
result_MUX_uxn_opcodes_h_l1057_c7_d8d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1057_c7_d8d8_cond,
result_MUX_uxn_opcodes_h_l1057_c7_d8d8_iftrue,
result_MUX_uxn_opcodes_h_l1057_c7_d8d8_iffalse,
result_MUX_uxn_opcodes_h_l1057_c7_d8d8_return_output);

-- opc_sub2_uxn_opcodes_h_l1057_c39_699e
opc_sub2_uxn_opcodes_h_l1057_c39_699e : entity work.opc_sub2_0CLK_88a23eea port map (
clk,
opc_sub2_uxn_opcodes_h_l1057_c39_699e_CLOCK_ENABLE,
opc_sub2_uxn_opcodes_h_l1057_c39_699e_stack_index,
opc_sub2_uxn_opcodes_h_l1057_c39_699e_ins,
opc_sub2_uxn_opcodes_h_l1057_c39_699e_k,
opc_sub2_uxn_opcodes_h_l1057_c39_699e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_left,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_right,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_return_output);

-- result_MUX_uxn_opcodes_h_l1058_c7_0436
result_MUX_uxn_opcodes_h_l1058_c7_0436 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1058_c7_0436_cond,
result_MUX_uxn_opcodes_h_l1058_c7_0436_iftrue,
result_MUX_uxn_opcodes_h_l1058_c7_0436_iffalse,
result_MUX_uxn_opcodes_h_l1058_c7_0436_return_output);

-- opc_mul_uxn_opcodes_h_l1058_c39_14bf
opc_mul_uxn_opcodes_h_l1058_c39_14bf : entity work.opc_mul_0CLK_c28e6654 port map (
clk,
opc_mul_uxn_opcodes_h_l1058_c39_14bf_CLOCK_ENABLE,
opc_mul_uxn_opcodes_h_l1058_c39_14bf_stack_index,
opc_mul_uxn_opcodes_h_l1058_c39_14bf_ins,
opc_mul_uxn_opcodes_h_l1058_c39_14bf_k,
opc_mul_uxn_opcodes_h_l1058_c39_14bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_left,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_right,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_return_output);

-- result_MUX_uxn_opcodes_h_l1059_c7_d385
result_MUX_uxn_opcodes_h_l1059_c7_d385 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1059_c7_d385_cond,
result_MUX_uxn_opcodes_h_l1059_c7_d385_iftrue,
result_MUX_uxn_opcodes_h_l1059_c7_d385_iffalse,
result_MUX_uxn_opcodes_h_l1059_c7_d385_return_output);

-- opc_mul2_uxn_opcodes_h_l1059_c39_b2ff
opc_mul2_uxn_opcodes_h_l1059_c39_b2ff : entity work.opc_mul2_0CLK_88a23eea port map (
clk,
opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_CLOCK_ENABLE,
opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_stack_index,
opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_ins,
opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_k,
opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_left,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_right,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_return_output);

-- result_MUX_uxn_opcodes_h_l1060_c7_310c
result_MUX_uxn_opcodes_h_l1060_c7_310c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1060_c7_310c_cond,
result_MUX_uxn_opcodes_h_l1060_c7_310c_iftrue,
result_MUX_uxn_opcodes_h_l1060_c7_310c_iffalse,
result_MUX_uxn_opcodes_h_l1060_c7_310c_return_output);

-- opc_div_uxn_opcodes_h_l1060_c39_dec5
opc_div_uxn_opcodes_h_l1060_c39_dec5 : entity work.opc_div_0CLK_6c00b54e port map (
clk,
opc_div_uxn_opcodes_h_l1060_c39_dec5_CLOCK_ENABLE,
opc_div_uxn_opcodes_h_l1060_c39_dec5_stack_index,
opc_div_uxn_opcodes_h_l1060_c39_dec5_ins,
opc_div_uxn_opcodes_h_l1060_c39_dec5_k,
opc_div_uxn_opcodes_h_l1060_c39_dec5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_left,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_right,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_return_output);

-- result_MUX_uxn_opcodes_h_l1061_c7_76c7
result_MUX_uxn_opcodes_h_l1061_c7_76c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1061_c7_76c7_cond,
result_MUX_uxn_opcodes_h_l1061_c7_76c7_iftrue,
result_MUX_uxn_opcodes_h_l1061_c7_76c7_iffalse,
result_MUX_uxn_opcodes_h_l1061_c7_76c7_return_output);

-- opc_div2_uxn_opcodes_h_l1061_c39_de16
opc_div2_uxn_opcodes_h_l1061_c39_de16 : entity work.opc_div2_0CLK_b19c5a25 port map (
clk,
opc_div2_uxn_opcodes_h_l1061_c39_de16_CLOCK_ENABLE,
opc_div2_uxn_opcodes_h_l1061_c39_de16_stack_index,
opc_div2_uxn_opcodes_h_l1061_c39_de16_ins,
opc_div2_uxn_opcodes_h_l1061_c39_de16_k,
opc_div2_uxn_opcodes_h_l1061_c39_de16_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_left,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_right,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_return_output);

-- result_MUX_uxn_opcodes_h_l1062_c7_e68d
result_MUX_uxn_opcodes_h_l1062_c7_e68d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1062_c7_e68d_cond,
result_MUX_uxn_opcodes_h_l1062_c7_e68d_iftrue,
result_MUX_uxn_opcodes_h_l1062_c7_e68d_iffalse,
result_MUX_uxn_opcodes_h_l1062_c7_e68d_return_output);

-- opc_and_uxn_opcodes_h_l1062_c39_beee
opc_and_uxn_opcodes_h_l1062_c39_beee : entity work.opc_and_0CLK_c28e6654 port map (
clk,
opc_and_uxn_opcodes_h_l1062_c39_beee_CLOCK_ENABLE,
opc_and_uxn_opcodes_h_l1062_c39_beee_stack_index,
opc_and_uxn_opcodes_h_l1062_c39_beee_ins,
opc_and_uxn_opcodes_h_l1062_c39_beee_k,
opc_and_uxn_opcodes_h_l1062_c39_beee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_return_output);

-- result_MUX_uxn_opcodes_h_l1063_c7_b7b0
result_MUX_uxn_opcodes_h_l1063_c7_b7b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1063_c7_b7b0_cond,
result_MUX_uxn_opcodes_h_l1063_c7_b7b0_iftrue,
result_MUX_uxn_opcodes_h_l1063_c7_b7b0_iffalse,
result_MUX_uxn_opcodes_h_l1063_c7_b7b0_return_output);

-- opc_and2_uxn_opcodes_h_l1063_c39_a0e1
opc_and2_uxn_opcodes_h_l1063_c39_a0e1 : entity work.opc_and2_0CLK_88a23eea port map (
clk,
opc_and2_uxn_opcodes_h_l1063_c39_a0e1_CLOCK_ENABLE,
opc_and2_uxn_opcodes_h_l1063_c39_a0e1_stack_index,
opc_and2_uxn_opcodes_h_l1063_c39_a0e1_ins,
opc_and2_uxn_opcodes_h_l1063_c39_a0e1_k,
opc_and2_uxn_opcodes_h_l1063_c39_a0e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_left,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_right,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_return_output);

-- result_MUX_uxn_opcodes_h_l1064_c7_633b
result_MUX_uxn_opcodes_h_l1064_c7_633b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1064_c7_633b_cond,
result_MUX_uxn_opcodes_h_l1064_c7_633b_iftrue,
result_MUX_uxn_opcodes_h_l1064_c7_633b_iffalse,
result_MUX_uxn_opcodes_h_l1064_c7_633b_return_output);

-- opc_ora_uxn_opcodes_h_l1064_c39_ee70
opc_ora_uxn_opcodes_h_l1064_c39_ee70 : entity work.opc_ora_0CLK_c28e6654 port map (
clk,
opc_ora_uxn_opcodes_h_l1064_c39_ee70_CLOCK_ENABLE,
opc_ora_uxn_opcodes_h_l1064_c39_ee70_stack_index,
opc_ora_uxn_opcodes_h_l1064_c39_ee70_ins,
opc_ora_uxn_opcodes_h_l1064_c39_ee70_k,
opc_ora_uxn_opcodes_h_l1064_c39_ee70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_left,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_right,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_return_output);

-- result_MUX_uxn_opcodes_h_l1065_c7_808b
result_MUX_uxn_opcodes_h_l1065_c7_808b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1065_c7_808b_cond,
result_MUX_uxn_opcodes_h_l1065_c7_808b_iftrue,
result_MUX_uxn_opcodes_h_l1065_c7_808b_iffalse,
result_MUX_uxn_opcodes_h_l1065_c7_808b_return_output);

-- opc_ora2_uxn_opcodes_h_l1065_c39_a408
opc_ora2_uxn_opcodes_h_l1065_c39_a408 : entity work.opc_ora2_0CLK_88a23eea port map (
clk,
opc_ora2_uxn_opcodes_h_l1065_c39_a408_CLOCK_ENABLE,
opc_ora2_uxn_opcodes_h_l1065_c39_a408_stack_index,
opc_ora2_uxn_opcodes_h_l1065_c39_a408_ins,
opc_ora2_uxn_opcodes_h_l1065_c39_a408_k,
opc_ora2_uxn_opcodes_h_l1065_c39_a408_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_left,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_right,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_return_output);

-- result_MUX_uxn_opcodes_h_l1066_c7_cdb3
result_MUX_uxn_opcodes_h_l1066_c7_cdb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1066_c7_cdb3_cond,
result_MUX_uxn_opcodes_h_l1066_c7_cdb3_iftrue,
result_MUX_uxn_opcodes_h_l1066_c7_cdb3_iffalse,
result_MUX_uxn_opcodes_h_l1066_c7_cdb3_return_output);

-- opc_eor_uxn_opcodes_h_l1066_c39_d395
opc_eor_uxn_opcodes_h_l1066_c39_d395 : entity work.opc_eor_0CLK_c28e6654 port map (
clk,
opc_eor_uxn_opcodes_h_l1066_c39_d395_CLOCK_ENABLE,
opc_eor_uxn_opcodes_h_l1066_c39_d395_stack_index,
opc_eor_uxn_opcodes_h_l1066_c39_d395_ins,
opc_eor_uxn_opcodes_h_l1066_c39_d395_k,
opc_eor_uxn_opcodes_h_l1066_c39_d395_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_return_output);

-- result_MUX_uxn_opcodes_h_l1067_c7_07f5
result_MUX_uxn_opcodes_h_l1067_c7_07f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1067_c7_07f5_cond,
result_MUX_uxn_opcodes_h_l1067_c7_07f5_iftrue,
result_MUX_uxn_opcodes_h_l1067_c7_07f5_iffalse,
result_MUX_uxn_opcodes_h_l1067_c7_07f5_return_output);

-- opc_eor2_uxn_opcodes_h_l1067_c39_9082
opc_eor2_uxn_opcodes_h_l1067_c39_9082 : entity work.opc_eor2_0CLK_88a23eea port map (
clk,
opc_eor2_uxn_opcodes_h_l1067_c39_9082_CLOCK_ENABLE,
opc_eor2_uxn_opcodes_h_l1067_c39_9082_stack_index,
opc_eor2_uxn_opcodes_h_l1067_c39_9082_ins,
opc_eor2_uxn_opcodes_h_l1067_c39_9082_k,
opc_eor2_uxn_opcodes_h_l1067_c39_9082_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_left,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_right,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_return_output);

-- result_MUX_uxn_opcodes_h_l1068_c7_41ea
result_MUX_uxn_opcodes_h_l1068_c7_41ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1068_c7_41ea_cond,
result_MUX_uxn_opcodes_h_l1068_c7_41ea_iftrue,
result_MUX_uxn_opcodes_h_l1068_c7_41ea_iffalse,
result_MUX_uxn_opcodes_h_l1068_c7_41ea_return_output);

-- opc_sft_uxn_opcodes_h_l1068_c39_2250
opc_sft_uxn_opcodes_h_l1068_c39_2250 : entity work.opc_sft_0CLK_4f311f70 port map (
clk,
opc_sft_uxn_opcodes_h_l1068_c39_2250_CLOCK_ENABLE,
opc_sft_uxn_opcodes_h_l1068_c39_2250_stack_index,
opc_sft_uxn_opcodes_h_l1068_c39_2250_ins,
opc_sft_uxn_opcodes_h_l1068_c39_2250_k,
opc_sft_uxn_opcodes_h_l1068_c39_2250_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_left,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_right,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_return_output);

-- result_MUX_uxn_opcodes_h_l1069_c7_5c66
result_MUX_uxn_opcodes_h_l1069_c7_5c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1069_c7_5c66_cond,
result_MUX_uxn_opcodes_h_l1069_c7_5c66_iftrue,
result_MUX_uxn_opcodes_h_l1069_c7_5c66_iffalse,
result_MUX_uxn_opcodes_h_l1069_c7_5c66_return_output);

-- opc_sft2_uxn_opcodes_h_l1069_c39_1a77
opc_sft2_uxn_opcodes_h_l1069_c39_1a77 : entity work.opc_sft2_0CLK_13d4e813 port map (
clk,
opc_sft2_uxn_opcodes_h_l1069_c39_1a77_CLOCK_ENABLE,
opc_sft2_uxn_opcodes_h_l1069_c39_1a77_stack_index,
opc_sft2_uxn_opcodes_h_l1069_c39_1a77_ins,
opc_sft2_uxn_opcodes_h_l1069_c39_1a77_k,
opc_sft2_uxn_opcodes_h_l1069_c39_1a77_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_return_output,
 result_MUX_uxn_opcodes_h_l1000_c2_3295_return_output,
 opc_brk_uxn_opcodes_h_l1000_c34_0bb7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_return_output,
 result_MUX_uxn_opcodes_h_l1001_c7_7499_return_output,
 opc_jci_uxn_opcodes_h_l1001_c39_f224_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_return_output,
 result_MUX_uxn_opcodes_h_l1002_c7_6f36_return_output,
 opc_jmi_uxn_opcodes_h_l1002_c39_0549_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_return_output,
 result_MUX_uxn_opcodes_h_l1003_c7_cde3_return_output,
 opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_return_output,
 result_MUX_uxn_opcodes_h_l1004_c7_2368_return_output,
 opc_lit_uxn_opcodes_h_l1004_c39_a53f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_return_output,
 result_MUX_uxn_opcodes_h_l1005_c7_f48a_return_output,
 opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_return_output,
 result_MUX_uxn_opcodes_h_l1006_c7_30fd_return_output,
 opc_litr_uxn_opcodes_h_l1006_c39_36be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_return_output,
 result_MUX_uxn_opcodes_h_l1007_c7_72aa_return_output,
 opc_lit2r_uxn_opcodes_h_l1007_c39_807f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_return_output,
 result_MUX_uxn_opcodes_h_l1008_c7_879d_return_output,
 opc_inc_uxn_opcodes_h_l1008_c39_680e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_return_output,
 result_MUX_uxn_opcodes_h_l1009_c7_9260_return_output,
 opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_return_output,
 result_MUX_uxn_opcodes_h_l1010_c7_8ad9_return_output,
 opc_pop_uxn_opcodes_h_l1010_c39_1668_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_return_output,
 result_MUX_uxn_opcodes_h_l1011_c7_c4c9_return_output,
 opc_pop2_uxn_opcodes_h_l1011_c39_4f95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_return_output,
 result_MUX_uxn_opcodes_h_l1012_c7_78a9_return_output,
 opc_nip_uxn_opcodes_h_l1012_c39_f23d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_return_output,
 result_MUX_uxn_opcodes_h_l1013_c7_5abc_return_output,
 opc_nip2_uxn_opcodes_h_l1013_c39_86b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_return_output,
 result_MUX_uxn_opcodes_h_l1014_c7_d146_return_output,
 opc_swp_uxn_opcodes_h_l1014_c39_6057_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_return_output,
 result_MUX_uxn_opcodes_h_l1015_c7_307c_return_output,
 opc_swp2_uxn_opcodes_h_l1015_c39_f047_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_return_output,
 result_MUX_uxn_opcodes_h_l1016_c7_814a_return_output,
 opc_rot_uxn_opcodes_h_l1016_c39_6ee8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_return_output,
 result_MUX_uxn_opcodes_h_l1017_c7_2599_return_output,
 opc_rot2_uxn_opcodes_h_l1017_c39_a43a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_return_output,
 result_MUX_uxn_opcodes_h_l1018_c7_7852_return_output,
 opc_dup_uxn_opcodes_h_l1018_c39_ed1c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_return_output,
 result_MUX_uxn_opcodes_h_l1019_c7_3567_return_output,
 opc_dup2_uxn_opcodes_h_l1019_c39_79f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_return_output,
 result_MUX_uxn_opcodes_h_l1020_c7_8e81_return_output,
 opc_ovr_uxn_opcodes_h_l1020_c39_8e77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_return_output,
 result_MUX_uxn_opcodes_h_l1021_c7_0ef7_return_output,
 opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_return_output,
 result_MUX_uxn_opcodes_h_l1022_c7_b2f3_return_output,
 opc_equ_uxn_opcodes_h_l1022_c39_036f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_return_output,
 result_MUX_uxn_opcodes_h_l1023_c7_2922_return_output,
 opc_equ2_uxn_opcodes_h_l1023_c39_ea78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_return_output,
 result_MUX_uxn_opcodes_h_l1024_c7_b3fa_return_output,
 opc_neq_uxn_opcodes_h_l1024_c39_e004_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_return_output,
 result_MUX_uxn_opcodes_h_l1025_c7_c74f_return_output,
 opc_neq2_uxn_opcodes_h_l1025_c39_e04e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_return_output,
 result_MUX_uxn_opcodes_h_l1026_c7_9a91_return_output,
 opc_gth_uxn_opcodes_h_l1026_c39_fd76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_return_output,
 result_MUX_uxn_opcodes_h_l1027_c7_ca1b_return_output,
 opc_gth2_uxn_opcodes_h_l1027_c39_c423_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_return_output,
 result_MUX_uxn_opcodes_h_l1028_c7_462f_return_output,
 opc_lth_uxn_opcodes_h_l1028_c39_a09a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_return_output,
 result_MUX_uxn_opcodes_h_l1029_c7_7b7b_return_output,
 opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_return_output,
 result_MUX_uxn_opcodes_h_l1030_c7_4804_return_output,
 opc_jmp_uxn_opcodes_h_l1030_c39_00ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_return_output,
 result_MUX_uxn_opcodes_h_l1031_c7_273d_return_output,
 opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_return_output,
 result_MUX_uxn_opcodes_h_l1032_c7_2296_return_output,
 opc_jcn_uxn_opcodes_h_l1032_c39_749e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_return_output,
 result_MUX_uxn_opcodes_h_l1033_c7_51d1_return_output,
 opc_jcn2_uxn_opcodes_h_l1033_c39_5568_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_return_output,
 result_MUX_uxn_opcodes_h_l1034_c7_aced_return_output,
 opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_return_output,
 result_MUX_uxn_opcodes_h_l1035_c7_2527_return_output,
 opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_return_output,
 result_MUX_uxn_opcodes_h_l1036_c7_921a_return_output,
 opc_sth_uxn_opcodes_h_l1036_c39_b171_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_return_output,
 result_MUX_uxn_opcodes_h_l1037_c7_a56a_return_output,
 opc_sth2_uxn_opcodes_h_l1037_c39_3575_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_return_output,
 result_MUX_uxn_opcodes_h_l1038_c7_c06d_return_output,
 opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_return_output,
 result_MUX_uxn_opcodes_h_l1039_c7_3c6d_return_output,
 opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_return_output,
 result_MUX_uxn_opcodes_h_l1040_c7_8044_return_output,
 opc_stz_uxn_opcodes_h_l1040_c39_4e7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_return_output,
 result_MUX_uxn_opcodes_h_l1041_c7_7fd2_return_output,
 opc_stz2_uxn_opcodes_h_l1041_c39_c70c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_return_output,
 result_MUX_uxn_opcodes_h_l1042_c7_59b6_return_output,
 opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_return_output,
 result_MUX_uxn_opcodes_h_l1043_c7_94cd_return_output,
 opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_return_output,
 result_MUX_uxn_opcodes_h_l1044_c7_bc59_return_output,
 opc_str_uxn_opcodes_h_l1044_c39_d36a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_return_output,
 result_MUX_uxn_opcodes_h_l1045_c7_633b_return_output,
 opc_str2_uxn_opcodes_h_l1045_c39_ca6b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_return_output,
 result_MUX_uxn_opcodes_h_l1046_c7_0b3d_return_output,
 opc_lda_uxn_opcodes_h_l1046_c39_ced1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_return_output,
 result_MUX_uxn_opcodes_h_l1047_c7_a82c_return_output,
 opc_lda2_uxn_opcodes_h_l1047_c39_76a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_return_output,
 result_MUX_uxn_opcodes_h_l1048_c7_72e3_return_output,
 opc_sta_uxn_opcodes_h_l1048_c39_051e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_return_output,
 result_MUX_uxn_opcodes_h_l1049_c7_9c56_return_output,
 opc_sta2_uxn_opcodes_h_l1049_c39_2b32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_return_output,
 result_MUX_uxn_opcodes_h_l1050_c7_db9e_return_output,
 opc_dei_uxn_opcodes_h_l1050_c39_28e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_return_output,
 result_MUX_uxn_opcodes_h_l1051_c7_6b7e_return_output,
 opc_dei2_uxn_opcodes_h_l1051_c39_e46f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_return_output,
 result_MUX_uxn_opcodes_h_l1052_c7_bee1_return_output,
 opc_deo_uxn_opcodes_h_l1052_c39_69b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_return_output,
 result_MUX_uxn_opcodes_h_l1053_c7_f2da_return_output,
 opc_deo2_uxn_opcodes_h_l1053_c39_cc30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_return_output,
 result_MUX_uxn_opcodes_h_l1054_c7_35d8_return_output,
 opc_add_uxn_opcodes_h_l1054_c39_c851_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_return_output,
 result_MUX_uxn_opcodes_h_l1055_c7_d1b7_return_output,
 opc_add2_uxn_opcodes_h_l1055_c39_61d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_return_output,
 result_MUX_uxn_opcodes_h_l1056_c7_a347_return_output,
 opc_sub_uxn_opcodes_h_l1056_c39_9af1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_return_output,
 result_MUX_uxn_opcodes_h_l1057_c7_d8d8_return_output,
 opc_sub2_uxn_opcodes_h_l1057_c39_699e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_return_output,
 result_MUX_uxn_opcodes_h_l1058_c7_0436_return_output,
 opc_mul_uxn_opcodes_h_l1058_c39_14bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_return_output,
 result_MUX_uxn_opcodes_h_l1059_c7_d385_return_output,
 opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_return_output,
 result_MUX_uxn_opcodes_h_l1060_c7_310c_return_output,
 opc_div_uxn_opcodes_h_l1060_c39_dec5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_return_output,
 result_MUX_uxn_opcodes_h_l1061_c7_76c7_return_output,
 opc_div2_uxn_opcodes_h_l1061_c39_de16_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_return_output,
 result_MUX_uxn_opcodes_h_l1062_c7_e68d_return_output,
 opc_and_uxn_opcodes_h_l1062_c39_beee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_return_output,
 result_MUX_uxn_opcodes_h_l1063_c7_b7b0_return_output,
 opc_and2_uxn_opcodes_h_l1063_c39_a0e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_return_output,
 result_MUX_uxn_opcodes_h_l1064_c7_633b_return_output,
 opc_ora_uxn_opcodes_h_l1064_c39_ee70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_return_output,
 result_MUX_uxn_opcodes_h_l1065_c7_808b_return_output,
 opc_ora2_uxn_opcodes_h_l1065_c39_a408_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_return_output,
 result_MUX_uxn_opcodes_h_l1066_c7_cdb3_return_output,
 opc_eor_uxn_opcodes_h_l1066_c39_d395_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_return_output,
 result_MUX_uxn_opcodes_h_l1067_c7_07f5_return_output,
 opc_eor2_uxn_opcodes_h_l1067_c39_9082_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_return_output,
 result_MUX_uxn_opcodes_h_l1068_c7_41ea_return_output,
 opc_sft_uxn_opcodes_h_l1068_c39_2250_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_return_output,
 result_MUX_uxn_opcodes_h_l1069_c7_5c66_return_output,
 opc_sft2_uxn_opcodes_h_l1069_c39_1a77_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_opcode : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_3295_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_3295_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_7499_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_3295_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_3295_cond : unsigned(0 downto 0);
 variable VAR_opc_brk_uxn_opcodes_h_l1000_c34_0bb7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_7499_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_7499_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_6f36_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_7499_cond : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_f224_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_f224_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_f224_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_6f36_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_6f36_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_cde3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_6f36_cond : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_0549_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_0549_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_cde3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_cde3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_2368_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_cde3_cond : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_ins : unsigned(7 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_2368_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_2368_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_f48a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_2368_cond : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_a53f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_a53f_ins : unsigned(7 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_a53f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_a53f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_f48a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_f48a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_30fd_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_f48a_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_30fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_30fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_72aa_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_30fd_cond : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_36be_stack_index : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_36be_ins : unsigned(7 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_36be_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_36be_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_72aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_72aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_879d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_72aa_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_807f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_807f_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_807f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_807f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_879d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_879d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_9260_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_879d_cond : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_680e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_680e_ins : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_680e_k : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_680e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_680e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_9260_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_9260_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_8ad9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_9260_cond : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_ins : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_k : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_8ad9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_8ad9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_c4c9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_8ad9_cond : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_1668_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_1668_ins : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_1668_k : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_1668_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_1668_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_c4c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_c4c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_78a9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_c4c9_cond : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_4f95_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_4f95_ins : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_4f95_k : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_4f95_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_4f95_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_78a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_78a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_5abc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_78a9_cond : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_f23d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_f23d_ins : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_f23d_k : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_f23d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_f23d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_5abc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_5abc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_d146_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_5abc_cond : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_86b9_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_86b9_ins : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_86b9_k : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_86b9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_86b9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_d146_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_d146_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_307c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_d146_cond : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_6057_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_6057_ins : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_6057_k : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_6057_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_6057_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_307c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_307c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_814a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_307c_cond : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f047_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f047_ins : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f047_k : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f047_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f047_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_814a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_814a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_2599_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_814a_cond : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_6ee8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_6ee8_ins : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_6ee8_k : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_6ee8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_6ee8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_2599_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_2599_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_7852_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_2599_cond : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a43a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a43a_ins : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a43a_k : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a43a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a43a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_7852_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_7852_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_3567_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_7852_cond : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_ed1c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_ed1c_ins : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_ed1c_k : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_ed1c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_ed1c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_3567_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_3567_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_8e81_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_3567_cond : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_79f2_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_79f2_ins : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_79f2_k : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_79f2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_79f2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_8e81_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_8e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_0ef7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_8e81_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8e77_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8e77_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8e77_k : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8e77_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8e77_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_0ef7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_0ef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_b2f3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_0ef7_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_k : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_b2f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_b2f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_2922_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_b2f3_cond : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_036f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_036f_ins : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_036f_k : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_036f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_036f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_2922_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_2922_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_b3fa_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_2922_cond : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_ea78_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_ea78_ins : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_ea78_k : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_ea78_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_ea78_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_b3fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_b3fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_c74f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_b3fa_cond : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_e004_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_e004_ins : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_e004_k : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_e004_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_e004_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_c74f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_c74f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_9a91_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_c74f_cond : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e04e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e04e_ins : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e04e_k : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e04e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e04e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_9a91_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_9a91_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_ca1b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_9a91_cond : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_fd76_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_fd76_ins : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_fd76_k : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_fd76_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_fd76_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_ca1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_ca1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_462f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_ca1b_cond : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_c423_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_c423_ins : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_c423_k : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_c423_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_c423_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_462f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_462f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_7b7b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_462f_cond : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_a09a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_a09a_ins : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_a09a_k : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_a09a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_a09a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_7b7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_7b7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_4804_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_7b7b_cond : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_ins : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_k : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_4804_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_4804_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_273d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_4804_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_00ca_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_00ca_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_00ca_k : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_00ca_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_00ca_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_273d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_273d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_2296_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_273d_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_k : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_2296_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_2296_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_51d1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_2296_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_749e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_749e_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_749e_k : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_749e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_749e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_51d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_51d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_aced_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_51d1_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_5568_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_5568_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_5568_k : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_5568_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_5568_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_aced_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_aced_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_2527_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_aced_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_k : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_2527_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_2527_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_921a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_2527_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_k : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_921a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_921a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_a56a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_921a_cond : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_b171_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_b171_ins : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_b171_k : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_b171_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_b171_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_a56a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_a56a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_c06d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_a56a_cond : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3575_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3575_ins : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3575_k : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3575_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3575_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_c06d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_c06d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_3c6d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_c06d_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_k : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_3c6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_3c6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_8044_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_3c6d_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_k : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_8044_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_8044_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_7fd2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_8044_cond : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_4e7a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_4e7a_ins : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_4e7a_k : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_4e7a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_4e7a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_7fd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_7fd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_59b6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_7fd2_cond : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_c70c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_c70c_ins : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_c70c_k : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_c70c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_c70c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_59b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_59b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_94cd_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_59b6_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_k : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_94cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_94cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_bc59_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_94cd_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_k : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_bc59_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_bc59_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_633b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_bc59_cond : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_d36a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_d36a_ins : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_d36a_k : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_d36a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_d36a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_633b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_633b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_0b3d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_633b_cond : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_ca6b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_ca6b_ins : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_ca6b_k : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_ca6b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_ca6b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_0b3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_0b3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_a82c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_0b3d_cond : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_ced1_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_ced1_ins : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_ced1_k : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_ced1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_ced1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_a82c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_a82c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_72e3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_a82c_cond : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_76a3_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_76a3_ins : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_76a3_k : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_76a3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_76a3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_72e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_72e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_9c56_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_72e3_cond : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_051e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_051e_ins : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_051e_k : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_051e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_051e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_9c56_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_9c56_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_db9e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_9c56_cond : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_2b32_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_2b32_ins : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_2b32_k : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_2b32_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_2b32_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_db9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_db9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_6b7e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_db9e_cond : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_28e3_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_28e3_ins : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_28e3_k : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_28e3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_28e3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_6b7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_6b7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_bee1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_6b7e_cond : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e46f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e46f_ins : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e46f_k : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e46f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e46f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_bee1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_bee1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_f2da_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_bee1_cond : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_69b6_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_69b6_ins : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_69b6_k : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_69b6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_69b6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_f2da_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_f2da_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_35d8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_f2da_cond : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_cc30_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_cc30_ins : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_cc30_k : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_cc30_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_cc30_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_35d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_35d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_d1b7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_35d8_cond : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_c851_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_c851_ins : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_c851_k : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_c851_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_c851_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_d1b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_d1b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_a347_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_d1b7_cond : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_61d6_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_61d6_ins : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_61d6_k : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_61d6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_61d6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_a347_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_a347_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_d8d8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_a347_cond : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_9af1_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_9af1_ins : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_9af1_k : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_9af1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_9af1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_d8d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_d8d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_0436_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_d8d8_cond : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_699e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_699e_ins : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_699e_k : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_699e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_699e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_0436_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_0436_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_d385_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_0436_cond : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_14bf_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_14bf_ins : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_14bf_k : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_14bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_14bf_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_d385_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_d385_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_310c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_d385_cond : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_ins : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_k : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_310c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_310c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_76c7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_310c_cond : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_dec5_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_dec5_ins : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_dec5_k : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_dec5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_dec5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_76c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_76c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_e68d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_76c7_cond : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_de16_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_de16_ins : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_de16_k : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_de16_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_de16_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_e68d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_e68d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_b7b0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_e68d_cond : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_beee_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_beee_ins : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_beee_k : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_beee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_beee_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_b7b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_b7b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_633b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_b7b0_cond : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_a0e1_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_a0e1_ins : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_a0e1_k : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_a0e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_a0e1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_633b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_633b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_808b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_633b_cond : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_ee70_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_ee70_ins : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_ee70_k : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_ee70_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_ee70_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_808b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_808b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_cdb3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_808b_cond : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_a408_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_a408_ins : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_a408_k : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_a408_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_a408_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_cdb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_cdb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_07f5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_cdb3_cond : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_d395_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_d395_ins : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_d395_k : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_d395_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_d395_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_07f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_07f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_41ea_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_07f5_cond : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9082_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9082_ins : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9082_k : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9082_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9082_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_41ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_41ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_5c66_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_41ea_cond : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_2250_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_2250_ins : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_2250_k : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_2250_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_2250_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_5c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_5c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_5c66_cond : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_1a77_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_1a77_ins : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_1a77_k : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_1a77_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_1a77_return_output : unsigned(0 downto 0);
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_right := to_unsigned(11, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_right := to_unsigned(251, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_right := to_unsigned(42, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_right := to_unsigned(250, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_right := to_unsigned(43, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_right := to_unsigned(39, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_right := to_unsigned(60, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_right := to_unsigned(47, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_right := to_unsigned(41, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_right := to_unsigned(40, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_right := to_unsigned(23, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_right := to_unsigned(62, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_right := to_unsigned(48, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_right := to_unsigned(51, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_right := to_unsigned(54, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_right := to_unsigned(19, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_right := to_unsigned(252, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_right := to_unsigned(53, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_right := to_unsigned(61, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_right := to_unsigned(20, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_right := to_unsigned(59, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_right := to_unsigned(31, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_right := to_unsigned(26, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_right := to_unsigned(35, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_right := to_unsigned(13, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_right := to_unsigned(24, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_right := to_unsigned(50, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_right := to_unsigned(34, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_right := to_unsigned(30, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_right := to_unsigned(52, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_right := to_unsigned(57, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_5c66_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_right := to_unsigned(37, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_right := to_unsigned(56, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_right := to_unsigned(16, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_right := to_unsigned(28, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_right := to_unsigned(12, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_right := to_unsigned(21, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_right := to_unsigned(55, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_right := to_unsigned(36, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_right := to_unsigned(45, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_right := to_unsigned(49, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_right := to_unsigned(46, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_right := to_unsigned(17, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_right := to_unsigned(254, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_right := to_unsigned(253, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_right := to_unsigned(38, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_right := to_unsigned(29, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_right := to_unsigned(44, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_right := to_unsigned(249, 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_iffalse := VAR_CLOCK_ENABLE;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_61d6_ins := VAR_ins;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_c851_ins := VAR_ins;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_a0e1_ins := VAR_ins;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_beee_ins := VAR_ins;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e46f_ins := VAR_ins;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_28e3_ins := VAR_ins;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_cc30_ins := VAR_ins;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_69b6_ins := VAR_ins;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_de16_ins := VAR_ins;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_dec5_ins := VAR_ins;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_79f2_ins := VAR_ins;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_ed1c_ins := VAR_ins;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9082_ins := VAR_ins;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_d395_ins := VAR_ins;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_ea78_ins := VAR_ins;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_036f_ins := VAR_ins;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_c423_ins := VAR_ins;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_fd76_ins := VAR_ins;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_ins := VAR_ins;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_680e_ins := VAR_ins;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_5568_ins := VAR_ins;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_749e_ins := VAR_ins;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_ins := VAR_ins;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_00ca_ins := VAR_ins;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_ins := VAR_ins;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_ins := VAR_ins;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_ins := VAR_ins;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_76a3_ins := VAR_ins;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_ced1_ins := VAR_ins;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_ins := VAR_ins;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_ins := VAR_ins;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_ins := VAR_ins;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_ins := VAR_ins;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_ins := VAR_ins;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_807f_ins := VAR_ins;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_a53f_ins := VAR_ins;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_36be_ins := VAR_ins;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_ins := VAR_ins;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_a09a_ins := VAR_ins;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_ins := VAR_ins;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_14bf_ins := VAR_ins;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e04e_ins := VAR_ins;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_e004_ins := VAR_ins;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_86b9_ins := VAR_ins;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_f23d_ins := VAR_ins;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_a408_ins := VAR_ins;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_ee70_ins := VAR_ins;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_ins := VAR_ins;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8e77_ins := VAR_ins;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_4f95_ins := VAR_ins;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_1668_ins := VAR_ins;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a43a_ins := VAR_ins;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_6ee8_ins := VAR_ins;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_1a77_ins := VAR_ins;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_2250_ins := VAR_ins;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_2b32_ins := VAR_ins;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_051e_ins := VAR_ins;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3575_ins := VAR_ins;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_b171_ins := VAR_ins;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_ca6b_ins := VAR_ins;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_d36a_ins := VAR_ins;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_c70c_ins := VAR_ins;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_4e7a_ins := VAR_ins;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_699e_ins := VAR_ins;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_9af1_ins := VAR_ins;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f047_ins := VAR_ins;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_6057_ins := VAR_ins;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_61d6_k := VAR_k;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_c851_k := VAR_k;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_a0e1_k := VAR_k;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_beee_k := VAR_k;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e46f_k := VAR_k;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_28e3_k := VAR_k;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_cc30_k := VAR_k;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_69b6_k := VAR_k;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_de16_k := VAR_k;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_dec5_k := VAR_k;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_79f2_k := VAR_k;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_ed1c_k := VAR_k;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9082_k := VAR_k;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_d395_k := VAR_k;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_ea78_k := VAR_k;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_036f_k := VAR_k;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_c423_k := VAR_k;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_fd76_k := VAR_k;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_k := VAR_k;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_680e_k := VAR_k;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_5568_k := VAR_k;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_749e_k := VAR_k;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_k := VAR_k;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_00ca_k := VAR_k;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_k := VAR_k;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_k := VAR_k;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_76a3_k := VAR_k;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_ced1_k := VAR_k;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_k := VAR_k;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_k := VAR_k;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_k := VAR_k;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_k := VAR_k;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_k := VAR_k;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_a09a_k := VAR_k;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_k := VAR_k;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_14bf_k := VAR_k;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e04e_k := VAR_k;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_e004_k := VAR_k;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_86b9_k := VAR_k;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_f23d_k := VAR_k;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_a408_k := VAR_k;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_ee70_k := VAR_k;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_k := VAR_k;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8e77_k := VAR_k;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_4f95_k := VAR_k;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_1668_k := VAR_k;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a43a_k := VAR_k;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_6ee8_k := VAR_k;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_1a77_k := VAR_k;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_2250_k := VAR_k;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_2b32_k := VAR_k;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_051e_k := VAR_k;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3575_k := VAR_k;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_b171_k := VAR_k;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_ca6b_k := VAR_k;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_d36a_k := VAR_k;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_c70c_k := VAR_k;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_4e7a_k := VAR_k;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_699e_k := VAR_k;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_9af1_k := VAR_k;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f047_k := VAR_k;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_6057_k := VAR_k;
     REG_VAR_l16 := l16;
     REG_VAR_l8 := l8;
     REG_VAR_n16 := n16;
     REG_VAR_n8 := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_left := VAR_opcode;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_61d6_stack_index := VAR_stack_index;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_c851_stack_index := VAR_stack_index;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_a0e1_stack_index := VAR_stack_index;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_beee_stack_index := VAR_stack_index;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e46f_stack_index := VAR_stack_index;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_28e3_stack_index := VAR_stack_index;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_cc30_stack_index := VAR_stack_index;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_69b6_stack_index := VAR_stack_index;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_de16_stack_index := VAR_stack_index;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_dec5_stack_index := VAR_stack_index;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_79f2_stack_index := VAR_stack_index;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_ed1c_stack_index := VAR_stack_index;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9082_stack_index := VAR_stack_index;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_d395_stack_index := VAR_stack_index;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_ea78_stack_index := VAR_stack_index;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_036f_stack_index := VAR_stack_index;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_c423_stack_index := VAR_stack_index;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_fd76_stack_index := VAR_stack_index;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_stack_index := VAR_stack_index;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_680e_stack_index := VAR_stack_index;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_f224_stack_index := VAR_stack_index;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_5568_stack_index := VAR_stack_index;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_749e_stack_index := VAR_stack_index;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_stack_index := VAR_stack_index;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_00ca_stack_index := VAR_stack_index;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_stack_index := VAR_stack_index;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_stack_index := VAR_stack_index;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_76a3_stack_index := VAR_stack_index;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_ced1_stack_index := VAR_stack_index;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_stack_index := VAR_stack_index;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_stack_index := VAR_stack_index;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_stack_index := VAR_stack_index;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_stack_index := VAR_stack_index;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_stack_index := VAR_stack_index;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_807f_stack_index := VAR_stack_index;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_a53f_stack_index := VAR_stack_index;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_36be_stack_index := VAR_stack_index;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_stack_index := VAR_stack_index;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_a09a_stack_index := VAR_stack_index;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_stack_index := VAR_stack_index;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_14bf_stack_index := VAR_stack_index;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e04e_stack_index := VAR_stack_index;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_e004_stack_index := VAR_stack_index;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_86b9_stack_index := VAR_stack_index;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_f23d_stack_index := VAR_stack_index;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_a408_stack_index := VAR_stack_index;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_ee70_stack_index := VAR_stack_index;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_stack_index := VAR_stack_index;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8e77_stack_index := VAR_stack_index;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_4f95_stack_index := VAR_stack_index;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_1668_stack_index := VAR_stack_index;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a43a_stack_index := VAR_stack_index;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_6ee8_stack_index := VAR_stack_index;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_1a77_stack_index := VAR_stack_index;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_2250_stack_index := VAR_stack_index;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_2b32_stack_index := VAR_stack_index;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_051e_stack_index := VAR_stack_index;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3575_stack_index := VAR_stack_index;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_b171_stack_index := VAR_stack_index;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_ca6b_stack_index := VAR_stack_index;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_d36a_stack_index := VAR_stack_index;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_c70c_stack_index := VAR_stack_index;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_4e7a_stack_index := VAR_stack_index;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_699e_stack_index := VAR_stack_index;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_9af1_stack_index := VAR_stack_index;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f047_stack_index := VAR_stack_index;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_6057_stack_index := VAR_stack_index;
     REG_VAR_t16 := t16;
     REG_VAR_t8 := t8;
     REG_VAR_tmp16 := tmp16;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_09b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_e960] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_9748] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_left;
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_return_output := BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_65a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_e758] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_left;
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_return_output := BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_9c24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_left;
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_return_output := BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_55b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_return_output;

     -- opc_brk[uxn_opcodes_h_l1000_c34_0bb7] LATENCY=0
     -- Inputs
     -- Outputs
     VAR_opc_brk_uxn_opcodes_h_l1000_c34_0bb7_return_output := opc_brk_uxn_opcodes_h_l1000_c34_0bb7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_b286] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_left;
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_return_output := BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_c726] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_left;
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_return_output := BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_1f8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_9e19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_left;
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_return_output := BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_1819] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_left;
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_return_output := BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_2169] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_left;
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_return_output := BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_b317] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_left;
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_return_output := BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_cde5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_bc96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_left;
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_return_output := BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_cbec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_73c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_5c07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_left;
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_return_output := BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_0cb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_3ec8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_71fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_09a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_162f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_3ff5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_3742] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_left;
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_return_output := BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_479f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_0536] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_left;
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_return_output := BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_26e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_114b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_7437] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_left;
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_return_output := BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_43c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_b337] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_left;
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_return_output := BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_5542] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_left;
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_return_output := BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_f963] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_9ac1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_87b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_9635] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_left;
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_return_output := BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_a993] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_left;
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_return_output := BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_a32d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_c84f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_8be8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_ba33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_left;
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_return_output := BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_1210] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_left;
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_return_output := BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_0ee8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_bdd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_6291] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_left;
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_return_output := BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_345c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_733b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_74e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_744d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_d3d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_4ffe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_2004] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_left;
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_return_output := BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_9b98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_7754] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_left;
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_return_output := BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_df84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_left;
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_return_output := BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_b0e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_eef8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_cb94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_left;
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_return_output := BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_9350] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_left;
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_return_output := BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_c8f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_3bc5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_b535] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_84ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_55d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_7f17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_left;
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_return_output := BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_7ee5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_029f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_a3d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_3295_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_ba33_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_7499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_b535_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_6f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_bc96_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_cde3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9b98_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_2368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_73c7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_f48a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_09a9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_30fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_5c07_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_72aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_744d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_879d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_9748_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_9260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_1210_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_8ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_9635_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_c4c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_65a3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_78a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_2169_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_5abc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_71fa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_d146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_55d0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_307c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_55b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_814a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_9350_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_2599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_b0e4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_7852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_7754_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_3567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_9c24_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_8e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_3742_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_0ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_c8f8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_b2f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_0ee8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_2922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_43c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_b3fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_0536_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_c74f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_df84_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_9a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_345c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_ca1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_3bc5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_462f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_9e19_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_7b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_8be8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_4804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_114b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_273d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_6291_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_2296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_c84f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_51d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_7437_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_aced_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_029f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_2527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_7f17_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_921a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_1819_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_a56a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_3ff5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_c06d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_eef8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_3c6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_87b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_8044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_a3d0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_7fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_479f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_59b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_bdd8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_94cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_a32d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_bc59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_b286_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_633b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_b317_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_0b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_cb94_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_a82c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_26e4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_72e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_c726_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_9c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_09b0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_db9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_74e4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_6b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_2004_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_bee1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_5542_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_f2da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_9ac1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_35d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_84ca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_d1b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f963_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_a347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_cbec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_d8d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_a993_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_0436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_cde5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_d385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b337_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_310c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_7ee5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_76c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_733b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_e68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0cb9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_b7b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_e960_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_633b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_1f8a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_808b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_e758_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_cdb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_4ffe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_07f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_d3d1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_41ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_3ec8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_5c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_162f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_3295_iftrue := VAR_opc_brk_uxn_opcodes_h_l1000_c34_0bb7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_7499] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_7499_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_6f36] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_72a5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_6f36_return_output;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_f224_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_72a5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_cde3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_ef4e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_return_output;

     -- opc_jci[uxn_opcodes_h_l1001_c39_f224] LATENCY=0
     -- Clock enable
     opc_jci_uxn_opcodes_h_l1001_c39_f224_CLOCK_ENABLE <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_f224_CLOCK_ENABLE;
     -- Inputs
     opc_jci_uxn_opcodes_h_l1001_c39_f224_stack_index <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_f224_stack_index;
     -- Outputs
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_f224_return_output := opc_jci_uxn_opcodes_h_l1001_c39_f224_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_cde3_return_output;
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_0549_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_ef4e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_7499_iftrue := VAR_opc_jci_uxn_opcodes_h_l1001_c39_f224_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_d330] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_return_output;

     -- opc_jmi[uxn_opcodes_h_l1002_c39_0549] LATENCY=0
     -- Clock enable
     opc_jmi_uxn_opcodes_h_l1002_c39_0549_CLOCK_ENABLE <= VAR_opc_jmi_uxn_opcodes_h_l1002_c39_0549_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_0549_return_output := opc_jmi_uxn_opcodes_h_l1002_c39_0549_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_2368] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2368_return_output;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_d330_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_6f36_iftrue := VAR_opc_jmi_uxn_opcodes_h_l1002_c39_0549_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_f48a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_return_output;

     -- opc_jsi[uxn_opcodes_h_l1003_c39_9d7c] LATENCY=0
     -- Clock enable
     opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_CLOCK_ENABLE <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_CLOCK_ENABLE;
     -- Inputs
     opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_ins <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_ins;
     -- Outputs
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_return_output := opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_1d4f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_f48a_return_output;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_a53f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_1d4f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_cde3_iftrue := VAR_opc_jsi_uxn_opcodes_h_l1003_c39_9d7c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_4daa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_30fd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_return_output;

     -- opc_lit[uxn_opcodes_h_l1004_c39_a53f] LATENCY=0
     -- Clock enable
     opc_lit_uxn_opcodes_h_l1004_c39_a53f_CLOCK_ENABLE <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_a53f_CLOCK_ENABLE;
     -- Inputs
     opc_lit_uxn_opcodes_h_l1004_c39_a53f_stack_index <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_a53f_stack_index;
     opc_lit_uxn_opcodes_h_l1004_c39_a53f_ins <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_a53f_ins;
     -- Outputs
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_a53f_return_output := opc_lit_uxn_opcodes_h_l1004_c39_a53f_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_30fd_return_output;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_4daa_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_2368_iftrue := VAR_opc_lit_uxn_opcodes_h_l1004_c39_a53f_return_output;
     -- opc_lit2[uxn_opcodes_h_l1005_c39_dcc8] LATENCY=0
     -- Clock enable
     opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_CLOCK_ENABLE <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_CLOCK_ENABLE;
     -- Inputs
     opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_stack_index <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_stack_index;
     opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_ins <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_ins;
     -- Outputs
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_return_output := opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_72aa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_632d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_72aa_return_output;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_36be_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_632d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_f48a_iftrue := VAR_opc_lit2_uxn_opcodes_h_l1005_c39_dcc8_return_output;
     -- opc_litr[uxn_opcodes_h_l1006_c39_36be] LATENCY=0
     -- Clock enable
     opc_litr_uxn_opcodes_h_l1006_c39_36be_CLOCK_ENABLE <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_36be_CLOCK_ENABLE;
     -- Inputs
     opc_litr_uxn_opcodes_h_l1006_c39_36be_stack_index <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_36be_stack_index;
     opc_litr_uxn_opcodes_h_l1006_c39_36be_ins <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_36be_ins;
     -- Outputs
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_36be_return_output := opc_litr_uxn_opcodes_h_l1006_c39_36be_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_879d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_942d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_879d_return_output;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_807f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_942d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_30fd_iftrue := VAR_opc_litr_uxn_opcodes_h_l1006_c39_36be_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_e1b1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_return_output;

     -- opc_lit2r[uxn_opcodes_h_l1007_c39_807f] LATENCY=0
     -- Clock enable
     opc_lit2r_uxn_opcodes_h_l1007_c39_807f_CLOCK_ENABLE <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_807f_CLOCK_ENABLE;
     -- Inputs
     opc_lit2r_uxn_opcodes_h_l1007_c39_807f_stack_index <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_807f_stack_index;
     opc_lit2r_uxn_opcodes_h_l1007_c39_807f_ins <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_807f_ins;
     -- Outputs
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_807f_return_output := opc_lit2r_uxn_opcodes_h_l1007_c39_807f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_9260] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_9260_return_output;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_680e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_e1b1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_72aa_iftrue := VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_807f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_387e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_return_output;

     -- opc_inc[uxn_opcodes_h_l1008_c39_680e] LATENCY=0
     -- Clock enable
     opc_inc_uxn_opcodes_h_l1008_c39_680e_CLOCK_ENABLE <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_680e_CLOCK_ENABLE;
     -- Inputs
     opc_inc_uxn_opcodes_h_l1008_c39_680e_stack_index <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_680e_stack_index;
     opc_inc_uxn_opcodes_h_l1008_c39_680e_ins <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_680e_ins;
     opc_inc_uxn_opcodes_h_l1008_c39_680e_k <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_680e_k;
     -- Outputs
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_680e_return_output := opc_inc_uxn_opcodes_h_l1008_c39_680e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_8ad9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_8ad9_return_output;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_387e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_879d_iftrue := VAR_opc_inc_uxn_opcodes_h_l1008_c39_680e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_c4c9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_f4d8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_return_output;

     -- opc_inc2[uxn_opcodes_h_l1009_c39_b7c5] LATENCY=0
     -- Clock enable
     opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_CLOCK_ENABLE <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_CLOCK_ENABLE;
     -- Inputs
     opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_stack_index <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_stack_index;
     opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_ins <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_ins;
     opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_k <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_k;
     -- Outputs
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_return_output := opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_c4c9_return_output;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_1668_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_f4d8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_9260_iftrue := VAR_opc_inc2_uxn_opcodes_h_l1009_c39_b7c5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_bb6f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_78a9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_return_output;

     -- opc_pop[uxn_opcodes_h_l1010_c39_1668] LATENCY=0
     -- Clock enable
     opc_pop_uxn_opcodes_h_l1010_c39_1668_CLOCK_ENABLE <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_1668_CLOCK_ENABLE;
     -- Inputs
     opc_pop_uxn_opcodes_h_l1010_c39_1668_stack_index <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_1668_stack_index;
     opc_pop_uxn_opcodes_h_l1010_c39_1668_ins <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_1668_ins;
     opc_pop_uxn_opcodes_h_l1010_c39_1668_k <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_1668_k;
     -- Outputs
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_1668_return_output := opc_pop_uxn_opcodes_h_l1010_c39_1668_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_78a9_return_output;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_4f95_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_bb6f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_8ad9_iftrue := VAR_opc_pop_uxn_opcodes_h_l1010_c39_1668_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_62d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_5abc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_return_output;

     -- opc_pop2[uxn_opcodes_h_l1011_c39_4f95] LATENCY=0
     -- Clock enable
     opc_pop2_uxn_opcodes_h_l1011_c39_4f95_CLOCK_ENABLE <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_4f95_CLOCK_ENABLE;
     -- Inputs
     opc_pop2_uxn_opcodes_h_l1011_c39_4f95_stack_index <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_4f95_stack_index;
     opc_pop2_uxn_opcodes_h_l1011_c39_4f95_ins <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_4f95_ins;
     opc_pop2_uxn_opcodes_h_l1011_c39_4f95_k <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_4f95_k;
     -- Outputs
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_4f95_return_output := opc_pop2_uxn_opcodes_h_l1011_c39_4f95_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_5abc_return_output;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_f23d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_62d4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_c4c9_iftrue := VAR_opc_pop2_uxn_opcodes_h_l1011_c39_4f95_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_38a8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_d146] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_return_output;

     -- opc_nip[uxn_opcodes_h_l1012_c39_f23d] LATENCY=0
     -- Clock enable
     opc_nip_uxn_opcodes_h_l1012_c39_f23d_CLOCK_ENABLE <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_f23d_CLOCK_ENABLE;
     -- Inputs
     opc_nip_uxn_opcodes_h_l1012_c39_f23d_stack_index <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_f23d_stack_index;
     opc_nip_uxn_opcodes_h_l1012_c39_f23d_ins <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_f23d_ins;
     opc_nip_uxn_opcodes_h_l1012_c39_f23d_k <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_f23d_k;
     -- Outputs
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_f23d_return_output := opc_nip_uxn_opcodes_h_l1012_c39_f23d_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_d146_return_output;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_86b9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_38a8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_78a9_iftrue := VAR_opc_nip_uxn_opcodes_h_l1012_c39_f23d_return_output;
     -- opc_nip2[uxn_opcodes_h_l1013_c39_86b9] LATENCY=0
     -- Clock enable
     opc_nip2_uxn_opcodes_h_l1013_c39_86b9_CLOCK_ENABLE <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_86b9_CLOCK_ENABLE;
     -- Inputs
     opc_nip2_uxn_opcodes_h_l1013_c39_86b9_stack_index <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_86b9_stack_index;
     opc_nip2_uxn_opcodes_h_l1013_c39_86b9_ins <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_86b9_ins;
     opc_nip2_uxn_opcodes_h_l1013_c39_86b9_k <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_86b9_k;
     -- Outputs
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_86b9_return_output := opc_nip2_uxn_opcodes_h_l1013_c39_86b9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_307c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_27a1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_307c_return_output;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_6057_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_27a1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_5abc_iftrue := VAR_opc_nip2_uxn_opcodes_h_l1013_c39_86b9_return_output;
     -- opc_swp[uxn_opcodes_h_l1014_c39_6057] LATENCY=0
     -- Clock enable
     opc_swp_uxn_opcodes_h_l1014_c39_6057_CLOCK_ENABLE <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_6057_CLOCK_ENABLE;
     -- Inputs
     opc_swp_uxn_opcodes_h_l1014_c39_6057_stack_index <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_6057_stack_index;
     opc_swp_uxn_opcodes_h_l1014_c39_6057_ins <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_6057_ins;
     opc_swp_uxn_opcodes_h_l1014_c39_6057_k <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_6057_k;
     -- Outputs
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_6057_return_output := opc_swp_uxn_opcodes_h_l1014_c39_6057_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_937e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_814a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_814a_return_output;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f047_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_937e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_d146_iftrue := VAR_opc_swp_uxn_opcodes_h_l1014_c39_6057_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_1fba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_2599] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_return_output;

     -- opc_swp2[uxn_opcodes_h_l1015_c39_f047] LATENCY=0
     -- Clock enable
     opc_swp2_uxn_opcodes_h_l1015_c39_f047_CLOCK_ENABLE <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f047_CLOCK_ENABLE;
     -- Inputs
     opc_swp2_uxn_opcodes_h_l1015_c39_f047_stack_index <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f047_stack_index;
     opc_swp2_uxn_opcodes_h_l1015_c39_f047_ins <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f047_ins;
     opc_swp2_uxn_opcodes_h_l1015_c39_f047_k <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f047_k;
     -- Outputs
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f047_return_output := opc_swp2_uxn_opcodes_h_l1015_c39_f047_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_2599_return_output;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_6ee8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_1fba_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_307c_iftrue := VAR_opc_swp2_uxn_opcodes_h_l1015_c39_f047_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_7852] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_return_output;

     -- opc_rot[uxn_opcodes_h_l1016_c39_6ee8] LATENCY=0
     -- Clock enable
     opc_rot_uxn_opcodes_h_l1016_c39_6ee8_CLOCK_ENABLE <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_6ee8_CLOCK_ENABLE;
     -- Inputs
     opc_rot_uxn_opcodes_h_l1016_c39_6ee8_stack_index <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_6ee8_stack_index;
     opc_rot_uxn_opcodes_h_l1016_c39_6ee8_ins <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_6ee8_ins;
     opc_rot_uxn_opcodes_h_l1016_c39_6ee8_k <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_6ee8_k;
     -- Outputs
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_6ee8_return_output := opc_rot_uxn_opcodes_h_l1016_c39_6ee8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_fc48] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_7852_return_output;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a43a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fc48_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_814a_iftrue := VAR_opc_rot_uxn_opcodes_h_l1016_c39_6ee8_return_output;
     -- opc_rot2[uxn_opcodes_h_l1017_c39_a43a] LATENCY=0
     -- Clock enable
     opc_rot2_uxn_opcodes_h_l1017_c39_a43a_CLOCK_ENABLE <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a43a_CLOCK_ENABLE;
     -- Inputs
     opc_rot2_uxn_opcodes_h_l1017_c39_a43a_stack_index <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a43a_stack_index;
     opc_rot2_uxn_opcodes_h_l1017_c39_a43a_ins <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a43a_ins;
     opc_rot2_uxn_opcodes_h_l1017_c39_a43a_k <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a43a_k;
     -- Outputs
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a43a_return_output := opc_rot2_uxn_opcodes_h_l1017_c39_a43a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_3567] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_9997] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3567_return_output;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_ed1c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_9997_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_2599_iftrue := VAR_opc_rot2_uxn_opcodes_h_l1017_c39_a43a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_8e81] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_return_output;

     -- opc_dup[uxn_opcodes_h_l1018_c39_ed1c] LATENCY=0
     -- Clock enable
     opc_dup_uxn_opcodes_h_l1018_c39_ed1c_CLOCK_ENABLE <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_ed1c_CLOCK_ENABLE;
     -- Inputs
     opc_dup_uxn_opcodes_h_l1018_c39_ed1c_stack_index <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_ed1c_stack_index;
     opc_dup_uxn_opcodes_h_l1018_c39_ed1c_ins <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_ed1c_ins;
     opc_dup_uxn_opcodes_h_l1018_c39_ed1c_k <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_ed1c_k;
     -- Outputs
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_ed1c_return_output := opc_dup_uxn_opcodes_h_l1018_c39_ed1c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_50af] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8e81_return_output;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_79f2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_50af_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_7852_iftrue := VAR_opc_dup_uxn_opcodes_h_l1018_c39_ed1c_return_output;
     -- opc_dup2[uxn_opcodes_h_l1019_c39_79f2] LATENCY=0
     -- Clock enable
     opc_dup2_uxn_opcodes_h_l1019_c39_79f2_CLOCK_ENABLE <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_79f2_CLOCK_ENABLE;
     -- Inputs
     opc_dup2_uxn_opcodes_h_l1019_c39_79f2_stack_index <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_79f2_stack_index;
     opc_dup2_uxn_opcodes_h_l1019_c39_79f2_ins <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_79f2_ins;
     opc_dup2_uxn_opcodes_h_l1019_c39_79f2_k <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_79f2_k;
     -- Outputs
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_79f2_return_output := opc_dup2_uxn_opcodes_h_l1019_c39_79f2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_0ef7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_125d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_0ef7_return_output;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8e77_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_125d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_3567_iftrue := VAR_opc_dup2_uxn_opcodes_h_l1019_c39_79f2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_9711] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_b2f3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_return_output;

     -- opc_ovr[uxn_opcodes_h_l1020_c39_8e77] LATENCY=0
     -- Clock enable
     opc_ovr_uxn_opcodes_h_l1020_c39_8e77_CLOCK_ENABLE <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8e77_CLOCK_ENABLE;
     -- Inputs
     opc_ovr_uxn_opcodes_h_l1020_c39_8e77_stack_index <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8e77_stack_index;
     opc_ovr_uxn_opcodes_h_l1020_c39_8e77_ins <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8e77_ins;
     opc_ovr_uxn_opcodes_h_l1020_c39_8e77_k <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8e77_k;
     -- Outputs
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8e77_return_output := opc_ovr_uxn_opcodes_h_l1020_c39_8e77_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_b2f3_return_output;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_9711_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_8e81_iftrue := VAR_opc_ovr_uxn_opcodes_h_l1020_c39_8e77_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_4c15] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_2922] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_return_output;

     -- opc_ovr2[uxn_opcodes_h_l1021_c39_90a5] LATENCY=0
     -- Clock enable
     opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_CLOCK_ENABLE <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_CLOCK_ENABLE;
     -- Inputs
     opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_stack_index <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_stack_index;
     opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_ins <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_ins;
     opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_k <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_k;
     -- Outputs
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_return_output := opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_2922_return_output;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_036f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_4c15_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_0ef7_iftrue := VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_90a5_return_output;
     -- opc_equ[uxn_opcodes_h_l1022_c39_036f] LATENCY=0
     -- Clock enable
     opc_equ_uxn_opcodes_h_l1022_c39_036f_CLOCK_ENABLE <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_036f_CLOCK_ENABLE;
     -- Inputs
     opc_equ_uxn_opcodes_h_l1022_c39_036f_stack_index <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_036f_stack_index;
     opc_equ_uxn_opcodes_h_l1022_c39_036f_ins <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_036f_ins;
     opc_equ_uxn_opcodes_h_l1022_c39_036f_k <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_036f_k;
     -- Outputs
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_036f_return_output := opc_equ_uxn_opcodes_h_l1022_c39_036f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_b3fa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_5101] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_b3fa_return_output;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_ea78_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_5101_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_b2f3_iftrue := VAR_opc_equ_uxn_opcodes_h_l1022_c39_036f_return_output;
     -- opc_equ2[uxn_opcodes_h_l1023_c39_ea78] LATENCY=0
     -- Clock enable
     opc_equ2_uxn_opcodes_h_l1023_c39_ea78_CLOCK_ENABLE <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_ea78_CLOCK_ENABLE;
     -- Inputs
     opc_equ2_uxn_opcodes_h_l1023_c39_ea78_stack_index <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_ea78_stack_index;
     opc_equ2_uxn_opcodes_h_l1023_c39_ea78_ins <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_ea78_ins;
     opc_equ2_uxn_opcodes_h_l1023_c39_ea78_k <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_ea78_k;
     -- Outputs
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_ea78_return_output := opc_equ2_uxn_opcodes_h_l1023_c39_ea78_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_c74f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_6844] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_c74f_return_output;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_e004_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_6844_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_2922_iftrue := VAR_opc_equ2_uxn_opcodes_h_l1023_c39_ea78_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_dd28] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_9a91] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_return_output;

     -- opc_neq[uxn_opcodes_h_l1024_c39_e004] LATENCY=0
     -- Clock enable
     opc_neq_uxn_opcodes_h_l1024_c39_e004_CLOCK_ENABLE <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_e004_CLOCK_ENABLE;
     -- Inputs
     opc_neq_uxn_opcodes_h_l1024_c39_e004_stack_index <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_e004_stack_index;
     opc_neq_uxn_opcodes_h_l1024_c39_e004_ins <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_e004_ins;
     opc_neq_uxn_opcodes_h_l1024_c39_e004_k <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_e004_k;
     -- Outputs
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_e004_return_output := opc_neq_uxn_opcodes_h_l1024_c39_e004_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_9a91_return_output;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e04e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_dd28_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_b3fa_iftrue := VAR_opc_neq_uxn_opcodes_h_l1024_c39_e004_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_4b14] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_return_output;

     -- opc_neq2[uxn_opcodes_h_l1025_c39_e04e] LATENCY=0
     -- Clock enable
     opc_neq2_uxn_opcodes_h_l1025_c39_e04e_CLOCK_ENABLE <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e04e_CLOCK_ENABLE;
     -- Inputs
     opc_neq2_uxn_opcodes_h_l1025_c39_e04e_stack_index <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e04e_stack_index;
     opc_neq2_uxn_opcodes_h_l1025_c39_e04e_ins <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e04e_ins;
     opc_neq2_uxn_opcodes_h_l1025_c39_e04e_k <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e04e_k;
     -- Outputs
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e04e_return_output := opc_neq2_uxn_opcodes_h_l1025_c39_e04e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_ca1b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_ca1b_return_output;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_fd76_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_4b14_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_c74f_iftrue := VAR_opc_neq2_uxn_opcodes_h_l1025_c39_e04e_return_output;
     -- opc_gth[uxn_opcodes_h_l1026_c39_fd76] LATENCY=0
     -- Clock enable
     opc_gth_uxn_opcodes_h_l1026_c39_fd76_CLOCK_ENABLE <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_fd76_CLOCK_ENABLE;
     -- Inputs
     opc_gth_uxn_opcodes_h_l1026_c39_fd76_stack_index <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_fd76_stack_index;
     opc_gth_uxn_opcodes_h_l1026_c39_fd76_ins <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_fd76_ins;
     opc_gth_uxn_opcodes_h_l1026_c39_fd76_k <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_fd76_k;
     -- Outputs
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_fd76_return_output := opc_gth_uxn_opcodes_h_l1026_c39_fd76_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_462f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_fc73] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_462f_return_output;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_c423_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_fc73_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_9a91_iftrue := VAR_opc_gth_uxn_opcodes_h_l1026_c39_fd76_return_output;
     -- opc_gth2[uxn_opcodes_h_l1027_c39_c423] LATENCY=0
     -- Clock enable
     opc_gth2_uxn_opcodes_h_l1027_c39_c423_CLOCK_ENABLE <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_c423_CLOCK_ENABLE;
     -- Inputs
     opc_gth2_uxn_opcodes_h_l1027_c39_c423_stack_index <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_c423_stack_index;
     opc_gth2_uxn_opcodes_h_l1027_c39_c423_ins <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_c423_ins;
     opc_gth2_uxn_opcodes_h_l1027_c39_c423_k <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_c423_k;
     -- Outputs
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_c423_return_output := opc_gth2_uxn_opcodes_h_l1027_c39_c423_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_315d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_7b7b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_7b7b_return_output;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_a09a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_315d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_ca1b_iftrue := VAR_opc_gth2_uxn_opcodes_h_l1027_c39_c423_return_output;
     -- opc_lth[uxn_opcodes_h_l1028_c39_a09a] LATENCY=0
     -- Clock enable
     opc_lth_uxn_opcodes_h_l1028_c39_a09a_CLOCK_ENABLE <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_a09a_CLOCK_ENABLE;
     -- Inputs
     opc_lth_uxn_opcodes_h_l1028_c39_a09a_stack_index <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_a09a_stack_index;
     opc_lth_uxn_opcodes_h_l1028_c39_a09a_ins <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_a09a_ins;
     opc_lth_uxn_opcodes_h_l1028_c39_a09a_k <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_a09a_k;
     -- Outputs
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_a09a_return_output := opc_lth_uxn_opcodes_h_l1028_c39_a09a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_4804] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_58e7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_4804_return_output;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_58e7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_462f_iftrue := VAR_opc_lth_uxn_opcodes_h_l1028_c39_a09a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_273d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_return_output;

     -- opc_lth2[uxn_opcodes_h_l1029_c39_b2cb] LATENCY=0
     -- Clock enable
     opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_CLOCK_ENABLE <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_CLOCK_ENABLE;
     -- Inputs
     opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_stack_index <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_stack_index;
     opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_ins <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_ins;
     opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_k <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_k;
     -- Outputs
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_return_output := opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_e5c5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_273d_return_output;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_00ca_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e5c5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_7b7b_iftrue := VAR_opc_lth2_uxn_opcodes_h_l1029_c39_b2cb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_2296] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_return_output;

     -- opc_jmp[uxn_opcodes_h_l1030_c39_00ca] LATENCY=0
     -- Clock enable
     opc_jmp_uxn_opcodes_h_l1030_c39_00ca_CLOCK_ENABLE <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_00ca_CLOCK_ENABLE;
     -- Inputs
     opc_jmp_uxn_opcodes_h_l1030_c39_00ca_stack_index <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_00ca_stack_index;
     opc_jmp_uxn_opcodes_h_l1030_c39_00ca_ins <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_00ca_ins;
     opc_jmp_uxn_opcodes_h_l1030_c39_00ca_k <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_00ca_k;
     -- Outputs
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_00ca_return_output := opc_jmp_uxn_opcodes_h_l1030_c39_00ca_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_80eb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_2296_return_output;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_80eb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_4804_iftrue := VAR_opc_jmp_uxn_opcodes_h_l1030_c39_00ca_return_output;
     -- opc_jmp2[uxn_opcodes_h_l1031_c39_92d8] LATENCY=0
     -- Clock enable
     opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_CLOCK_ENABLE <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_CLOCK_ENABLE;
     -- Inputs
     opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_stack_index <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_stack_index;
     opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_ins <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_ins;
     opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_k <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_k;
     -- Outputs
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_return_output := opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_51d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_4ee8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_51d1_return_output;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_749e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_4ee8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_273d_iftrue := VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_92d8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_aced] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_return_output;

     -- opc_jcn[uxn_opcodes_h_l1032_c39_749e] LATENCY=0
     -- Clock enable
     opc_jcn_uxn_opcodes_h_l1032_c39_749e_CLOCK_ENABLE <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_749e_CLOCK_ENABLE;
     -- Inputs
     opc_jcn_uxn_opcodes_h_l1032_c39_749e_stack_index <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_749e_stack_index;
     opc_jcn_uxn_opcodes_h_l1032_c39_749e_ins <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_749e_ins;
     opc_jcn_uxn_opcodes_h_l1032_c39_749e_k <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_749e_k;
     -- Outputs
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_749e_return_output := opc_jcn_uxn_opcodes_h_l1032_c39_749e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_16a5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_aced_return_output;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_5568_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_16a5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_2296_iftrue := VAR_opc_jcn_uxn_opcodes_h_l1032_c39_749e_return_output;
     -- opc_jcn2[uxn_opcodes_h_l1033_c39_5568] LATENCY=0
     -- Clock enable
     opc_jcn2_uxn_opcodes_h_l1033_c39_5568_CLOCK_ENABLE <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_5568_CLOCK_ENABLE;
     -- Inputs
     opc_jcn2_uxn_opcodes_h_l1033_c39_5568_stack_index <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_5568_stack_index;
     opc_jcn2_uxn_opcodes_h_l1033_c39_5568_ins <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_5568_ins;
     opc_jcn2_uxn_opcodes_h_l1033_c39_5568_k <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_5568_k;
     -- Outputs
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_5568_return_output := opc_jcn2_uxn_opcodes_h_l1033_c39_5568_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_78f3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_2527] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_2527_return_output;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_78f3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_51d1_iftrue := VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_5568_return_output;
     -- opc_jsr[uxn_opcodes_h_l1034_c39_8fb6] LATENCY=0
     -- Clock enable
     opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_CLOCK_ENABLE <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_CLOCK_ENABLE;
     -- Inputs
     opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_stack_index <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_stack_index;
     opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_ins <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_ins;
     opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_k <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_k;
     -- Outputs
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_return_output := opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_921a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_d2d2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_921a_return_output;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_d2d2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_aced_iftrue := VAR_opc_jsr_uxn_opcodes_h_l1034_c39_8fb6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_a56a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_return_output;

     -- opc_jsr2[uxn_opcodes_h_l1035_c39_d17e] LATENCY=0
     -- Clock enable
     opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_CLOCK_ENABLE <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_CLOCK_ENABLE;
     -- Inputs
     opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_stack_index <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_stack_index;
     opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_ins <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_ins;
     opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_k <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_k;
     -- Outputs
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_return_output := opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_d4f2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_a56a_return_output;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_b171_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_d4f2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_2527_iftrue := VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_d17e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_c06d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_return_output;

     -- opc_sth[uxn_opcodes_h_l1036_c39_b171] LATENCY=0
     -- Clock enable
     opc_sth_uxn_opcodes_h_l1036_c39_b171_CLOCK_ENABLE <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_b171_CLOCK_ENABLE;
     -- Inputs
     opc_sth_uxn_opcodes_h_l1036_c39_b171_stack_index <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_b171_stack_index;
     opc_sth_uxn_opcodes_h_l1036_c39_b171_ins <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_b171_ins;
     opc_sth_uxn_opcodes_h_l1036_c39_b171_k <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_b171_k;
     -- Outputs
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_b171_return_output := opc_sth_uxn_opcodes_h_l1036_c39_b171_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_4b53] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_c06d_return_output;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3575_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_4b53_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_921a_iftrue := VAR_opc_sth_uxn_opcodes_h_l1036_c39_b171_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_3c6d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_c9d1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_return_output;

     -- opc_sth2[uxn_opcodes_h_l1037_c39_3575] LATENCY=0
     -- Clock enable
     opc_sth2_uxn_opcodes_h_l1037_c39_3575_CLOCK_ENABLE <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3575_CLOCK_ENABLE;
     -- Inputs
     opc_sth2_uxn_opcodes_h_l1037_c39_3575_stack_index <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3575_stack_index;
     opc_sth2_uxn_opcodes_h_l1037_c39_3575_ins <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3575_ins;
     opc_sth2_uxn_opcodes_h_l1037_c39_3575_k <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3575_k;
     -- Outputs
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3575_return_output := opc_sth2_uxn_opcodes_h_l1037_c39_3575_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_3c6d_return_output;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_c9d1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_a56a_iftrue := VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3575_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_8044] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_return_output;

     -- opc_ldz[uxn_opcodes_h_l1038_c39_cf9b] LATENCY=0
     -- Clock enable
     opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_CLOCK_ENABLE <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_CLOCK_ENABLE;
     -- Inputs
     opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_stack_index <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_stack_index;
     opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_ins <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_ins;
     opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_k <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_k;
     -- Outputs
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_return_output := opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_1415] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_8044_return_output;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_1415_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_c06d_iftrue := VAR_opc_ldz_uxn_opcodes_h_l1038_c39_cf9b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_2506] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_7fd2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_return_output;

     -- opc_ldz2[uxn_opcodes_h_l1039_c39_d9b9] LATENCY=0
     -- Clock enable
     opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_CLOCK_ENABLE <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_CLOCK_ENABLE;
     -- Inputs
     opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_stack_index <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_stack_index;
     opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_ins <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_ins;
     opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_k <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_k;
     -- Outputs
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_return_output := opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_7fd2_return_output;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_4e7a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2506_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_3c6d_iftrue := VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_d9b9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_273b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_59b6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_return_output;

     -- opc_stz[uxn_opcodes_h_l1040_c39_4e7a] LATENCY=0
     -- Clock enable
     opc_stz_uxn_opcodes_h_l1040_c39_4e7a_CLOCK_ENABLE <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_4e7a_CLOCK_ENABLE;
     -- Inputs
     opc_stz_uxn_opcodes_h_l1040_c39_4e7a_stack_index <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_4e7a_stack_index;
     opc_stz_uxn_opcodes_h_l1040_c39_4e7a_ins <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_4e7a_ins;
     opc_stz_uxn_opcodes_h_l1040_c39_4e7a_k <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_4e7a_k;
     -- Outputs
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_4e7a_return_output := opc_stz_uxn_opcodes_h_l1040_c39_4e7a_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_59b6_return_output;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_c70c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_273b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_8044_iftrue := VAR_opc_stz_uxn_opcodes_h_l1040_c39_4e7a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_3025] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_94cd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_return_output;

     -- opc_stz2[uxn_opcodes_h_l1041_c39_c70c] LATENCY=0
     -- Clock enable
     opc_stz2_uxn_opcodes_h_l1041_c39_c70c_CLOCK_ENABLE <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_c70c_CLOCK_ENABLE;
     -- Inputs
     opc_stz2_uxn_opcodes_h_l1041_c39_c70c_stack_index <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_c70c_stack_index;
     opc_stz2_uxn_opcodes_h_l1041_c39_c70c_ins <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_c70c_ins;
     opc_stz2_uxn_opcodes_h_l1041_c39_c70c_k <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_c70c_k;
     -- Outputs
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_c70c_return_output := opc_stz2_uxn_opcodes_h_l1041_c39_c70c_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_94cd_return_output;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_3025_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_7fd2_iftrue := VAR_opc_stz2_uxn_opcodes_h_l1041_c39_c70c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_bc59] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_3950] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_return_output;

     -- opc_ldr[uxn_opcodes_h_l1042_c39_d0a6] LATENCY=0
     -- Clock enable
     opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_CLOCK_ENABLE <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_CLOCK_ENABLE;
     -- Inputs
     opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_stack_index <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_stack_index;
     opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_ins <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_ins;
     opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_k <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_k;
     -- Outputs
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_return_output := opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_bc59_return_output;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_3950_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_59b6_iftrue := VAR_opc_ldr_uxn_opcodes_h_l1042_c39_d0a6_return_output;
     -- opc_ldr2[uxn_opcodes_h_l1043_c39_c1e4] LATENCY=0
     -- Clock enable
     opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_CLOCK_ENABLE <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_CLOCK_ENABLE;
     -- Inputs
     opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_stack_index <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_stack_index;
     opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_ins <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_ins;
     opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_k <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_k;
     -- Outputs
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_return_output := opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_bc18] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_633b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_633b_return_output;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_d36a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_bc18_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_94cd_iftrue := VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_c1e4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_0b3d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_dd97] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_return_output;

     -- opc_str[uxn_opcodes_h_l1044_c39_d36a] LATENCY=0
     -- Clock enable
     opc_str_uxn_opcodes_h_l1044_c39_d36a_CLOCK_ENABLE <= VAR_opc_str_uxn_opcodes_h_l1044_c39_d36a_CLOCK_ENABLE;
     -- Inputs
     opc_str_uxn_opcodes_h_l1044_c39_d36a_stack_index <= VAR_opc_str_uxn_opcodes_h_l1044_c39_d36a_stack_index;
     opc_str_uxn_opcodes_h_l1044_c39_d36a_ins <= VAR_opc_str_uxn_opcodes_h_l1044_c39_d36a_ins;
     opc_str_uxn_opcodes_h_l1044_c39_d36a_k <= VAR_opc_str_uxn_opcodes_h_l1044_c39_d36a_k;
     -- Outputs
     VAR_opc_str_uxn_opcodes_h_l1044_c39_d36a_return_output := opc_str_uxn_opcodes_h_l1044_c39_d36a_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_0b3d_return_output;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_ca6b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_dd97_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_bc59_iftrue := VAR_opc_str_uxn_opcodes_h_l1044_c39_d36a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_a82c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_return_output;

     -- opc_str2[uxn_opcodes_h_l1045_c39_ca6b] LATENCY=0
     -- Clock enable
     opc_str2_uxn_opcodes_h_l1045_c39_ca6b_CLOCK_ENABLE <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_ca6b_CLOCK_ENABLE;
     -- Inputs
     opc_str2_uxn_opcodes_h_l1045_c39_ca6b_stack_index <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_ca6b_stack_index;
     opc_str2_uxn_opcodes_h_l1045_c39_ca6b_ins <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_ca6b_ins;
     opc_str2_uxn_opcodes_h_l1045_c39_ca6b_k <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_ca6b_k;
     -- Outputs
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_ca6b_return_output := opc_str2_uxn_opcodes_h_l1045_c39_ca6b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_c6f9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_a82c_return_output;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_ced1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_c6f9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_633b_iftrue := VAR_opc_str2_uxn_opcodes_h_l1045_c39_ca6b_return_output;
     -- opc_lda[uxn_opcodes_h_l1046_c39_ced1] LATENCY=0
     -- Clock enable
     opc_lda_uxn_opcodes_h_l1046_c39_ced1_CLOCK_ENABLE <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_ced1_CLOCK_ENABLE;
     -- Inputs
     opc_lda_uxn_opcodes_h_l1046_c39_ced1_stack_index <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_ced1_stack_index;
     opc_lda_uxn_opcodes_h_l1046_c39_ced1_ins <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_ced1_ins;
     opc_lda_uxn_opcodes_h_l1046_c39_ced1_k <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_ced1_k;
     -- Outputs
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_ced1_return_output := opc_lda_uxn_opcodes_h_l1046_c39_ced1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_72e3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_d76b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_72e3_return_output;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_76a3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_d76b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_0b3d_iftrue := VAR_opc_lda_uxn_opcodes_h_l1046_c39_ced1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_d0bd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_return_output;

     -- opc_lda2[uxn_opcodes_h_l1047_c39_76a3] LATENCY=0
     -- Clock enable
     opc_lda2_uxn_opcodes_h_l1047_c39_76a3_CLOCK_ENABLE <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_76a3_CLOCK_ENABLE;
     -- Inputs
     opc_lda2_uxn_opcodes_h_l1047_c39_76a3_stack_index <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_76a3_stack_index;
     opc_lda2_uxn_opcodes_h_l1047_c39_76a3_ins <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_76a3_ins;
     opc_lda2_uxn_opcodes_h_l1047_c39_76a3_k <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_76a3_k;
     -- Outputs
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_76a3_return_output := opc_lda2_uxn_opcodes_h_l1047_c39_76a3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_9c56] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_9c56_return_output;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_051e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_d0bd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_a82c_iftrue := VAR_opc_lda2_uxn_opcodes_h_l1047_c39_76a3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_b18a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_db9e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_return_output;

     -- opc_sta[uxn_opcodes_h_l1048_c39_051e] LATENCY=0
     -- Clock enable
     opc_sta_uxn_opcodes_h_l1048_c39_051e_CLOCK_ENABLE <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_051e_CLOCK_ENABLE;
     -- Inputs
     opc_sta_uxn_opcodes_h_l1048_c39_051e_stack_index <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_051e_stack_index;
     opc_sta_uxn_opcodes_h_l1048_c39_051e_ins <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_051e_ins;
     opc_sta_uxn_opcodes_h_l1048_c39_051e_k <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_051e_k;
     -- Outputs
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_051e_return_output := opc_sta_uxn_opcodes_h_l1048_c39_051e_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_db9e_return_output;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_2b32_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b18a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_72e3_iftrue := VAR_opc_sta_uxn_opcodes_h_l1048_c39_051e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_3790] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_return_output;

     -- opc_sta2[uxn_opcodes_h_l1049_c39_2b32] LATENCY=0
     -- Clock enable
     opc_sta2_uxn_opcodes_h_l1049_c39_2b32_CLOCK_ENABLE <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_2b32_CLOCK_ENABLE;
     -- Inputs
     opc_sta2_uxn_opcodes_h_l1049_c39_2b32_stack_index <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_2b32_stack_index;
     opc_sta2_uxn_opcodes_h_l1049_c39_2b32_ins <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_2b32_ins;
     opc_sta2_uxn_opcodes_h_l1049_c39_2b32_k <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_2b32_k;
     -- Outputs
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_2b32_return_output := opc_sta2_uxn_opcodes_h_l1049_c39_2b32_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_6b7e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_6b7e_return_output;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_28e3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_3790_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_9c56_iftrue := VAR_opc_sta2_uxn_opcodes_h_l1049_c39_2b32_return_output;
     -- opc_dei[uxn_opcodes_h_l1050_c39_28e3] LATENCY=0
     -- Clock enable
     opc_dei_uxn_opcodes_h_l1050_c39_28e3_CLOCK_ENABLE <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_28e3_CLOCK_ENABLE;
     -- Inputs
     opc_dei_uxn_opcodes_h_l1050_c39_28e3_stack_index <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_28e3_stack_index;
     opc_dei_uxn_opcodes_h_l1050_c39_28e3_ins <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_28e3_ins;
     opc_dei_uxn_opcodes_h_l1050_c39_28e3_k <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_28e3_k;
     -- Outputs
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_28e3_return_output := opc_dei_uxn_opcodes_h_l1050_c39_28e3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_45bc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_bee1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_bee1_return_output;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e46f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_45bc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_db9e_iftrue := VAR_opc_dei_uxn_opcodes_h_l1050_c39_28e3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_f2da] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_675b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_return_output;

     -- opc_dei2[uxn_opcodes_h_l1051_c39_e46f] LATENCY=0
     -- Clock enable
     opc_dei2_uxn_opcodes_h_l1051_c39_e46f_CLOCK_ENABLE <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e46f_CLOCK_ENABLE;
     -- Inputs
     opc_dei2_uxn_opcodes_h_l1051_c39_e46f_stack_index <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e46f_stack_index;
     opc_dei2_uxn_opcodes_h_l1051_c39_e46f_ins <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e46f_ins;
     opc_dei2_uxn_opcodes_h_l1051_c39_e46f_k <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e46f_k;
     -- Outputs
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e46f_return_output := opc_dei2_uxn_opcodes_h_l1051_c39_e46f_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_f2da_return_output;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_69b6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_675b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_6b7e_iftrue := VAR_opc_dei2_uxn_opcodes_h_l1051_c39_e46f_return_output;
     -- opc_deo[uxn_opcodes_h_l1052_c39_69b6] LATENCY=0
     -- Clock enable
     opc_deo_uxn_opcodes_h_l1052_c39_69b6_CLOCK_ENABLE <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_69b6_CLOCK_ENABLE;
     -- Inputs
     opc_deo_uxn_opcodes_h_l1052_c39_69b6_stack_index <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_69b6_stack_index;
     opc_deo_uxn_opcodes_h_l1052_c39_69b6_ins <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_69b6_ins;
     opc_deo_uxn_opcodes_h_l1052_c39_69b6_k <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_69b6_k;
     -- Outputs
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_69b6_return_output := opc_deo_uxn_opcodes_h_l1052_c39_69b6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_35d8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_7514] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_35d8_return_output;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_cc30_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_7514_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_bee1_iftrue := VAR_opc_deo_uxn_opcodes_h_l1052_c39_69b6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_a096] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_d1b7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_return_output;

     -- opc_deo2[uxn_opcodes_h_l1053_c39_cc30] LATENCY=0
     -- Clock enable
     opc_deo2_uxn_opcodes_h_l1053_c39_cc30_CLOCK_ENABLE <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_cc30_CLOCK_ENABLE;
     -- Inputs
     opc_deo2_uxn_opcodes_h_l1053_c39_cc30_stack_index <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_cc30_stack_index;
     opc_deo2_uxn_opcodes_h_l1053_c39_cc30_ins <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_cc30_ins;
     opc_deo2_uxn_opcodes_h_l1053_c39_cc30_k <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_cc30_k;
     -- Outputs
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_cc30_return_output := opc_deo2_uxn_opcodes_h_l1053_c39_cc30_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_d1b7_return_output;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_c851_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_a096_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_f2da_iftrue := VAR_opc_deo2_uxn_opcodes_h_l1053_c39_cc30_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_a347] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_return_output;

     -- opc_add[uxn_opcodes_h_l1054_c39_c851] LATENCY=0
     -- Clock enable
     opc_add_uxn_opcodes_h_l1054_c39_c851_CLOCK_ENABLE <= VAR_opc_add_uxn_opcodes_h_l1054_c39_c851_CLOCK_ENABLE;
     -- Inputs
     opc_add_uxn_opcodes_h_l1054_c39_c851_stack_index <= VAR_opc_add_uxn_opcodes_h_l1054_c39_c851_stack_index;
     opc_add_uxn_opcodes_h_l1054_c39_c851_ins <= VAR_opc_add_uxn_opcodes_h_l1054_c39_c851_ins;
     opc_add_uxn_opcodes_h_l1054_c39_c851_k <= VAR_opc_add_uxn_opcodes_h_l1054_c39_c851_k;
     -- Outputs
     VAR_opc_add_uxn_opcodes_h_l1054_c39_c851_return_output := opc_add_uxn_opcodes_h_l1054_c39_c851_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_acf3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_a347_return_output;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_61d6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_acf3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_35d8_iftrue := VAR_opc_add_uxn_opcodes_h_l1054_c39_c851_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_15cf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_d8d8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_return_output;

     -- opc_add2[uxn_opcodes_h_l1055_c39_61d6] LATENCY=0
     -- Clock enable
     opc_add2_uxn_opcodes_h_l1055_c39_61d6_CLOCK_ENABLE <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_61d6_CLOCK_ENABLE;
     -- Inputs
     opc_add2_uxn_opcodes_h_l1055_c39_61d6_stack_index <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_61d6_stack_index;
     opc_add2_uxn_opcodes_h_l1055_c39_61d6_ins <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_61d6_ins;
     opc_add2_uxn_opcodes_h_l1055_c39_61d6_k <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_61d6_k;
     -- Outputs
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_61d6_return_output := opc_add2_uxn_opcodes_h_l1055_c39_61d6_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_d8d8_return_output;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_9af1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_15cf_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_d1b7_iftrue := VAR_opc_add2_uxn_opcodes_h_l1055_c39_61d6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_92b3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_return_output;

     -- opc_sub[uxn_opcodes_h_l1056_c39_9af1] LATENCY=0
     -- Clock enable
     opc_sub_uxn_opcodes_h_l1056_c39_9af1_CLOCK_ENABLE <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_9af1_CLOCK_ENABLE;
     -- Inputs
     opc_sub_uxn_opcodes_h_l1056_c39_9af1_stack_index <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_9af1_stack_index;
     opc_sub_uxn_opcodes_h_l1056_c39_9af1_ins <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_9af1_ins;
     opc_sub_uxn_opcodes_h_l1056_c39_9af1_k <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_9af1_k;
     -- Outputs
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_9af1_return_output := opc_sub_uxn_opcodes_h_l1056_c39_9af1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_0436] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_0436_return_output;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_699e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_92b3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_a347_iftrue := VAR_opc_sub_uxn_opcodes_h_l1056_c39_9af1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_d385] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_return_output;

     -- opc_sub2[uxn_opcodes_h_l1057_c39_699e] LATENCY=0
     -- Clock enable
     opc_sub2_uxn_opcodes_h_l1057_c39_699e_CLOCK_ENABLE <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_699e_CLOCK_ENABLE;
     -- Inputs
     opc_sub2_uxn_opcodes_h_l1057_c39_699e_stack_index <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_699e_stack_index;
     opc_sub2_uxn_opcodes_h_l1057_c39_699e_ins <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_699e_ins;
     opc_sub2_uxn_opcodes_h_l1057_c39_699e_k <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_699e_k;
     -- Outputs
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_699e_return_output := opc_sub2_uxn_opcodes_h_l1057_c39_699e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_0348] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_d385_return_output;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_14bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_0348_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_d8d8_iftrue := VAR_opc_sub2_uxn_opcodes_h_l1057_c39_699e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_b39f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_return_output;

     -- opc_mul[uxn_opcodes_h_l1058_c39_14bf] LATENCY=0
     -- Clock enable
     opc_mul_uxn_opcodes_h_l1058_c39_14bf_CLOCK_ENABLE <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_14bf_CLOCK_ENABLE;
     -- Inputs
     opc_mul_uxn_opcodes_h_l1058_c39_14bf_stack_index <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_14bf_stack_index;
     opc_mul_uxn_opcodes_h_l1058_c39_14bf_ins <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_14bf_ins;
     opc_mul_uxn_opcodes_h_l1058_c39_14bf_k <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_14bf_k;
     -- Outputs
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_14bf_return_output := opc_mul_uxn_opcodes_h_l1058_c39_14bf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_310c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_310c_return_output;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_b39f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_0436_iftrue := VAR_opc_mul_uxn_opcodes_h_l1058_c39_14bf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_76c7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_return_output;

     -- opc_mul2[uxn_opcodes_h_l1059_c39_b2ff] LATENCY=0
     -- Clock enable
     opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_CLOCK_ENABLE <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_CLOCK_ENABLE;
     -- Inputs
     opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_stack_index <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_stack_index;
     opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_ins <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_ins;
     opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_k <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_k;
     -- Outputs
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_return_output := opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_cd2d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_76c7_return_output;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_dec5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_cd2d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_d385_iftrue := VAR_opc_mul2_uxn_opcodes_h_l1059_c39_b2ff_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_920e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_e68d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_return_output;

     -- opc_div[uxn_opcodes_h_l1060_c39_dec5] LATENCY=0
     -- Clock enable
     opc_div_uxn_opcodes_h_l1060_c39_dec5_CLOCK_ENABLE <= VAR_opc_div_uxn_opcodes_h_l1060_c39_dec5_CLOCK_ENABLE;
     -- Inputs
     opc_div_uxn_opcodes_h_l1060_c39_dec5_stack_index <= VAR_opc_div_uxn_opcodes_h_l1060_c39_dec5_stack_index;
     opc_div_uxn_opcodes_h_l1060_c39_dec5_ins <= VAR_opc_div_uxn_opcodes_h_l1060_c39_dec5_ins;
     opc_div_uxn_opcodes_h_l1060_c39_dec5_k <= VAR_opc_div_uxn_opcodes_h_l1060_c39_dec5_k;
     -- Outputs
     VAR_opc_div_uxn_opcodes_h_l1060_c39_dec5_return_output := opc_div_uxn_opcodes_h_l1060_c39_dec5_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_e68d_return_output;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_de16_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_920e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_310c_iftrue := VAR_opc_div_uxn_opcodes_h_l1060_c39_dec5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_8bdb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_return_output;

     -- opc_div2[uxn_opcodes_h_l1061_c39_de16] LATENCY=0
     -- Clock enable
     opc_div2_uxn_opcodes_h_l1061_c39_de16_CLOCK_ENABLE <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_de16_CLOCK_ENABLE;
     -- Inputs
     opc_div2_uxn_opcodes_h_l1061_c39_de16_stack_index <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_de16_stack_index;
     opc_div2_uxn_opcodes_h_l1061_c39_de16_ins <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_de16_ins;
     opc_div2_uxn_opcodes_h_l1061_c39_de16_k <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_de16_k;
     -- Outputs
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_de16_return_output := opc_div2_uxn_opcodes_h_l1061_c39_de16_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_b7b0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_b7b0_return_output;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_beee_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_8bdb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_76c7_iftrue := VAR_opc_div2_uxn_opcodes_h_l1061_c39_de16_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_633b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_return_output;

     -- opc_and[uxn_opcodes_h_l1062_c39_beee] LATENCY=0
     -- Clock enable
     opc_and_uxn_opcodes_h_l1062_c39_beee_CLOCK_ENABLE <= VAR_opc_and_uxn_opcodes_h_l1062_c39_beee_CLOCK_ENABLE;
     -- Inputs
     opc_and_uxn_opcodes_h_l1062_c39_beee_stack_index <= VAR_opc_and_uxn_opcodes_h_l1062_c39_beee_stack_index;
     opc_and_uxn_opcodes_h_l1062_c39_beee_ins <= VAR_opc_and_uxn_opcodes_h_l1062_c39_beee_ins;
     opc_and_uxn_opcodes_h_l1062_c39_beee_k <= VAR_opc_and_uxn_opcodes_h_l1062_c39_beee_k;
     -- Outputs
     VAR_opc_and_uxn_opcodes_h_l1062_c39_beee_return_output := opc_and_uxn_opcodes_h_l1062_c39_beee_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_13f2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_633b_return_output;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_a0e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_13f2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_e68d_iftrue := VAR_opc_and_uxn_opcodes_h_l1062_c39_beee_return_output;
     -- opc_and2[uxn_opcodes_h_l1063_c39_a0e1] LATENCY=0
     -- Clock enable
     opc_and2_uxn_opcodes_h_l1063_c39_a0e1_CLOCK_ENABLE <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_a0e1_CLOCK_ENABLE;
     -- Inputs
     opc_and2_uxn_opcodes_h_l1063_c39_a0e1_stack_index <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_a0e1_stack_index;
     opc_and2_uxn_opcodes_h_l1063_c39_a0e1_ins <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_a0e1_ins;
     opc_and2_uxn_opcodes_h_l1063_c39_a0e1_k <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_a0e1_k;
     -- Outputs
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_a0e1_return_output := opc_and2_uxn_opcodes_h_l1063_c39_a0e1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_808b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_1179] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_808b_return_output;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_ee70_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_1179_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_b7b0_iftrue := VAR_opc_and2_uxn_opcodes_h_l1063_c39_a0e1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_cdb3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_fabb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_return_output;

     -- opc_ora[uxn_opcodes_h_l1064_c39_ee70] LATENCY=0
     -- Clock enable
     opc_ora_uxn_opcodes_h_l1064_c39_ee70_CLOCK_ENABLE <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_ee70_CLOCK_ENABLE;
     -- Inputs
     opc_ora_uxn_opcodes_h_l1064_c39_ee70_stack_index <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_ee70_stack_index;
     opc_ora_uxn_opcodes_h_l1064_c39_ee70_ins <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_ee70_ins;
     opc_ora_uxn_opcodes_h_l1064_c39_ee70_k <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_ee70_k;
     -- Outputs
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_ee70_return_output := opc_ora_uxn_opcodes_h_l1064_c39_ee70_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_cdb3_return_output;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_a408_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_fabb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_633b_iftrue := VAR_opc_ora_uxn_opcodes_h_l1064_c39_ee70_return_output;
     -- opc_ora2[uxn_opcodes_h_l1065_c39_a408] LATENCY=0
     -- Clock enable
     opc_ora2_uxn_opcodes_h_l1065_c39_a408_CLOCK_ENABLE <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_a408_CLOCK_ENABLE;
     -- Inputs
     opc_ora2_uxn_opcodes_h_l1065_c39_a408_stack_index <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_a408_stack_index;
     opc_ora2_uxn_opcodes_h_l1065_c39_a408_ins <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_a408_ins;
     opc_ora2_uxn_opcodes_h_l1065_c39_a408_k <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_a408_k;
     -- Outputs
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_a408_return_output := opc_ora2_uxn_opcodes_h_l1065_c39_a408_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_4204] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_07f5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_07f5_return_output;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_d395_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_4204_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_808b_iftrue := VAR_opc_ora2_uxn_opcodes_h_l1065_c39_a408_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_41ea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_c819] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_return_output;

     -- opc_eor[uxn_opcodes_h_l1066_c39_d395] LATENCY=0
     -- Clock enable
     opc_eor_uxn_opcodes_h_l1066_c39_d395_CLOCK_ENABLE <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_d395_CLOCK_ENABLE;
     -- Inputs
     opc_eor_uxn_opcodes_h_l1066_c39_d395_stack_index <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_d395_stack_index;
     opc_eor_uxn_opcodes_h_l1066_c39_d395_ins <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_d395_ins;
     opc_eor_uxn_opcodes_h_l1066_c39_d395_k <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_d395_k;
     -- Outputs
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_d395_return_output := opc_eor_uxn_opcodes_h_l1066_c39_d395_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_41ea_return_output;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9082_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_c819_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_cdb3_iftrue := VAR_opc_eor_uxn_opcodes_h_l1066_c39_d395_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_964c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_5c66] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_return_output;

     -- opc_eor2[uxn_opcodes_h_l1067_c39_9082] LATENCY=0
     -- Clock enable
     opc_eor2_uxn_opcodes_h_l1067_c39_9082_CLOCK_ENABLE <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9082_CLOCK_ENABLE;
     -- Inputs
     opc_eor2_uxn_opcodes_h_l1067_c39_9082_stack_index <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9082_stack_index;
     opc_eor2_uxn_opcodes_h_l1067_c39_9082_ins <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9082_ins;
     opc_eor2_uxn_opcodes_h_l1067_c39_9082_k <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9082_k;
     -- Outputs
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9082_return_output := opc_eor2_uxn_opcodes_h_l1067_c39_9082_return_output;

     -- Submodule level 70
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_5c66_return_output;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_2250_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_964c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_07f5_iftrue := VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9082_return_output;
     -- opc_sft[uxn_opcodes_h_l1068_c39_2250] LATENCY=0
     -- Clock enable
     opc_sft_uxn_opcodes_h_l1068_c39_2250_CLOCK_ENABLE <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_2250_CLOCK_ENABLE;
     -- Inputs
     opc_sft_uxn_opcodes_h_l1068_c39_2250_stack_index <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_2250_stack_index;
     opc_sft_uxn_opcodes_h_l1068_c39_2250_ins <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_2250_ins;
     opc_sft_uxn_opcodes_h_l1068_c39_2250_k <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_2250_k;
     -- Outputs
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_2250_return_output := opc_sft_uxn_opcodes_h_l1068_c39_2250_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_a3ab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_return_output;

     -- Submodule level 71
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_1a77_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_a3ab_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_41ea_iftrue := VAR_opc_sft_uxn_opcodes_h_l1068_c39_2250_return_output;
     -- opc_sft2[uxn_opcodes_h_l1069_c39_1a77] LATENCY=0
     -- Clock enable
     opc_sft2_uxn_opcodes_h_l1069_c39_1a77_CLOCK_ENABLE <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_1a77_CLOCK_ENABLE;
     -- Inputs
     opc_sft2_uxn_opcodes_h_l1069_c39_1a77_stack_index <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_1a77_stack_index;
     opc_sft2_uxn_opcodes_h_l1069_c39_1a77_ins <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_1a77_ins;
     opc_sft2_uxn_opcodes_h_l1069_c39_1a77_k <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_1a77_k;
     -- Outputs
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_1a77_return_output := opc_sft2_uxn_opcodes_h_l1069_c39_1a77_return_output;

     -- Submodule level 72
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_5c66_iftrue := VAR_opc_sft2_uxn_opcodes_h_l1069_c39_1a77_return_output;
     -- result_MUX[uxn_opcodes_h_l1069_c7_5c66] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1069_c7_5c66_cond <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_5c66_cond;
     result_MUX_uxn_opcodes_h_l1069_c7_5c66_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_5c66_iftrue;
     result_MUX_uxn_opcodes_h_l1069_c7_5c66_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_5c66_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_5c66_return_output := result_MUX_uxn_opcodes_h_l1069_c7_5c66_return_output;

     -- Submodule level 73
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_41ea_iffalse := VAR_result_MUX_uxn_opcodes_h_l1069_c7_5c66_return_output;
     -- result_MUX[uxn_opcodes_h_l1068_c7_41ea] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1068_c7_41ea_cond <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_41ea_cond;
     result_MUX_uxn_opcodes_h_l1068_c7_41ea_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_41ea_iftrue;
     result_MUX_uxn_opcodes_h_l1068_c7_41ea_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_41ea_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_41ea_return_output := result_MUX_uxn_opcodes_h_l1068_c7_41ea_return_output;

     -- Submodule level 74
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_07f5_iffalse := VAR_result_MUX_uxn_opcodes_h_l1068_c7_41ea_return_output;
     -- result_MUX[uxn_opcodes_h_l1067_c7_07f5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1067_c7_07f5_cond <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_07f5_cond;
     result_MUX_uxn_opcodes_h_l1067_c7_07f5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_07f5_iftrue;
     result_MUX_uxn_opcodes_h_l1067_c7_07f5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_07f5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_07f5_return_output := result_MUX_uxn_opcodes_h_l1067_c7_07f5_return_output;

     -- Submodule level 75
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_cdb3_iffalse := VAR_result_MUX_uxn_opcodes_h_l1067_c7_07f5_return_output;
     -- result_MUX[uxn_opcodes_h_l1066_c7_cdb3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1066_c7_cdb3_cond <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_cdb3_cond;
     result_MUX_uxn_opcodes_h_l1066_c7_cdb3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_cdb3_iftrue;
     result_MUX_uxn_opcodes_h_l1066_c7_cdb3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_cdb3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_cdb3_return_output := result_MUX_uxn_opcodes_h_l1066_c7_cdb3_return_output;

     -- Submodule level 76
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_808b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1066_c7_cdb3_return_output;
     -- result_MUX[uxn_opcodes_h_l1065_c7_808b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1065_c7_808b_cond <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_808b_cond;
     result_MUX_uxn_opcodes_h_l1065_c7_808b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_808b_iftrue;
     result_MUX_uxn_opcodes_h_l1065_c7_808b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_808b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_808b_return_output := result_MUX_uxn_opcodes_h_l1065_c7_808b_return_output;

     -- Submodule level 77
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_633b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1065_c7_808b_return_output;
     -- result_MUX[uxn_opcodes_h_l1064_c7_633b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1064_c7_633b_cond <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_633b_cond;
     result_MUX_uxn_opcodes_h_l1064_c7_633b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_633b_iftrue;
     result_MUX_uxn_opcodes_h_l1064_c7_633b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_633b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_633b_return_output := result_MUX_uxn_opcodes_h_l1064_c7_633b_return_output;

     -- Submodule level 78
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_b7b0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1064_c7_633b_return_output;
     -- result_MUX[uxn_opcodes_h_l1063_c7_b7b0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1063_c7_b7b0_cond <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_b7b0_cond;
     result_MUX_uxn_opcodes_h_l1063_c7_b7b0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_b7b0_iftrue;
     result_MUX_uxn_opcodes_h_l1063_c7_b7b0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_b7b0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_b7b0_return_output := result_MUX_uxn_opcodes_h_l1063_c7_b7b0_return_output;

     -- Submodule level 79
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_e68d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1063_c7_b7b0_return_output;
     -- result_MUX[uxn_opcodes_h_l1062_c7_e68d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1062_c7_e68d_cond <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_e68d_cond;
     result_MUX_uxn_opcodes_h_l1062_c7_e68d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_e68d_iftrue;
     result_MUX_uxn_opcodes_h_l1062_c7_e68d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_e68d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_e68d_return_output := result_MUX_uxn_opcodes_h_l1062_c7_e68d_return_output;

     -- Submodule level 80
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_76c7_iffalse := VAR_result_MUX_uxn_opcodes_h_l1062_c7_e68d_return_output;
     -- result_MUX[uxn_opcodes_h_l1061_c7_76c7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1061_c7_76c7_cond <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_76c7_cond;
     result_MUX_uxn_opcodes_h_l1061_c7_76c7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_76c7_iftrue;
     result_MUX_uxn_opcodes_h_l1061_c7_76c7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_76c7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_76c7_return_output := result_MUX_uxn_opcodes_h_l1061_c7_76c7_return_output;

     -- Submodule level 81
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_310c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1061_c7_76c7_return_output;
     -- result_MUX[uxn_opcodes_h_l1060_c7_310c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1060_c7_310c_cond <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_310c_cond;
     result_MUX_uxn_opcodes_h_l1060_c7_310c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_310c_iftrue;
     result_MUX_uxn_opcodes_h_l1060_c7_310c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_310c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_310c_return_output := result_MUX_uxn_opcodes_h_l1060_c7_310c_return_output;

     -- Submodule level 82
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_d385_iffalse := VAR_result_MUX_uxn_opcodes_h_l1060_c7_310c_return_output;
     -- result_MUX[uxn_opcodes_h_l1059_c7_d385] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1059_c7_d385_cond <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_d385_cond;
     result_MUX_uxn_opcodes_h_l1059_c7_d385_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_d385_iftrue;
     result_MUX_uxn_opcodes_h_l1059_c7_d385_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_d385_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_d385_return_output := result_MUX_uxn_opcodes_h_l1059_c7_d385_return_output;

     -- Submodule level 83
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_0436_iffalse := VAR_result_MUX_uxn_opcodes_h_l1059_c7_d385_return_output;
     -- result_MUX[uxn_opcodes_h_l1058_c7_0436] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1058_c7_0436_cond <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_0436_cond;
     result_MUX_uxn_opcodes_h_l1058_c7_0436_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_0436_iftrue;
     result_MUX_uxn_opcodes_h_l1058_c7_0436_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_0436_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_0436_return_output := result_MUX_uxn_opcodes_h_l1058_c7_0436_return_output;

     -- Submodule level 84
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_d8d8_iffalse := VAR_result_MUX_uxn_opcodes_h_l1058_c7_0436_return_output;
     -- result_MUX[uxn_opcodes_h_l1057_c7_d8d8] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1057_c7_d8d8_cond <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_d8d8_cond;
     result_MUX_uxn_opcodes_h_l1057_c7_d8d8_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_d8d8_iftrue;
     result_MUX_uxn_opcodes_h_l1057_c7_d8d8_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_d8d8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_d8d8_return_output := result_MUX_uxn_opcodes_h_l1057_c7_d8d8_return_output;

     -- Submodule level 85
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_a347_iffalse := VAR_result_MUX_uxn_opcodes_h_l1057_c7_d8d8_return_output;
     -- result_MUX[uxn_opcodes_h_l1056_c7_a347] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1056_c7_a347_cond <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_a347_cond;
     result_MUX_uxn_opcodes_h_l1056_c7_a347_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_a347_iftrue;
     result_MUX_uxn_opcodes_h_l1056_c7_a347_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_a347_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_a347_return_output := result_MUX_uxn_opcodes_h_l1056_c7_a347_return_output;

     -- Submodule level 86
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_d1b7_iffalse := VAR_result_MUX_uxn_opcodes_h_l1056_c7_a347_return_output;
     -- result_MUX[uxn_opcodes_h_l1055_c7_d1b7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1055_c7_d1b7_cond <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_d1b7_cond;
     result_MUX_uxn_opcodes_h_l1055_c7_d1b7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_d1b7_iftrue;
     result_MUX_uxn_opcodes_h_l1055_c7_d1b7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_d1b7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_d1b7_return_output := result_MUX_uxn_opcodes_h_l1055_c7_d1b7_return_output;

     -- Submodule level 87
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_35d8_iffalse := VAR_result_MUX_uxn_opcodes_h_l1055_c7_d1b7_return_output;
     -- result_MUX[uxn_opcodes_h_l1054_c7_35d8] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1054_c7_35d8_cond <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_35d8_cond;
     result_MUX_uxn_opcodes_h_l1054_c7_35d8_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_35d8_iftrue;
     result_MUX_uxn_opcodes_h_l1054_c7_35d8_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_35d8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_35d8_return_output := result_MUX_uxn_opcodes_h_l1054_c7_35d8_return_output;

     -- Submodule level 88
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_f2da_iffalse := VAR_result_MUX_uxn_opcodes_h_l1054_c7_35d8_return_output;
     -- result_MUX[uxn_opcodes_h_l1053_c7_f2da] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1053_c7_f2da_cond <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_f2da_cond;
     result_MUX_uxn_opcodes_h_l1053_c7_f2da_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_f2da_iftrue;
     result_MUX_uxn_opcodes_h_l1053_c7_f2da_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_f2da_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_f2da_return_output := result_MUX_uxn_opcodes_h_l1053_c7_f2da_return_output;

     -- Submodule level 89
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_bee1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1053_c7_f2da_return_output;
     -- result_MUX[uxn_opcodes_h_l1052_c7_bee1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1052_c7_bee1_cond <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_bee1_cond;
     result_MUX_uxn_opcodes_h_l1052_c7_bee1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_bee1_iftrue;
     result_MUX_uxn_opcodes_h_l1052_c7_bee1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_bee1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_bee1_return_output := result_MUX_uxn_opcodes_h_l1052_c7_bee1_return_output;

     -- Submodule level 90
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_6b7e_iffalse := VAR_result_MUX_uxn_opcodes_h_l1052_c7_bee1_return_output;
     -- result_MUX[uxn_opcodes_h_l1051_c7_6b7e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1051_c7_6b7e_cond <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_6b7e_cond;
     result_MUX_uxn_opcodes_h_l1051_c7_6b7e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_6b7e_iftrue;
     result_MUX_uxn_opcodes_h_l1051_c7_6b7e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_6b7e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_6b7e_return_output := result_MUX_uxn_opcodes_h_l1051_c7_6b7e_return_output;

     -- Submodule level 91
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_db9e_iffalse := VAR_result_MUX_uxn_opcodes_h_l1051_c7_6b7e_return_output;
     -- result_MUX[uxn_opcodes_h_l1050_c7_db9e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1050_c7_db9e_cond <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_db9e_cond;
     result_MUX_uxn_opcodes_h_l1050_c7_db9e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_db9e_iftrue;
     result_MUX_uxn_opcodes_h_l1050_c7_db9e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_db9e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_db9e_return_output := result_MUX_uxn_opcodes_h_l1050_c7_db9e_return_output;

     -- Submodule level 92
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_9c56_iffalse := VAR_result_MUX_uxn_opcodes_h_l1050_c7_db9e_return_output;
     -- result_MUX[uxn_opcodes_h_l1049_c7_9c56] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1049_c7_9c56_cond <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_9c56_cond;
     result_MUX_uxn_opcodes_h_l1049_c7_9c56_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_9c56_iftrue;
     result_MUX_uxn_opcodes_h_l1049_c7_9c56_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_9c56_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_9c56_return_output := result_MUX_uxn_opcodes_h_l1049_c7_9c56_return_output;

     -- Submodule level 93
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_72e3_iffalse := VAR_result_MUX_uxn_opcodes_h_l1049_c7_9c56_return_output;
     -- result_MUX[uxn_opcodes_h_l1048_c7_72e3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1048_c7_72e3_cond <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_72e3_cond;
     result_MUX_uxn_opcodes_h_l1048_c7_72e3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_72e3_iftrue;
     result_MUX_uxn_opcodes_h_l1048_c7_72e3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_72e3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_72e3_return_output := result_MUX_uxn_opcodes_h_l1048_c7_72e3_return_output;

     -- Submodule level 94
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_a82c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1048_c7_72e3_return_output;
     -- result_MUX[uxn_opcodes_h_l1047_c7_a82c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1047_c7_a82c_cond <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_a82c_cond;
     result_MUX_uxn_opcodes_h_l1047_c7_a82c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_a82c_iftrue;
     result_MUX_uxn_opcodes_h_l1047_c7_a82c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_a82c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_a82c_return_output := result_MUX_uxn_opcodes_h_l1047_c7_a82c_return_output;

     -- Submodule level 95
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_0b3d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1047_c7_a82c_return_output;
     -- result_MUX[uxn_opcodes_h_l1046_c7_0b3d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1046_c7_0b3d_cond <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_0b3d_cond;
     result_MUX_uxn_opcodes_h_l1046_c7_0b3d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_0b3d_iftrue;
     result_MUX_uxn_opcodes_h_l1046_c7_0b3d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_0b3d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_0b3d_return_output := result_MUX_uxn_opcodes_h_l1046_c7_0b3d_return_output;

     -- Submodule level 96
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_633b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1046_c7_0b3d_return_output;
     -- result_MUX[uxn_opcodes_h_l1045_c7_633b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1045_c7_633b_cond <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_633b_cond;
     result_MUX_uxn_opcodes_h_l1045_c7_633b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_633b_iftrue;
     result_MUX_uxn_opcodes_h_l1045_c7_633b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_633b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_633b_return_output := result_MUX_uxn_opcodes_h_l1045_c7_633b_return_output;

     -- Submodule level 97
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_bc59_iffalse := VAR_result_MUX_uxn_opcodes_h_l1045_c7_633b_return_output;
     -- result_MUX[uxn_opcodes_h_l1044_c7_bc59] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1044_c7_bc59_cond <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_bc59_cond;
     result_MUX_uxn_opcodes_h_l1044_c7_bc59_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_bc59_iftrue;
     result_MUX_uxn_opcodes_h_l1044_c7_bc59_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_bc59_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_bc59_return_output := result_MUX_uxn_opcodes_h_l1044_c7_bc59_return_output;

     -- Submodule level 98
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_94cd_iffalse := VAR_result_MUX_uxn_opcodes_h_l1044_c7_bc59_return_output;
     -- result_MUX[uxn_opcodes_h_l1043_c7_94cd] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1043_c7_94cd_cond <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_94cd_cond;
     result_MUX_uxn_opcodes_h_l1043_c7_94cd_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_94cd_iftrue;
     result_MUX_uxn_opcodes_h_l1043_c7_94cd_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_94cd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_94cd_return_output := result_MUX_uxn_opcodes_h_l1043_c7_94cd_return_output;

     -- Submodule level 99
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_59b6_iffalse := VAR_result_MUX_uxn_opcodes_h_l1043_c7_94cd_return_output;
     -- result_MUX[uxn_opcodes_h_l1042_c7_59b6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1042_c7_59b6_cond <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_59b6_cond;
     result_MUX_uxn_opcodes_h_l1042_c7_59b6_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_59b6_iftrue;
     result_MUX_uxn_opcodes_h_l1042_c7_59b6_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_59b6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_59b6_return_output := result_MUX_uxn_opcodes_h_l1042_c7_59b6_return_output;

     -- Submodule level 100
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_7fd2_iffalse := VAR_result_MUX_uxn_opcodes_h_l1042_c7_59b6_return_output;
     -- result_MUX[uxn_opcodes_h_l1041_c7_7fd2] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1041_c7_7fd2_cond <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_7fd2_cond;
     result_MUX_uxn_opcodes_h_l1041_c7_7fd2_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_7fd2_iftrue;
     result_MUX_uxn_opcodes_h_l1041_c7_7fd2_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_7fd2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_7fd2_return_output := result_MUX_uxn_opcodes_h_l1041_c7_7fd2_return_output;

     -- Submodule level 101
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_8044_iffalse := VAR_result_MUX_uxn_opcodes_h_l1041_c7_7fd2_return_output;
     -- result_MUX[uxn_opcodes_h_l1040_c7_8044] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1040_c7_8044_cond <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_8044_cond;
     result_MUX_uxn_opcodes_h_l1040_c7_8044_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_8044_iftrue;
     result_MUX_uxn_opcodes_h_l1040_c7_8044_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_8044_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_8044_return_output := result_MUX_uxn_opcodes_h_l1040_c7_8044_return_output;

     -- Submodule level 102
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_3c6d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1040_c7_8044_return_output;
     -- result_MUX[uxn_opcodes_h_l1039_c7_3c6d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1039_c7_3c6d_cond <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_3c6d_cond;
     result_MUX_uxn_opcodes_h_l1039_c7_3c6d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_3c6d_iftrue;
     result_MUX_uxn_opcodes_h_l1039_c7_3c6d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_3c6d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_3c6d_return_output := result_MUX_uxn_opcodes_h_l1039_c7_3c6d_return_output;

     -- Submodule level 103
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_c06d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1039_c7_3c6d_return_output;
     -- result_MUX[uxn_opcodes_h_l1038_c7_c06d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1038_c7_c06d_cond <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_c06d_cond;
     result_MUX_uxn_opcodes_h_l1038_c7_c06d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_c06d_iftrue;
     result_MUX_uxn_opcodes_h_l1038_c7_c06d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_c06d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_c06d_return_output := result_MUX_uxn_opcodes_h_l1038_c7_c06d_return_output;

     -- Submodule level 104
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_a56a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1038_c7_c06d_return_output;
     -- result_MUX[uxn_opcodes_h_l1037_c7_a56a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1037_c7_a56a_cond <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_a56a_cond;
     result_MUX_uxn_opcodes_h_l1037_c7_a56a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_a56a_iftrue;
     result_MUX_uxn_opcodes_h_l1037_c7_a56a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_a56a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_a56a_return_output := result_MUX_uxn_opcodes_h_l1037_c7_a56a_return_output;

     -- Submodule level 105
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_921a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1037_c7_a56a_return_output;
     -- result_MUX[uxn_opcodes_h_l1036_c7_921a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1036_c7_921a_cond <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_921a_cond;
     result_MUX_uxn_opcodes_h_l1036_c7_921a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_921a_iftrue;
     result_MUX_uxn_opcodes_h_l1036_c7_921a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_921a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_921a_return_output := result_MUX_uxn_opcodes_h_l1036_c7_921a_return_output;

     -- Submodule level 106
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_2527_iffalse := VAR_result_MUX_uxn_opcodes_h_l1036_c7_921a_return_output;
     -- result_MUX[uxn_opcodes_h_l1035_c7_2527] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1035_c7_2527_cond <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_2527_cond;
     result_MUX_uxn_opcodes_h_l1035_c7_2527_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_2527_iftrue;
     result_MUX_uxn_opcodes_h_l1035_c7_2527_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_2527_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_2527_return_output := result_MUX_uxn_opcodes_h_l1035_c7_2527_return_output;

     -- Submodule level 107
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_aced_iffalse := VAR_result_MUX_uxn_opcodes_h_l1035_c7_2527_return_output;
     -- result_MUX[uxn_opcodes_h_l1034_c7_aced] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1034_c7_aced_cond <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_aced_cond;
     result_MUX_uxn_opcodes_h_l1034_c7_aced_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_aced_iftrue;
     result_MUX_uxn_opcodes_h_l1034_c7_aced_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_aced_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_aced_return_output := result_MUX_uxn_opcodes_h_l1034_c7_aced_return_output;

     -- Submodule level 108
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_51d1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1034_c7_aced_return_output;
     -- result_MUX[uxn_opcodes_h_l1033_c7_51d1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1033_c7_51d1_cond <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_51d1_cond;
     result_MUX_uxn_opcodes_h_l1033_c7_51d1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_51d1_iftrue;
     result_MUX_uxn_opcodes_h_l1033_c7_51d1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_51d1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_51d1_return_output := result_MUX_uxn_opcodes_h_l1033_c7_51d1_return_output;

     -- Submodule level 109
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_2296_iffalse := VAR_result_MUX_uxn_opcodes_h_l1033_c7_51d1_return_output;
     -- result_MUX[uxn_opcodes_h_l1032_c7_2296] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1032_c7_2296_cond <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_2296_cond;
     result_MUX_uxn_opcodes_h_l1032_c7_2296_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_2296_iftrue;
     result_MUX_uxn_opcodes_h_l1032_c7_2296_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_2296_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_2296_return_output := result_MUX_uxn_opcodes_h_l1032_c7_2296_return_output;

     -- Submodule level 110
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_273d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1032_c7_2296_return_output;
     -- result_MUX[uxn_opcodes_h_l1031_c7_273d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1031_c7_273d_cond <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_273d_cond;
     result_MUX_uxn_opcodes_h_l1031_c7_273d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_273d_iftrue;
     result_MUX_uxn_opcodes_h_l1031_c7_273d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_273d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_273d_return_output := result_MUX_uxn_opcodes_h_l1031_c7_273d_return_output;

     -- Submodule level 111
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_4804_iffalse := VAR_result_MUX_uxn_opcodes_h_l1031_c7_273d_return_output;
     -- result_MUX[uxn_opcodes_h_l1030_c7_4804] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1030_c7_4804_cond <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_4804_cond;
     result_MUX_uxn_opcodes_h_l1030_c7_4804_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_4804_iftrue;
     result_MUX_uxn_opcodes_h_l1030_c7_4804_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_4804_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_4804_return_output := result_MUX_uxn_opcodes_h_l1030_c7_4804_return_output;

     -- Submodule level 112
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_7b7b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1030_c7_4804_return_output;
     -- result_MUX[uxn_opcodes_h_l1029_c7_7b7b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1029_c7_7b7b_cond <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_7b7b_cond;
     result_MUX_uxn_opcodes_h_l1029_c7_7b7b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_7b7b_iftrue;
     result_MUX_uxn_opcodes_h_l1029_c7_7b7b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_7b7b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_7b7b_return_output := result_MUX_uxn_opcodes_h_l1029_c7_7b7b_return_output;

     -- Submodule level 113
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_462f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1029_c7_7b7b_return_output;
     -- result_MUX[uxn_opcodes_h_l1028_c7_462f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1028_c7_462f_cond <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_462f_cond;
     result_MUX_uxn_opcodes_h_l1028_c7_462f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_462f_iftrue;
     result_MUX_uxn_opcodes_h_l1028_c7_462f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_462f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_462f_return_output := result_MUX_uxn_opcodes_h_l1028_c7_462f_return_output;

     -- Submodule level 114
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_ca1b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1028_c7_462f_return_output;
     -- result_MUX[uxn_opcodes_h_l1027_c7_ca1b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1027_c7_ca1b_cond <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_ca1b_cond;
     result_MUX_uxn_opcodes_h_l1027_c7_ca1b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_ca1b_iftrue;
     result_MUX_uxn_opcodes_h_l1027_c7_ca1b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_ca1b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_ca1b_return_output := result_MUX_uxn_opcodes_h_l1027_c7_ca1b_return_output;

     -- Submodule level 115
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_9a91_iffalse := VAR_result_MUX_uxn_opcodes_h_l1027_c7_ca1b_return_output;
     -- result_MUX[uxn_opcodes_h_l1026_c7_9a91] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1026_c7_9a91_cond <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_9a91_cond;
     result_MUX_uxn_opcodes_h_l1026_c7_9a91_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_9a91_iftrue;
     result_MUX_uxn_opcodes_h_l1026_c7_9a91_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_9a91_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_9a91_return_output := result_MUX_uxn_opcodes_h_l1026_c7_9a91_return_output;

     -- Submodule level 116
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_c74f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1026_c7_9a91_return_output;
     -- result_MUX[uxn_opcodes_h_l1025_c7_c74f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1025_c7_c74f_cond <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_c74f_cond;
     result_MUX_uxn_opcodes_h_l1025_c7_c74f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_c74f_iftrue;
     result_MUX_uxn_opcodes_h_l1025_c7_c74f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_c74f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_c74f_return_output := result_MUX_uxn_opcodes_h_l1025_c7_c74f_return_output;

     -- Submodule level 117
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_b3fa_iffalse := VAR_result_MUX_uxn_opcodes_h_l1025_c7_c74f_return_output;
     -- result_MUX[uxn_opcodes_h_l1024_c7_b3fa] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1024_c7_b3fa_cond <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_b3fa_cond;
     result_MUX_uxn_opcodes_h_l1024_c7_b3fa_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_b3fa_iftrue;
     result_MUX_uxn_opcodes_h_l1024_c7_b3fa_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_b3fa_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_b3fa_return_output := result_MUX_uxn_opcodes_h_l1024_c7_b3fa_return_output;

     -- Submodule level 118
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_2922_iffalse := VAR_result_MUX_uxn_opcodes_h_l1024_c7_b3fa_return_output;
     -- result_MUX[uxn_opcodes_h_l1023_c7_2922] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1023_c7_2922_cond <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_2922_cond;
     result_MUX_uxn_opcodes_h_l1023_c7_2922_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_2922_iftrue;
     result_MUX_uxn_opcodes_h_l1023_c7_2922_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_2922_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_2922_return_output := result_MUX_uxn_opcodes_h_l1023_c7_2922_return_output;

     -- Submodule level 119
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_b2f3_iffalse := VAR_result_MUX_uxn_opcodes_h_l1023_c7_2922_return_output;
     -- result_MUX[uxn_opcodes_h_l1022_c7_b2f3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1022_c7_b2f3_cond <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_b2f3_cond;
     result_MUX_uxn_opcodes_h_l1022_c7_b2f3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_b2f3_iftrue;
     result_MUX_uxn_opcodes_h_l1022_c7_b2f3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_b2f3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_b2f3_return_output := result_MUX_uxn_opcodes_h_l1022_c7_b2f3_return_output;

     -- Submodule level 120
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_0ef7_iffalse := VAR_result_MUX_uxn_opcodes_h_l1022_c7_b2f3_return_output;
     -- result_MUX[uxn_opcodes_h_l1021_c7_0ef7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1021_c7_0ef7_cond <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_0ef7_cond;
     result_MUX_uxn_opcodes_h_l1021_c7_0ef7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_0ef7_iftrue;
     result_MUX_uxn_opcodes_h_l1021_c7_0ef7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_0ef7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_0ef7_return_output := result_MUX_uxn_opcodes_h_l1021_c7_0ef7_return_output;

     -- Submodule level 121
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_8e81_iffalse := VAR_result_MUX_uxn_opcodes_h_l1021_c7_0ef7_return_output;
     -- result_MUX[uxn_opcodes_h_l1020_c7_8e81] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1020_c7_8e81_cond <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_8e81_cond;
     result_MUX_uxn_opcodes_h_l1020_c7_8e81_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_8e81_iftrue;
     result_MUX_uxn_opcodes_h_l1020_c7_8e81_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_8e81_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_8e81_return_output := result_MUX_uxn_opcodes_h_l1020_c7_8e81_return_output;

     -- Submodule level 122
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_3567_iffalse := VAR_result_MUX_uxn_opcodes_h_l1020_c7_8e81_return_output;
     -- result_MUX[uxn_opcodes_h_l1019_c7_3567] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1019_c7_3567_cond <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_3567_cond;
     result_MUX_uxn_opcodes_h_l1019_c7_3567_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_3567_iftrue;
     result_MUX_uxn_opcodes_h_l1019_c7_3567_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_3567_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_3567_return_output := result_MUX_uxn_opcodes_h_l1019_c7_3567_return_output;

     -- Submodule level 123
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_7852_iffalse := VAR_result_MUX_uxn_opcodes_h_l1019_c7_3567_return_output;
     -- result_MUX[uxn_opcodes_h_l1018_c7_7852] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1018_c7_7852_cond <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_7852_cond;
     result_MUX_uxn_opcodes_h_l1018_c7_7852_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_7852_iftrue;
     result_MUX_uxn_opcodes_h_l1018_c7_7852_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_7852_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_7852_return_output := result_MUX_uxn_opcodes_h_l1018_c7_7852_return_output;

     -- Submodule level 124
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_2599_iffalse := VAR_result_MUX_uxn_opcodes_h_l1018_c7_7852_return_output;
     -- result_MUX[uxn_opcodes_h_l1017_c7_2599] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1017_c7_2599_cond <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_2599_cond;
     result_MUX_uxn_opcodes_h_l1017_c7_2599_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_2599_iftrue;
     result_MUX_uxn_opcodes_h_l1017_c7_2599_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_2599_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_2599_return_output := result_MUX_uxn_opcodes_h_l1017_c7_2599_return_output;

     -- Submodule level 125
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_814a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1017_c7_2599_return_output;
     -- result_MUX[uxn_opcodes_h_l1016_c7_814a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1016_c7_814a_cond <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_814a_cond;
     result_MUX_uxn_opcodes_h_l1016_c7_814a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_814a_iftrue;
     result_MUX_uxn_opcodes_h_l1016_c7_814a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_814a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_814a_return_output := result_MUX_uxn_opcodes_h_l1016_c7_814a_return_output;

     -- Submodule level 126
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_307c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1016_c7_814a_return_output;
     -- result_MUX[uxn_opcodes_h_l1015_c7_307c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1015_c7_307c_cond <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_307c_cond;
     result_MUX_uxn_opcodes_h_l1015_c7_307c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_307c_iftrue;
     result_MUX_uxn_opcodes_h_l1015_c7_307c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_307c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_307c_return_output := result_MUX_uxn_opcodes_h_l1015_c7_307c_return_output;

     -- Submodule level 127
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_d146_iffalse := VAR_result_MUX_uxn_opcodes_h_l1015_c7_307c_return_output;
     -- result_MUX[uxn_opcodes_h_l1014_c7_d146] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1014_c7_d146_cond <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_d146_cond;
     result_MUX_uxn_opcodes_h_l1014_c7_d146_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_d146_iftrue;
     result_MUX_uxn_opcodes_h_l1014_c7_d146_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_d146_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_d146_return_output := result_MUX_uxn_opcodes_h_l1014_c7_d146_return_output;

     -- Submodule level 128
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_5abc_iffalse := VAR_result_MUX_uxn_opcodes_h_l1014_c7_d146_return_output;
     -- result_MUX[uxn_opcodes_h_l1013_c7_5abc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1013_c7_5abc_cond <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_5abc_cond;
     result_MUX_uxn_opcodes_h_l1013_c7_5abc_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_5abc_iftrue;
     result_MUX_uxn_opcodes_h_l1013_c7_5abc_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_5abc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_5abc_return_output := result_MUX_uxn_opcodes_h_l1013_c7_5abc_return_output;

     -- Submodule level 129
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_78a9_iffalse := VAR_result_MUX_uxn_opcodes_h_l1013_c7_5abc_return_output;
     -- result_MUX[uxn_opcodes_h_l1012_c7_78a9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1012_c7_78a9_cond <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_78a9_cond;
     result_MUX_uxn_opcodes_h_l1012_c7_78a9_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_78a9_iftrue;
     result_MUX_uxn_opcodes_h_l1012_c7_78a9_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_78a9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_78a9_return_output := result_MUX_uxn_opcodes_h_l1012_c7_78a9_return_output;

     -- Submodule level 130
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_c4c9_iffalse := VAR_result_MUX_uxn_opcodes_h_l1012_c7_78a9_return_output;
     -- result_MUX[uxn_opcodes_h_l1011_c7_c4c9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1011_c7_c4c9_cond <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_c4c9_cond;
     result_MUX_uxn_opcodes_h_l1011_c7_c4c9_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_c4c9_iftrue;
     result_MUX_uxn_opcodes_h_l1011_c7_c4c9_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_c4c9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_c4c9_return_output := result_MUX_uxn_opcodes_h_l1011_c7_c4c9_return_output;

     -- Submodule level 131
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_8ad9_iffalse := VAR_result_MUX_uxn_opcodes_h_l1011_c7_c4c9_return_output;
     -- result_MUX[uxn_opcodes_h_l1010_c7_8ad9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1010_c7_8ad9_cond <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_8ad9_cond;
     result_MUX_uxn_opcodes_h_l1010_c7_8ad9_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_8ad9_iftrue;
     result_MUX_uxn_opcodes_h_l1010_c7_8ad9_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_8ad9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_8ad9_return_output := result_MUX_uxn_opcodes_h_l1010_c7_8ad9_return_output;

     -- Submodule level 132
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_9260_iffalse := VAR_result_MUX_uxn_opcodes_h_l1010_c7_8ad9_return_output;
     -- result_MUX[uxn_opcodes_h_l1009_c7_9260] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1009_c7_9260_cond <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_9260_cond;
     result_MUX_uxn_opcodes_h_l1009_c7_9260_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_9260_iftrue;
     result_MUX_uxn_opcodes_h_l1009_c7_9260_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_9260_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_9260_return_output := result_MUX_uxn_opcodes_h_l1009_c7_9260_return_output;

     -- Submodule level 133
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_879d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1009_c7_9260_return_output;
     -- result_MUX[uxn_opcodes_h_l1008_c7_879d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1008_c7_879d_cond <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_879d_cond;
     result_MUX_uxn_opcodes_h_l1008_c7_879d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_879d_iftrue;
     result_MUX_uxn_opcodes_h_l1008_c7_879d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_879d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_879d_return_output := result_MUX_uxn_opcodes_h_l1008_c7_879d_return_output;

     -- Submodule level 134
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_72aa_iffalse := VAR_result_MUX_uxn_opcodes_h_l1008_c7_879d_return_output;
     -- result_MUX[uxn_opcodes_h_l1007_c7_72aa] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1007_c7_72aa_cond <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_72aa_cond;
     result_MUX_uxn_opcodes_h_l1007_c7_72aa_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_72aa_iftrue;
     result_MUX_uxn_opcodes_h_l1007_c7_72aa_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_72aa_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_72aa_return_output := result_MUX_uxn_opcodes_h_l1007_c7_72aa_return_output;

     -- Submodule level 135
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_30fd_iffalse := VAR_result_MUX_uxn_opcodes_h_l1007_c7_72aa_return_output;
     -- result_MUX[uxn_opcodes_h_l1006_c7_30fd] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1006_c7_30fd_cond <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_30fd_cond;
     result_MUX_uxn_opcodes_h_l1006_c7_30fd_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_30fd_iftrue;
     result_MUX_uxn_opcodes_h_l1006_c7_30fd_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_30fd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_30fd_return_output := result_MUX_uxn_opcodes_h_l1006_c7_30fd_return_output;

     -- Submodule level 136
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_f48a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1006_c7_30fd_return_output;
     -- result_MUX[uxn_opcodes_h_l1005_c7_f48a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1005_c7_f48a_cond <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_f48a_cond;
     result_MUX_uxn_opcodes_h_l1005_c7_f48a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_f48a_iftrue;
     result_MUX_uxn_opcodes_h_l1005_c7_f48a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_f48a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_f48a_return_output := result_MUX_uxn_opcodes_h_l1005_c7_f48a_return_output;

     -- Submodule level 137
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_2368_iffalse := VAR_result_MUX_uxn_opcodes_h_l1005_c7_f48a_return_output;
     -- result_MUX[uxn_opcodes_h_l1004_c7_2368] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1004_c7_2368_cond <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_2368_cond;
     result_MUX_uxn_opcodes_h_l1004_c7_2368_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_2368_iftrue;
     result_MUX_uxn_opcodes_h_l1004_c7_2368_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_2368_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_2368_return_output := result_MUX_uxn_opcodes_h_l1004_c7_2368_return_output;

     -- Submodule level 138
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_cde3_iffalse := VAR_result_MUX_uxn_opcodes_h_l1004_c7_2368_return_output;
     -- result_MUX[uxn_opcodes_h_l1003_c7_cde3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1003_c7_cde3_cond <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_cde3_cond;
     result_MUX_uxn_opcodes_h_l1003_c7_cde3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_cde3_iftrue;
     result_MUX_uxn_opcodes_h_l1003_c7_cde3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_cde3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_cde3_return_output := result_MUX_uxn_opcodes_h_l1003_c7_cde3_return_output;

     -- Submodule level 139
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_6f36_iffalse := VAR_result_MUX_uxn_opcodes_h_l1003_c7_cde3_return_output;
     -- result_MUX[uxn_opcodes_h_l1002_c7_6f36] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1002_c7_6f36_cond <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_6f36_cond;
     result_MUX_uxn_opcodes_h_l1002_c7_6f36_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_6f36_iftrue;
     result_MUX_uxn_opcodes_h_l1002_c7_6f36_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_6f36_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_6f36_return_output := result_MUX_uxn_opcodes_h_l1002_c7_6f36_return_output;

     -- Submodule level 140
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_7499_iffalse := VAR_result_MUX_uxn_opcodes_h_l1002_c7_6f36_return_output;
     -- result_MUX[uxn_opcodes_h_l1001_c7_7499] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1001_c7_7499_cond <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_7499_cond;
     result_MUX_uxn_opcodes_h_l1001_c7_7499_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_7499_iftrue;
     result_MUX_uxn_opcodes_h_l1001_c7_7499_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_7499_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_7499_return_output := result_MUX_uxn_opcodes_h_l1001_c7_7499_return_output;

     -- Submodule level 141
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_3295_iffalse := VAR_result_MUX_uxn_opcodes_h_l1001_c7_7499_return_output;
     -- result_MUX[uxn_opcodes_h_l1000_c2_3295] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1000_c2_3295_cond <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_3295_cond;
     result_MUX_uxn_opcodes_h_l1000_c2_3295_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_3295_iftrue;
     result_MUX_uxn_opcodes_h_l1000_c2_3295_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_3295_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_3295_return_output := result_MUX_uxn_opcodes_h_l1000_c2_3295_return_output;

     -- Submodule level 142
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l1000_c2_3295_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l1000_c2_3295_return_output;
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
