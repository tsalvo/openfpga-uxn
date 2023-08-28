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
-- Submodules: 293
entity eval_opcode_phased_0CLK_c454be67 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(3 downto 0);
 pc : in unsigned(15 downto 0);
 sp : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 opcode : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end eval_opcode_phased_0CLK_c454be67;
architecture arch of eval_opcode_phased_0CLK_c454be67 is
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
-- BIN_OP_EQ[uxn_opcodes_phased_h_l1264_c6_a306]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1265_c7_dfb7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1264_c2_41dd]
signal result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_return_output : unsigned(0 downto 0);

-- opc_brk_phased[uxn_opcodes_phased_h_l1264_c34_74e2]
signal opc_brk_phased_uxn_opcodes_phased_h_l1264_c34_74e2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1265_c11_0600]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1265_c1_1110]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1266_c7_589c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1265_c7_dfb7]
signal result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_return_output : unsigned(0 downto 0);

-- opc_jci_phased[uxn_opcodes_phased_h_l1265_c39_0a61]
signal opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_phase : unsigned(3 downto 0);
signal opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_pc : unsigned(15 downto 0);
signal opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_sp : unsigned(7 downto 0);
signal opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_stack_index : unsigned(0 downto 0);
signal opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1266_c11_3090]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1266_c1_1242]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1267_c7_04c1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1266_c7_589c]
signal result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_return_output : unsigned(0 downto 0);

-- opc_jmi_phased[uxn_opcodes_phased_h_l1266_c39_ed6c]
signal opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_phase : unsigned(3 downto 0);
signal opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_pc : unsigned(15 downto 0);
signal opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_sp : unsigned(7 downto 0);
signal opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1267_c11_4a65]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1267_c1_a19a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1268_c7_523a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1267_c7_04c1]
signal result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_return_output : unsigned(0 downto 0);

-- opc_jsi_phased[uxn_opcodes_phased_h_l1267_c39_cc3c]
signal opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_phase : unsigned(3 downto 0);
signal opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_pc : unsigned(15 downto 0);
signal opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_sp : unsigned(7 downto 0);
signal opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_stack_index : unsigned(0 downto 0);
signal opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_ins : unsigned(7 downto 0);
signal opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1268_c11_01ab]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1268_c1_9bd5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1269_c7_9a97]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1268_c7_523a]
signal result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_return_output : unsigned(0 downto 0);

-- opc_lit_phased[uxn_opcodes_phased_h_l1268_c39_95bd]
signal opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_phase : unsigned(3 downto 0);
signal opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_pc : unsigned(15 downto 0);
signal opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_sp : unsigned(7 downto 0);
signal opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_stack_index : unsigned(0 downto 0);
signal opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_ins : unsigned(7 downto 0);
signal opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1269_c11_c61c]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1269_c1_5232]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1270_c7_ad71]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1269_c7_9a97]
signal result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_return_output : unsigned(0 downto 0);

-- opc_lit2_phased[uxn_opcodes_phased_h_l1269_c39_9a1e]
signal opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_phase : unsigned(3 downto 0);
signal opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_pc : unsigned(15 downto 0);
signal opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_sp : unsigned(7 downto 0);
signal opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_stack_index : unsigned(0 downto 0);
signal opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_ins : unsigned(7 downto 0);
signal opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1270_c11_9a2b]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1270_c1_1bb4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1271_c7_6e23]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1270_c7_ad71]
signal result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_return_output : unsigned(0 downto 0);

-- opc_lit_phased[uxn_opcodes_phased_h_l1270_c39_e8ce]
signal opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_phase : unsigned(3 downto 0);
signal opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_pc : unsigned(15 downto 0);
signal opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_sp : unsigned(7 downto 0);
signal opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_stack_index : unsigned(0 downto 0);
signal opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_ins : unsigned(7 downto 0);
signal opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1271_c11_2a28]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1271_c1_469a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1272_c7_ea82]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1271_c7_6e23]
signal result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_return_output : unsigned(0 downto 0);

-- opc_lit2_phased[uxn_opcodes_phased_h_l1271_c39_1924]
signal opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_phase : unsigned(3 downto 0);
signal opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_pc : unsigned(15 downto 0);
signal opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_sp : unsigned(7 downto 0);
signal opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_stack_index : unsigned(0 downto 0);
signal opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_ins : unsigned(7 downto 0);
signal opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1272_c11_5a27]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1272_c1_87ab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1273_c7_63d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1272_c7_ea82]
signal result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_return_output : unsigned(0 downto 0);

-- opc_inc_phased[uxn_opcodes_phased_h_l1272_c39_1607]
signal opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_phase : unsigned(3 downto 0);
signal opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_pc : unsigned(15 downto 0);
signal opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_sp : unsigned(7 downto 0);
signal opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_stack_index : unsigned(0 downto 0);
signal opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_ins : unsigned(7 downto 0);
signal opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_k : unsigned(7 downto 0);
signal opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1273_c11_8a0d]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1274_c7_cf60]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1273_c7_63d4]
signal result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1274_c11_a2ef]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1274_c1_6181]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1275_c7_e09a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1274_c7_cf60]
signal result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_return_output : unsigned(0 downto 0);

-- opc_pop_phased[uxn_opcodes_phased_h_l1274_c39_a660]
signal opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_phase : unsigned(3 downto 0);
signal opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_pc : unsigned(15 downto 0);
signal opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_sp : unsigned(7 downto 0);
signal opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_stack_index : unsigned(0 downto 0);
signal opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_ins : unsigned(7 downto 0);
signal opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_k : unsigned(7 downto 0);
signal opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1275_c11_e716]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1275_c1_ecb9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1276_c7_94f5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1275_c7_e09a]
signal result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_return_output : unsigned(0 downto 0);

-- opc_pop2_phased[uxn_opcodes_phased_h_l1275_c39_7c50]
signal opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_phase : unsigned(3 downto 0);
signal opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_pc : unsigned(15 downto 0);
signal opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_sp : unsigned(7 downto 0);
signal opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_stack_index : unsigned(0 downto 0);
signal opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_ins : unsigned(7 downto 0);
signal opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_k : unsigned(7 downto 0);
signal opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1276_c11_103c]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1276_c1_3292]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1277_c7_0431]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1276_c7_94f5]
signal result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_return_output : unsigned(0 downto 0);

-- opc_nip_phased[uxn_opcodes_phased_h_l1276_c39_ddf8]
signal opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_phase : unsigned(3 downto 0);
signal opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_pc : unsigned(15 downto 0);
signal opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_sp : unsigned(7 downto 0);
signal opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_stack_index : unsigned(0 downto 0);
signal opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_ins : unsigned(7 downto 0);
signal opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_k : unsigned(7 downto 0);
signal opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1277_c11_ee8f]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1278_c7_5918]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1277_c7_0431]
signal result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1278_c11_bb60]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1278_c1_834e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1279_c7_9544]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1278_c7_5918]
signal result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_return_output : unsigned(0 downto 0);

-- opc_swp_phased[uxn_opcodes_phased_h_l1278_c39_09c8]
signal opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_phase : unsigned(3 downto 0);
signal opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_pc : unsigned(15 downto 0);
signal opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_sp : unsigned(7 downto 0);
signal opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_stack_index : unsigned(0 downto 0);
signal opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_ins : unsigned(7 downto 0);
signal opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_k : unsigned(7 downto 0);
signal opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1279_c11_f831]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1280_c7_f489]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1279_c7_9544]
signal result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1280_c11_4e7d]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1280_c1_4e7b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1281_c7_7cb5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1280_c7_f489]
signal result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_return_output : unsigned(0 downto 0);

-- opc_rot_phased[uxn_opcodes_phased_h_l1280_c39_85ce]
signal opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_phase : unsigned(3 downto 0);
signal opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_pc : unsigned(15 downto 0);
signal opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_sp : unsigned(7 downto 0);
signal opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_stack_index : unsigned(0 downto 0);
signal opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_ins : unsigned(7 downto 0);
signal opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_k : unsigned(7 downto 0);
signal opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1281_c11_715c]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1282_c7_5960]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1281_c7_7cb5]
signal result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1282_c11_4f9d]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1282_c1_cb3f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1283_c7_ab85]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1282_c7_5960]
signal result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_return_output : unsigned(0 downto 0);

-- opc_dup_phased[uxn_opcodes_phased_h_l1282_c39_9741]
signal opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_phase : unsigned(3 downto 0);
signal opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_pc : unsigned(15 downto 0);
signal opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_sp : unsigned(7 downto 0);
signal opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_stack_index : unsigned(0 downto 0);
signal opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_ins : unsigned(7 downto 0);
signal opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_k : unsigned(7 downto 0);
signal opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1283_c11_3579]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1284_c7_2929]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1283_c7_ab85]
signal result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1284_c11_0e68]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1284_c1_b17b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1285_c7_da6a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1284_c7_2929]
signal result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_return_output : unsigned(0 downto 0);

-- opc_ovr_phased[uxn_opcodes_phased_h_l1284_c39_8fa7]
signal opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_phase : unsigned(3 downto 0);
signal opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_pc : unsigned(15 downto 0);
signal opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_sp : unsigned(7 downto 0);
signal opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_stack_index : unsigned(0 downto 0);
signal opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_ins : unsigned(7 downto 0);
signal opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_k : unsigned(7 downto 0);
signal opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1285_c11_7dfe]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1285_c1_de20]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1286_c7_e0be]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1285_c7_da6a]
signal result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_return_output : unsigned(0 downto 0);

-- opc_ovr2_phased[uxn_opcodes_phased_h_l1285_c39_7121]
signal opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_phase : unsigned(3 downto 0);
signal opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_pc : unsigned(15 downto 0);
signal opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_sp : unsigned(7 downto 0);
signal opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_stack_index : unsigned(0 downto 0);
signal opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_ins : unsigned(7 downto 0);
signal opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_k : unsigned(7 downto 0);
signal opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1286_c11_bda1]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1286_c1_559c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1287_c7_8005]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1286_c7_e0be]
signal result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_return_output : unsigned(0 downto 0);

-- opc_equ_phased[uxn_opcodes_phased_h_l1286_c39_0049]
signal opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_phase : unsigned(3 downto 0);
signal opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_pc : unsigned(15 downto 0);
signal opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_sp : unsigned(7 downto 0);
signal opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_stack_index : unsigned(0 downto 0);
signal opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_ins : unsigned(7 downto 0);
signal opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_k : unsigned(7 downto 0);
signal opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1287_c11_eb52]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1288_c7_7fd0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1287_c7_8005]
signal result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1288_c11_6850]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1288_c1_5074]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1289_c7_23df]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1288_c7_7fd0]
signal result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_return_output : unsigned(0 downto 0);

-- opc_neq_phased[uxn_opcodes_phased_h_l1288_c39_eaed]
signal opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_phase : unsigned(3 downto 0);
signal opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_pc : unsigned(15 downto 0);
signal opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_sp : unsigned(7 downto 0);
signal opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_stack_index : unsigned(0 downto 0);
signal opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_ins : unsigned(7 downto 0);
signal opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_k : unsigned(7 downto 0);
signal opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1289_c11_d455]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1290_c7_f597]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1289_c7_23df]
signal result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1290_c11_11e5]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1290_c1_0e38]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1291_c7_a527]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1290_c7_f597]
signal result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_return_output : unsigned(0 downto 0);

-- opc_gth_phased[uxn_opcodes_phased_h_l1290_c39_5713]
signal opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_phase : unsigned(3 downto 0);
signal opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_pc : unsigned(15 downto 0);
signal opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_sp : unsigned(7 downto 0);
signal opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_stack_index : unsigned(0 downto 0);
signal opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_ins : unsigned(7 downto 0);
signal opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_k : unsigned(7 downto 0);
signal opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1291_c11_03a2]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1292_c7_48df]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1291_c7_a527]
signal result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1292_c11_8fd7]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1292_c1_f23a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1293_c7_3eef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1292_c7_48df]
signal result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_return_output : unsigned(0 downto 0);

-- opc_lth_phased[uxn_opcodes_phased_h_l1292_c39_bf73]
signal opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_phase : unsigned(3 downto 0);
signal opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_pc : unsigned(15 downto 0);
signal opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_sp : unsigned(7 downto 0);
signal opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_stack_index : unsigned(0 downto 0);
signal opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_ins : unsigned(7 downto 0);
signal opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_k : unsigned(7 downto 0);
signal opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1293_c11_d125]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1294_c7_92c4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1293_c7_3eef]
signal result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1294_c11_9713]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1294_c1_a332]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1295_c7_d00c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1294_c7_92c4]
signal result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_return_output : unsigned(0 downto 0);

-- opc_jmp_phased[uxn_opcodes_phased_h_l1294_c39_f60e]
signal opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_phase : unsigned(3 downto 0);
signal opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_pc : unsigned(15 downto 0);
signal opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_sp : unsigned(7 downto 0);
signal opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_stack_index : unsigned(0 downto 0);
signal opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_ins : unsigned(7 downto 0);
signal opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_k : unsigned(7 downto 0);
signal opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1295_c11_5de2]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1295_c1_016b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1296_c7_a23a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1295_c7_d00c]
signal result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_return_output : unsigned(0 downto 0);

-- opc_jmp2_phased[uxn_opcodes_phased_h_l1295_c39_c16d]
signal opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_phase : unsigned(3 downto 0);
signal opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_pc : unsigned(15 downto 0);
signal opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_sp : unsigned(7 downto 0);
signal opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_stack_index : unsigned(0 downto 0);
signal opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_ins : unsigned(7 downto 0);
signal opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_k : unsigned(7 downto 0);
signal opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1296_c11_608d]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1296_c1_8af1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1297_c7_919a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1296_c7_a23a]
signal result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_return_output : unsigned(0 downto 0);

-- opc_jcn_phased[uxn_opcodes_phased_h_l1296_c39_3f47]
signal opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_phase : unsigned(3 downto 0);
signal opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_pc : unsigned(15 downto 0);
signal opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_sp : unsigned(7 downto 0);
signal opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_stack_index : unsigned(0 downto 0);
signal opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_ins : unsigned(7 downto 0);
signal opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_k : unsigned(7 downto 0);
signal opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1297_c11_e95a]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1298_c7_0922]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1297_c7_919a]
signal result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1298_c11_bb32]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1298_c1_8038]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1299_c7_5b4b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1298_c7_0922]
signal result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_return_output : unsigned(0 downto 0);

-- opc_jsr_phased[uxn_opcodes_phased_h_l1298_c39_478f]
signal opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_phase : unsigned(3 downto 0);
signal opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_pc : unsigned(15 downto 0);
signal opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_sp : unsigned(7 downto 0);
signal opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_stack_index : unsigned(0 downto 0);
signal opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_ins : unsigned(7 downto 0);
signal opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_k : unsigned(7 downto 0);
signal opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1299_c11_eb5c]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1300_c7_0aa1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1299_c7_5b4b]
signal result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1300_c11_b197]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1300_c1_e54b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1301_c7_e84f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1300_c7_0aa1]
signal result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_return_output : unsigned(0 downto 0);

-- opc_sth_phased[uxn_opcodes_phased_h_l1300_c39_2129]
signal opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_phase : unsigned(3 downto 0);
signal opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_pc : unsigned(15 downto 0);
signal opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_sp : unsigned(7 downto 0);
signal opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_stack_index : unsigned(0 downto 0);
signal opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_ins : unsigned(7 downto 0);
signal opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_k : unsigned(7 downto 0);
signal opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1301_c11_d8fe]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1302_c7_c3df]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1301_c7_e84f]
signal result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1302_c11_4fb5]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1302_c1_8f10]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1303_c7_b10e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1302_c7_c3df]
signal result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_return_output : unsigned(0 downto 0);

-- opc_ldz_phased[uxn_opcodes_phased_h_l1302_c39_d680]
signal opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_phase : unsigned(3 downto 0);
signal opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_pc : unsigned(15 downto 0);
signal opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_sp : unsigned(7 downto 0);
signal opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_stack_index : unsigned(0 downto 0);
signal opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_ins : unsigned(7 downto 0);
signal opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_k : unsigned(7 downto 0);
signal opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1303_c11_31a5]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1304_c7_ffe7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1303_c7_b10e]
signal result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1304_c11_e29e]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1304_c1_14a0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1305_c7_237c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1304_c7_ffe7]
signal result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_return_output : unsigned(0 downto 0);

-- opc_stz_phased[uxn_opcodes_phased_h_l1304_c39_dfa7]
signal opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_phase : unsigned(3 downto 0);
signal opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_pc : unsigned(15 downto 0);
signal opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_sp : unsigned(7 downto 0);
signal opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_stack_index : unsigned(0 downto 0);
signal opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_ins : unsigned(7 downto 0);
signal opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_k : unsigned(7 downto 0);
signal opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1305_c11_0c98]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1306_c7_f52b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1305_c7_237c]
signal result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1306_c11_19c6]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1306_c1_0d91]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1307_c7_f5e3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1306_c7_f52b]
signal result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_return_output : unsigned(0 downto 0);

-- opc_ldr_phased[uxn_opcodes_phased_h_l1306_c39_84cd]
signal opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_phase : unsigned(3 downto 0);
signal opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_pc : unsigned(15 downto 0);
signal opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_sp : unsigned(7 downto 0);
signal opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_stack_index : unsigned(0 downto 0);
signal opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_ins : unsigned(7 downto 0);
signal opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_k : unsigned(7 downto 0);
signal opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1307_c11_bc83]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1308_c7_4334]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1307_c7_f5e3]
signal result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1308_c11_13d0]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1308_c1_bfa7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1309_c7_dad4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1308_c7_4334]
signal result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_return_output : unsigned(0 downto 0);

-- opc_str_phased[uxn_opcodes_phased_h_l1308_c39_e298]
signal opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_phase : unsigned(3 downto 0);
signal opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_pc : unsigned(15 downto 0);
signal opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_sp : unsigned(7 downto 0);
signal opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_stack_index : unsigned(0 downto 0);
signal opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_ins : unsigned(7 downto 0);
signal opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_k : unsigned(7 downto 0);
signal opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1309_c11_4a81]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1310_c7_92ef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1309_c7_dad4]
signal result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1310_c11_a822]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1310_c1_2877]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1311_c7_3f87]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1310_c7_92ef]
signal result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_return_output : unsigned(0 downto 0);

-- opc_lda_phased[uxn_opcodes_phased_h_l1310_c39_2377]
signal opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_phase : unsigned(3 downto 0);
signal opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_pc : unsigned(15 downto 0);
signal opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_sp : unsigned(7 downto 0);
signal opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_stack_index : unsigned(0 downto 0);
signal opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_ins : unsigned(7 downto 0);
signal opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_k : unsigned(7 downto 0);
signal opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1311_c11_4286]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1312_c7_4f0c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1311_c7_3f87]
signal result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1312_c11_6612]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1312_c1_192f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1313_c7_28db]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1312_c7_4f0c]
signal result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_return_output : unsigned(0 downto 0);

-- opc_sta_phased[uxn_opcodes_phased_h_l1312_c39_6698]
signal opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_phase : unsigned(3 downto 0);
signal opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_pc : unsigned(15 downto 0);
signal opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_sp : unsigned(7 downto 0);
signal opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_stack_index : unsigned(0 downto 0);
signal opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_ins : unsigned(7 downto 0);
signal opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_k : unsigned(7 downto 0);
signal opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1313_c11_dc84]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1314_c7_7ccd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1313_c7_28db]
signal result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1314_c11_93ef]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1314_c1_a288]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1315_c7_36a8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1314_c7_7ccd]
signal result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_return_output : unsigned(0 downto 0);

-- opc_dei_phased[uxn_opcodes_phased_h_l1314_c39_34e0]
signal opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_phase : unsigned(3 downto 0);
signal opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_pc : unsigned(15 downto 0);
signal opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_sp : unsigned(7 downto 0);
signal opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_stack_index : unsigned(0 downto 0);
signal opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_ins : unsigned(7 downto 0);
signal opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_k : unsigned(7 downto 0);
signal opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1315_c11_dd30]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1316_c7_8d55]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1315_c7_36a8]
signal result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1316_c11_cf77]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1316_c1_9d24]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1317_c7_db09]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1316_c7_8d55]
signal result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_return_output : unsigned(0 downto 0);

-- opc_deo_phased[uxn_opcodes_phased_h_l1316_c39_b348]
signal opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_phase : unsigned(3 downto 0);
signal opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_pc : unsigned(15 downto 0);
signal opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_sp : unsigned(7 downto 0);
signal opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_stack_index : unsigned(0 downto 0);
signal opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_ins : unsigned(7 downto 0);
signal opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_k : unsigned(7 downto 0);
signal opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1317_c11_9f0c]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1317_c1_7b96]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1318_c7_3351]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1317_c7_db09]
signal result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_return_output : unsigned(0 downto 0);

-- opc_deo2_phased[uxn_opcodes_phased_h_l1317_c39_cd07]
signal opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_phase : unsigned(3 downto 0);
signal opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_pc : unsigned(15 downto 0);
signal opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_sp : unsigned(7 downto 0);
signal opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_stack_index : unsigned(0 downto 0);
signal opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_ins : unsigned(7 downto 0);
signal opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_k : unsigned(7 downto 0);
signal opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1318_c11_0a4d]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1318_c1_b2af]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1319_c7_f6ed]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1318_c7_3351]
signal result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_return_output : unsigned(0 downto 0);

-- opc_add_phased[uxn_opcodes_phased_h_l1318_c39_b643]
signal opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_phase : unsigned(3 downto 0);
signal opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_pc : unsigned(15 downto 0);
signal opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_sp : unsigned(7 downto 0);
signal opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_stack_index : unsigned(0 downto 0);
signal opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_ins : unsigned(7 downto 0);
signal opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_k : unsigned(7 downto 0);
signal opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1319_c11_43ac]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1320_c7_1d82]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1319_c7_f6ed]
signal result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1320_c11_b233]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1320_c1_0b03]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1321_c7_4e6c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1320_c7_1d82]
signal result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_return_output : unsigned(0 downto 0);

-- opc_sub_phased[uxn_opcodes_phased_h_l1320_c39_b12b]
signal opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_phase : unsigned(3 downto 0);
signal opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_pc : unsigned(15 downto 0);
signal opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_sp : unsigned(7 downto 0);
signal opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_stack_index : unsigned(0 downto 0);
signal opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_ins : unsigned(7 downto 0);
signal opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_k : unsigned(7 downto 0);
signal opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1321_c11_9696]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1322_c7_d50c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1321_c7_4e6c]
signal result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1322_c11_d309]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1322_c1_ee7b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1323_c7_4f38]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1322_c7_d50c]
signal result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_return_output : unsigned(0 downto 0);

-- opc_mul_phased[uxn_opcodes_phased_h_l1322_c39_ecae]
signal opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_phase : unsigned(3 downto 0);
signal opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_pc : unsigned(15 downto 0);
signal opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_sp : unsigned(7 downto 0);
signal opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_stack_index : unsigned(0 downto 0);
signal opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_ins : unsigned(7 downto 0);
signal opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_k : unsigned(7 downto 0);
signal opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1323_c11_b421]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1324_c7_6a23]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1323_c7_4f38]
signal result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1324_c11_4e51]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1324_c1_df83]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1325_c7_6cbc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1324_c7_6a23]
signal result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_return_output : unsigned(0 downto 0);

-- opc_div_phased[uxn_opcodes_phased_h_l1324_c39_5168]
signal opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_phase : unsigned(3 downto 0);
signal opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_pc : unsigned(15 downto 0);
signal opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_sp : unsigned(7 downto 0);
signal opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_stack_index : unsigned(0 downto 0);
signal opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_ins : unsigned(7 downto 0);
signal opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_k : unsigned(7 downto 0);
signal opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1325_c11_1bb1]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1326_c7_ff09]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1325_c7_6cbc]
signal result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1326_c11_11e3]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1326_c1_80e2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1327_c7_d5eb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1326_c7_ff09]
signal result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_return_output : unsigned(0 downto 0);

-- opc_and_phased[uxn_opcodes_phased_h_l1326_c39_fc5d]
signal opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_phase : unsigned(3 downto 0);
signal opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_pc : unsigned(15 downto 0);
signal opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_sp : unsigned(7 downto 0);
signal opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_stack_index : unsigned(0 downto 0);
signal opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_ins : unsigned(7 downto 0);
signal opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_k : unsigned(7 downto 0);
signal opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1327_c11_534e]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1328_c7_d418]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1327_c7_d5eb]
signal result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1328_c11_12d6]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1328_c1_9aa1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1329_c7_89f6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1328_c7_d418]
signal result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_return_output : unsigned(0 downto 0);

-- opc_ora_phased[uxn_opcodes_phased_h_l1328_c39_3172]
signal opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_phase : unsigned(3 downto 0);
signal opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_pc : unsigned(15 downto 0);
signal opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_sp : unsigned(7 downto 0);
signal opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_stack_index : unsigned(0 downto 0);
signal opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_ins : unsigned(7 downto 0);
signal opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_k : unsigned(7 downto 0);
signal opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1329_c11_2e24]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1330_c7_68c6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1329_c7_89f6]
signal result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1330_c11_18d9]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1330_c1_ab76]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1331_c7_be16]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1330_c7_68c6]
signal result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_return_output : unsigned(0 downto 0);

-- opc_eor_phased[uxn_opcodes_phased_h_l1330_c39_aabb]
signal opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_phase : unsigned(3 downto 0);
signal opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_pc : unsigned(15 downto 0);
signal opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_sp : unsigned(7 downto 0);
signal opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_stack_index : unsigned(0 downto 0);
signal opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_ins : unsigned(7 downto 0);
signal opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_k : unsigned(7 downto 0);
signal opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1331_c11_d4ca]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1332_c7_d8be]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1331_c7_be16]
signal result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1332_c11_711b]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1332_c1_37b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1332_c7_d8be]
signal result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_return_output : unsigned(0 downto 0);

-- opc_sft_phased[uxn_opcodes_phased_h_l1332_c39_d69e]
signal opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_phase : unsigned(3 downto 0);
signal opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_pc : unsigned(15 downto 0);
signal opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_sp : unsigned(7 downto 0);
signal opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_stack_index : unsigned(0 downto 0);
signal opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_ins : unsigned(7 downto 0);
signal opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_k : unsigned(7 downto 0);
signal opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l1333_c11_66b0]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l1333_c7_b63b]
signal result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306
BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd
result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_cond,
result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_iftrue,
result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_iffalse,
result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_return_output);

-- opc_brk_phased_uxn_opcodes_phased_h_l1264_c34_74e2
opc_brk_phased_uxn_opcodes_phased_h_l1264_c34_74e2 : entity work.opc_brk_phased_0CLK_de264c78 port map (
opc_brk_phased_uxn_opcodes_phased_h_l1264_c34_74e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600
BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7
result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_cond,
result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iftrue,
result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iffalse,
result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_return_output);

-- opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61
opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61 : entity work.opc_jci_phased_0CLK_5bb3301d port map (
clk,
opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_CLOCK_ENABLE,
opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_phase,
opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_pc,
opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_sp,
opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_stack_index,
opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090
BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1266_c7_589c
result_MUX_uxn_opcodes_phased_h_l1266_c7_589c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_cond,
result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iftrue,
result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iffalse,
result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_return_output);

-- opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c
opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c : entity work.opc_jmi_phased_0CLK_838cdab1 port map (
clk,
opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_CLOCK_ENABLE,
opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_phase,
opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_pc,
opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_sp,
opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65
BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1
result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_cond,
result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iftrue,
result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iffalse,
result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_return_output);

-- opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c
opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c : entity work.opc_jsi_phased_0CLK_a31e336a port map (
clk,
opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_CLOCK_ENABLE,
opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_phase,
opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_pc,
opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_sp,
opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_stack_index,
opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_ins,
opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab
BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1268_c7_523a
result_MUX_uxn_opcodes_phased_h_l1268_c7_523a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_cond,
result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iftrue,
result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iffalse,
result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_return_output);

-- opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd
opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd : entity work.opc_lit_phased_0CLK_c1aada14 port map (
clk,
opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_CLOCK_ENABLE,
opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_phase,
opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_pc,
opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_sp,
opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_stack_index,
opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_ins,
opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c
BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97
result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_cond,
result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iftrue,
result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iffalse,
result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_return_output);

-- opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e
opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e : entity work.opc_lit2_phased_0CLK_d1b6638a port map (
clk,
opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_CLOCK_ENABLE,
opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_phase,
opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_pc,
opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_sp,
opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_stack_index,
opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_ins,
opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b
BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71
result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_cond,
result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iftrue,
result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iffalse,
result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_return_output);

-- opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce
opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce : entity work.opc_lit_phased_0CLK_c1aada14 port map (
clk,
opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_CLOCK_ENABLE,
opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_phase,
opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_pc,
opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_sp,
opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_stack_index,
opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_ins,
opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28
BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23
result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_cond,
result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iftrue,
result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iffalse,
result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_return_output);

-- opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924
opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924 : entity work.opc_lit2_phased_0CLK_d1b6638a port map (
clk,
opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_CLOCK_ENABLE,
opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_phase,
opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_pc,
opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_sp,
opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_stack_index,
opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_ins,
opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27
BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82
result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_cond,
result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iftrue,
result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iffalse,
result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_return_output);

-- opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607
opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607 : entity work.opc_inc_phased_0CLK_b2c89097 port map (
clk,
opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_CLOCK_ENABLE,
opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_phase,
opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_pc,
opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_sp,
opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_stack_index,
opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_ins,
opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_k,
opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d
BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4
result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_cond,
result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iftrue,
result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iffalse,
result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef
BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60
result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_cond,
result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iftrue,
result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iffalse,
result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_return_output);

-- opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660
opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660 : entity work.opc_pop_phased_0CLK_ba40181c port map (
clk,
opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_CLOCK_ENABLE,
opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_phase,
opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_pc,
opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_sp,
opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_stack_index,
opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_ins,
opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_k,
opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716
BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a
result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_cond,
result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iftrue,
result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iffalse,
result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_return_output);

-- opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50
opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50 : entity work.opc_pop2_phased_0CLK_ba40181c port map (
clk,
opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_CLOCK_ENABLE,
opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_phase,
opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_pc,
opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_sp,
opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_stack_index,
opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_ins,
opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_k,
opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c
BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5
result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_cond,
result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iftrue,
result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iffalse,
result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_return_output);

-- opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8
opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8 : entity work.opc_nip_phased_0CLK_17501611 port map (
clk,
opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_CLOCK_ENABLE,
opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_phase,
opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_pc,
opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_sp,
opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_stack_index,
opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_ins,
opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_k,
opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f
BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1277_c7_0431
result_MUX_uxn_opcodes_phased_h_l1277_c7_0431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_cond,
result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iftrue,
result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iffalse,
result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60
BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1278_c7_5918
result_MUX_uxn_opcodes_phased_h_l1278_c7_5918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_cond,
result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iftrue,
result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iffalse,
result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_return_output);

-- opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8
opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8 : entity work.opc_swp_phased_0CLK_8e24d567 port map (
clk,
opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_CLOCK_ENABLE,
opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_phase,
opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_pc,
opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_sp,
opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_stack_index,
opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_ins,
opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_k,
opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831
BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1279_c7_9544
result_MUX_uxn_opcodes_phased_h_l1279_c7_9544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_cond,
result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iftrue,
result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iffalse,
result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d
BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1280_c7_f489
result_MUX_uxn_opcodes_phased_h_l1280_c7_f489 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_cond,
result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iftrue,
result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iffalse,
result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_return_output);

-- opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce
opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce : entity work.opc_rot_phased_0CLK_ba4ef5fd port map (
clk,
opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_CLOCK_ENABLE,
opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_phase,
opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_pc,
opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_sp,
opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_stack_index,
opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_ins,
opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_k,
opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c
BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5
result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_cond,
result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iftrue,
result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iffalse,
result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d
BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1282_c7_5960
result_MUX_uxn_opcodes_phased_h_l1282_c7_5960 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_cond,
result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iftrue,
result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iffalse,
result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_return_output);

-- opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741
opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741 : entity work.opc_dup_phased_0CLK_09f3874f port map (
clk,
opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_CLOCK_ENABLE,
opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_phase,
opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_pc,
opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_sp,
opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_stack_index,
opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_ins,
opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_k,
opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579
BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85
result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_cond,
result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iftrue,
result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iffalse,
result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68
BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1284_c7_2929
result_MUX_uxn_opcodes_phased_h_l1284_c7_2929 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_cond,
result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iftrue,
result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iffalse,
result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_return_output);

-- opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7
opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7 : entity work.opc_ovr_phased_0CLK_60e6c3c2 port map (
clk,
opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_CLOCK_ENABLE,
opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_phase,
opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_pc,
opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_sp,
opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_stack_index,
opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_ins,
opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_k,
opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe
BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a
result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_cond,
result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iftrue,
result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iffalse,
result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_return_output);

-- opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121
opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121 : entity work.opc_ovr2_phased_0CLK_68fb2dbd port map (
clk,
opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_CLOCK_ENABLE,
opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_phase,
opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_pc,
opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_sp,
opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_stack_index,
opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_ins,
opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_k,
opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1
BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be
result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_cond,
result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iftrue,
result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iffalse,
result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_return_output);

-- opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049
opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049 : entity work.opc_equ_phased_0CLK_2ca51e56 port map (
clk,
opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_CLOCK_ENABLE,
opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_phase,
opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_pc,
opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_sp,
opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_stack_index,
opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_ins,
opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_k,
opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52
BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1287_c7_8005
result_MUX_uxn_opcodes_phased_h_l1287_c7_8005 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_cond,
result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iftrue,
result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iffalse,
result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850
BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0
result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_cond,
result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iftrue,
result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iffalse,
result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_return_output);

-- opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed
opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed : entity work.opc_neq_phased_0CLK_2ca51e56 port map (
clk,
opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_CLOCK_ENABLE,
opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_phase,
opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_pc,
opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_sp,
opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_stack_index,
opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_ins,
opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_k,
opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455
BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1289_c7_23df
result_MUX_uxn_opcodes_phased_h_l1289_c7_23df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_cond,
result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iftrue,
result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iffalse,
result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5
BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1290_c7_f597
result_MUX_uxn_opcodes_phased_h_l1290_c7_f597 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_cond,
result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iftrue,
result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iffalse,
result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_return_output);

-- opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713
opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713 : entity work.opc_gth_phased_0CLK_2ca51e56 port map (
clk,
opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_CLOCK_ENABLE,
opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_phase,
opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_pc,
opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_sp,
opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_stack_index,
opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_ins,
opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_k,
opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2
BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1291_c7_a527
result_MUX_uxn_opcodes_phased_h_l1291_c7_a527 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_cond,
result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iftrue,
result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iffalse,
result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7
BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1292_c7_48df
result_MUX_uxn_opcodes_phased_h_l1292_c7_48df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_cond,
result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iftrue,
result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iffalse,
result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_return_output);

-- opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73
opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73 : entity work.opc_lth_phased_0CLK_2ca51e56 port map (
clk,
opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_CLOCK_ENABLE,
opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_phase,
opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_pc,
opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_sp,
opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_stack_index,
opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_ins,
opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_k,
opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125
BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef
result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_cond,
result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iftrue,
result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iffalse,
result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713
BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4
result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_cond,
result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iftrue,
result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iffalse,
result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_return_output);

-- opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e
opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e : entity work.opc_jmp_phased_0CLK_07ecd3b2 port map (
clk,
opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_CLOCK_ENABLE,
opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_phase,
opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_pc,
opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_sp,
opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_stack_index,
opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_ins,
opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_k,
opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2
BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c
result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_cond,
result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iftrue,
result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iffalse,
result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_return_output);

-- opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d
opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d : entity work.opc_jmp2_phased_0CLK_cb37b181 port map (
clk,
opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_CLOCK_ENABLE,
opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_phase,
opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_pc,
opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_sp,
opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_stack_index,
opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_ins,
opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_k,
opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d
BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a
result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_cond,
result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iftrue,
result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iffalse,
result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_return_output);

-- opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47
opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47 : entity work.opc_jcn_phased_0CLK_0e8d032f port map (
clk,
opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_CLOCK_ENABLE,
opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_phase,
opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_pc,
opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_sp,
opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_stack_index,
opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_ins,
opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_k,
opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a
BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1297_c7_919a
result_MUX_uxn_opcodes_phased_h_l1297_c7_919a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_cond,
result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iftrue,
result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iffalse,
result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32
BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1298_c7_0922
result_MUX_uxn_opcodes_phased_h_l1298_c7_0922 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_cond,
result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iftrue,
result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iffalse,
result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_return_output);

-- opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f
opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f : entity work.opc_jsr_phased_0CLK_5b89a8d8 port map (
clk,
opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_CLOCK_ENABLE,
opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_phase,
opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_pc,
opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_sp,
opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_stack_index,
opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_ins,
opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_k,
opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c
BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b
result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_cond,
result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iftrue,
result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iffalse,
result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197
BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1
result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_cond,
result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iftrue,
result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iffalse,
result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_return_output);

-- opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129
opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129 : entity work.opc_sth_phased_0CLK_a61d1057 port map (
clk,
opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_CLOCK_ENABLE,
opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_phase,
opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_pc,
opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_sp,
opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_stack_index,
opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_ins,
opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_k,
opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe
BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f
result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_cond,
result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iftrue,
result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iffalse,
result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5
BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df
result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_cond,
result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iftrue,
result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iffalse,
result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_return_output);

-- opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680
opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680 : entity work.opc_ldz_phased_0CLK_018be414 port map (
clk,
opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_CLOCK_ENABLE,
opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_phase,
opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_pc,
opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_sp,
opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_stack_index,
opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_ins,
opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_k,
opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5
BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e
result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_cond,
result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iftrue,
result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iffalse,
result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e
BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7
result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_cond,
result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iftrue,
result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iffalse,
result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_return_output);

-- opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7
opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7 : entity work.opc_stz_phased_0CLK_0db28f7c port map (
clk,
opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_CLOCK_ENABLE,
opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_phase,
opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_pc,
opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_sp,
opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_stack_index,
opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_ins,
opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_k,
opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98
BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1305_c7_237c
result_MUX_uxn_opcodes_phased_h_l1305_c7_237c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_cond,
result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iftrue,
result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iffalse,
result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6
BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b
result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_cond,
result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iftrue,
result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iffalse,
result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_return_output);

-- opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd
opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd : entity work.opc_ldr_phased_0CLK_0753a953 port map (
clk,
opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_CLOCK_ENABLE,
opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_phase,
opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_pc,
opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_sp,
opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_stack_index,
opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_ins,
opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_k,
opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83
BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3
result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_cond,
result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iftrue,
result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iffalse,
result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0
BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1308_c7_4334
result_MUX_uxn_opcodes_phased_h_l1308_c7_4334 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_cond,
result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iftrue,
result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iffalse,
result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_return_output);

-- opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298
opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298 : entity work.opc_str_phased_0CLK_3487a4d6 port map (
clk,
opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_CLOCK_ENABLE,
opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_phase,
opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_pc,
opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_sp,
opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_stack_index,
opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_ins,
opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_k,
opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81
BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4
result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_cond,
result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iftrue,
result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iffalse,
result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822
BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef
result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_cond,
result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iftrue,
result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iffalse,
result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_return_output);

-- opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377
opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377 : entity work.opc_lda_phased_0CLK_24011c3b port map (
clk,
opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_CLOCK_ENABLE,
opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_phase,
opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_pc,
opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_sp,
opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_stack_index,
opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_ins,
opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_k,
opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286
BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87
result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_cond,
result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iftrue,
result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iffalse,
result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612
BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c
result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_cond,
result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iftrue,
result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iffalse,
result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_return_output);

-- opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698
opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698 : entity work.opc_sta_phased_0CLK_315c45c0 port map (
clk,
opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_CLOCK_ENABLE,
opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_phase,
opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_pc,
opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_sp,
opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_stack_index,
opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_ins,
opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_k,
opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84
BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1313_c7_28db
result_MUX_uxn_opcodes_phased_h_l1313_c7_28db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_cond,
result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iftrue,
result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iffalse,
result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef
BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd
result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_cond,
result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iftrue,
result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iffalse,
result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_return_output);

-- opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0
opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0 : entity work.opc_dei_phased_0CLK_5d175a30 port map (
clk,
opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_CLOCK_ENABLE,
opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_phase,
opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_pc,
opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_sp,
opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_stack_index,
opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_ins,
opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_k,
opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30
BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8
result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_cond,
result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iftrue,
result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iffalse,
result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77
BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55
result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_cond,
result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iftrue,
result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iffalse,
result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_return_output);

-- opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348
opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348 : entity work.opc_deo_phased_0CLK_1b2abcad port map (
clk,
opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_CLOCK_ENABLE,
opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_phase,
opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_pc,
opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_sp,
opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_stack_index,
opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_ins,
opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_k,
opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c
BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1317_c7_db09
result_MUX_uxn_opcodes_phased_h_l1317_c7_db09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_cond,
result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iftrue,
result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iffalse,
result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_return_output);

-- opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07
opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07 : entity work.opc_deo2_phased_0CLK_7d32d1ce port map (
clk,
opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_CLOCK_ENABLE,
opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_phase,
opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_pc,
opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_sp,
opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_stack_index,
opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_ins,
opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_k,
opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d
BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1318_c7_3351
result_MUX_uxn_opcodes_phased_h_l1318_c7_3351 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_cond,
result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iftrue,
result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iffalse,
result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_return_output);

-- opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643
opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643 : entity work.opc_add_phased_0CLK_c3dfc98c port map (
clk,
opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_CLOCK_ENABLE,
opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_phase,
opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_pc,
opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_sp,
opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_stack_index,
opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_ins,
opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_k,
opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac
BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed
result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_cond,
result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iftrue,
result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iffalse,
result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233
BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82
result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_cond,
result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iftrue,
result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iffalse,
result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_return_output);

-- opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b
opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b : entity work.opc_sub_phased_0CLK_c3dfc98c port map (
clk,
opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_CLOCK_ENABLE,
opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_phase,
opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_pc,
opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_sp,
opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_stack_index,
opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_ins,
opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_k,
opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696
BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c
result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_cond,
result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iftrue,
result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iffalse,
result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309
BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c
result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_cond,
result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iftrue,
result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iffalse,
result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_return_output);

-- opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae
opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae : entity work.opc_mul_phased_0CLK_c3dfc98c port map (
clk,
opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_CLOCK_ENABLE,
opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_phase,
opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_pc,
opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_sp,
opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_stack_index,
opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_ins,
opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_k,
opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421
BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38
result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_cond,
result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iftrue,
result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iffalse,
result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51
BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23
result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_cond,
result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iftrue,
result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iffalse,
result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_return_output);

-- opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168
opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168 : entity work.opc_div_phased_0CLK_64632f92 port map (
clk,
opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_CLOCK_ENABLE,
opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_phase,
opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_pc,
opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_sp,
opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_stack_index,
opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_ins,
opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_k,
opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1
BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc
result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_cond,
result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iftrue,
result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iffalse,
result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3
BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09
result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_cond,
result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iftrue,
result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iffalse,
result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_return_output);

-- opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d
opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d : entity work.opc_and_phased_0CLK_c3dfc98c port map (
clk,
opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_CLOCK_ENABLE,
opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_phase,
opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_pc,
opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_sp,
opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_stack_index,
opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_ins,
opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_k,
opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e
BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb
result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_cond,
result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iftrue,
result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iffalse,
result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6
BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1328_c7_d418
result_MUX_uxn_opcodes_phased_h_l1328_c7_d418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_cond,
result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iftrue,
result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iffalse,
result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_return_output);

-- opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172
opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172 : entity work.opc_ora_phased_0CLK_c3dfc98c port map (
clk,
opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_CLOCK_ENABLE,
opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_phase,
opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_pc,
opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_sp,
opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_stack_index,
opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_ins,
opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_k,
opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24
BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6
result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_cond,
result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iftrue,
result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iffalse,
result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9
BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6
result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_cond,
result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iftrue,
result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iffalse,
result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_return_output);

-- opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb
opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb : entity work.opc_eor_phased_0CLK_c3dfc98c port map (
clk,
opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_CLOCK_ENABLE,
opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_phase,
opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_pc,
opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_sp,
opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_stack_index,
opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_ins,
opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_k,
opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca
BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1331_c7_be16
result_MUX_uxn_opcodes_phased_h_l1331_c7_be16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_cond,
result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iftrue,
result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iffalse,
result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b
BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be
result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_cond,
result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iftrue,
result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iffalse,
result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_return_output);

-- opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e
opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e : entity work.opc_sft_phased_0CLK_6539e591 port map (
clk,
opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_CLOCK_ENABLE,
opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_phase,
opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_pc,
opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_sp,
opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_stack_index,
opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_ins,
opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_k,
opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0
BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_return_output);

-- result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b
result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_cond,
result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_iftrue,
result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_iffalse,
result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 sp,
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
 BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_return_output,
 result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_return_output,
 opc_brk_phased_uxn_opcodes_phased_h_l1264_c34_74e2_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_return_output,
 result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_return_output,
 opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_return_output,
 result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_return_output,
 opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_return_output,
 result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_return_output,
 opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_return_output,
 result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_return_output,
 opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_return_output,
 result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_return_output,
 opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_return_output,
 result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_return_output,
 opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_return_output,
 result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_return_output,
 opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_return_output,
 result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_return_output,
 opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_return_output,
 result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_return_output,
 result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_return_output,
 opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_return_output,
 result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_return_output,
 opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_return_output,
 result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_return_output,
 opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_return_output,
 result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_return_output,
 result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_return_output,
 opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_return_output,
 result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_return_output,
 result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_return_output,
 opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_return_output,
 result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_return_output,
 result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_return_output,
 opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_return_output,
 result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_return_output,
 result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_return_output,
 opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_return_output,
 result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_return_output,
 opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_return_output,
 result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_return_output,
 opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_return_output,
 result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_return_output,
 result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_return_output,
 opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_return_output,
 result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_return_output,
 result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_return_output,
 opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_return_output,
 result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_return_output,
 result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_return_output,
 opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_return_output,
 result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_return_output,
 result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_return_output,
 opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_return_output,
 result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_return_output,
 opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_return_output,
 result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_return_output,
 opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_return_output,
 result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_return_output,
 result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_return_output,
 opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_return_output,
 result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_return_output,
 result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_return_output,
 opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_return_output,
 result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_return_output,
 result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_return_output,
 opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_return_output,
 result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_return_output,
 result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_return_output,
 opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_return_output,
 result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_return_output,
 result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_return_output,
 opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_return_output,
 result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_return_output,
 result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_return_output,
 opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_return_output,
 result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_return_output,
 result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_return_output,
 opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_return_output,
 result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_return_output,
 result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_return_output,
 opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_return_output,
 result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_return_output,
 result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_return_output,
 opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_return_output,
 result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_return_output,
 result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_return_output,
 opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_return_output,
 result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_return_output,
 opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_return_output,
 result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_return_output,
 opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_return_output,
 result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_return_output,
 result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_return_output,
 opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_return_output,
 result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_return_output,
 result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_return_output,
 opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_return_output,
 result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_return_output,
 result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_return_output,
 opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_return_output,
 result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_return_output,
 result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_return_output,
 opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_return_output,
 result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_return_output,
 result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_return_output,
 opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_return_output,
 result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_return_output,
 result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_return_output,
 opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_return_output,
 result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_return_output,
 result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_return_output,
 opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_return_output,
 result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_phase : unsigned(3 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_opcode : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_cond : unsigned(0 downto 0);
 variable VAR_opc_brk_phased_uxn_opcodes_phased_h_l1264_c34_74e2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_cond : unsigned(0 downto 0);
 variable VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_phase : unsigned(3 downto 0);
 variable VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_pc : unsigned(15 downto 0);
 variable VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_sp : unsigned(7 downto 0);
 variable VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_cond : unsigned(0 downto 0);
 variable VAR_opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_phase : unsigned(3 downto 0);
 variable VAR_opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_pc : unsigned(15 downto 0);
 variable VAR_opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_sp : unsigned(7 downto 0);
 variable VAR_opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_cond : unsigned(0 downto 0);
 variable VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_phase : unsigned(3 downto 0);
 variable VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_pc : unsigned(15 downto 0);
 variable VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_sp : unsigned(7 downto 0);
 variable VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_ins : unsigned(7 downto 0);
 variable VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_cond : unsigned(0 downto 0);
 variable VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_phase : unsigned(3 downto 0);
 variable VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_pc : unsigned(15 downto 0);
 variable VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_sp : unsigned(7 downto 0);
 variable VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_ins : unsigned(7 downto 0);
 variable VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_phase : unsigned(3 downto 0);
 variable VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_pc : unsigned(15 downto 0);
 variable VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_sp : unsigned(7 downto 0);
 variable VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_cond : unsigned(0 downto 0);
 variable VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_phase : unsigned(3 downto 0);
 variable VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_pc : unsigned(15 downto 0);
 variable VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_sp : unsigned(7 downto 0);
 variable VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_ins : unsigned(7 downto 0);
 variable VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_phase : unsigned(3 downto 0);
 variable VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_pc : unsigned(15 downto 0);
 variable VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_sp : unsigned(7 downto 0);
 variable VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_cond : unsigned(0 downto 0);
 variable VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_phase : unsigned(3 downto 0);
 variable VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_pc : unsigned(15 downto 0);
 variable VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_sp : unsigned(7 downto 0);
 variable VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_ins : unsigned(7 downto 0);
 variable VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_k : unsigned(7 downto 0);
 variable VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_cond : unsigned(0 downto 0);
 variable VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_phase : unsigned(3 downto 0);
 variable VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_pc : unsigned(15 downto 0);
 variable VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_sp : unsigned(7 downto 0);
 variable VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_ins : unsigned(7 downto 0);
 variable VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_k : unsigned(7 downto 0);
 variable VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_cond : unsigned(0 downto 0);
 variable VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_phase : unsigned(3 downto 0);
 variable VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_pc : unsigned(15 downto 0);
 variable VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_sp : unsigned(7 downto 0);
 variable VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_ins : unsigned(7 downto 0);
 variable VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_k : unsigned(7 downto 0);
 variable VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_cond : unsigned(0 downto 0);
 variable VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_phase : unsigned(3 downto 0);
 variable VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_pc : unsigned(15 downto 0);
 variable VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_sp : unsigned(7 downto 0);
 variable VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_ins : unsigned(7 downto 0);
 variable VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_k : unsigned(7 downto 0);
 variable VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_cond : unsigned(0 downto 0);
 variable VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_phase : unsigned(3 downto 0);
 variable VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_pc : unsigned(15 downto 0);
 variable VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_sp : unsigned(7 downto 0);
 variable VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_ins : unsigned(7 downto 0);
 variable VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_k : unsigned(7 downto 0);
 variable VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_cond : unsigned(0 downto 0);
 variable VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_phase : unsigned(3 downto 0);
 variable VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_pc : unsigned(15 downto 0);
 variable VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_sp : unsigned(7 downto 0);
 variable VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_ins : unsigned(7 downto 0);
 variable VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_k : unsigned(7 downto 0);
 variable VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_cond : unsigned(0 downto 0);
 variable VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_phase : unsigned(3 downto 0);
 variable VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_pc : unsigned(15 downto 0);
 variable VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_sp : unsigned(7 downto 0);
 variable VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_ins : unsigned(7 downto 0);
 variable VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_k : unsigned(7 downto 0);
 variable VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_phase : unsigned(3 downto 0);
 variable VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_pc : unsigned(15 downto 0);
 variable VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_sp : unsigned(7 downto 0);
 variable VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_k : unsigned(7 downto 0);
 variable VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_phase : unsigned(3 downto 0);
 variable VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_pc : unsigned(15 downto 0);
 variable VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_sp : unsigned(7 downto 0);
 variable VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_k : unsigned(7 downto 0);
 variable VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_cond : unsigned(0 downto 0);
 variable VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_phase : unsigned(3 downto 0);
 variable VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_pc : unsigned(15 downto 0);
 variable VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_sp : unsigned(7 downto 0);
 variable VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_ins : unsigned(7 downto 0);
 variable VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_k : unsigned(7 downto 0);
 variable VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_cond : unsigned(0 downto 0);
 variable VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_phase : unsigned(3 downto 0);
 variable VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_pc : unsigned(15 downto 0);
 variable VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_sp : unsigned(7 downto 0);
 variable VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_ins : unsigned(7 downto 0);
 variable VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_k : unsigned(7 downto 0);
 variable VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_cond : unsigned(0 downto 0);
 variable VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_phase : unsigned(3 downto 0);
 variable VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_pc : unsigned(15 downto 0);
 variable VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_sp : unsigned(7 downto 0);
 variable VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_ins : unsigned(7 downto 0);
 variable VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_k : unsigned(7 downto 0);
 variable VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_cond : unsigned(0 downto 0);
 variable VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_phase : unsigned(3 downto 0);
 variable VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_pc : unsigned(15 downto 0);
 variable VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_sp : unsigned(7 downto 0);
 variable VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_ins : unsigned(7 downto 0);
 variable VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_k : unsigned(7 downto 0);
 variable VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_phase : unsigned(3 downto 0);
 variable VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_pc : unsigned(15 downto 0);
 variable VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_sp : unsigned(7 downto 0);
 variable VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_k : unsigned(7 downto 0);
 variable VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_phase : unsigned(3 downto 0);
 variable VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_pc : unsigned(15 downto 0);
 variable VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_sp : unsigned(7 downto 0);
 variable VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_k : unsigned(7 downto 0);
 variable VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_phase : unsigned(3 downto 0);
 variable VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_pc : unsigned(15 downto 0);
 variable VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_sp : unsigned(7 downto 0);
 variable VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_k : unsigned(7 downto 0);
 variable VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_phase : unsigned(3 downto 0);
 variable VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_pc : unsigned(15 downto 0);
 variable VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_sp : unsigned(7 downto 0);
 variable VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_k : unsigned(7 downto 0);
 variable VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_cond : unsigned(0 downto 0);
 variable VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_phase : unsigned(3 downto 0);
 variable VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_pc : unsigned(15 downto 0);
 variable VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_sp : unsigned(7 downto 0);
 variable VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_ins : unsigned(7 downto 0);
 variable VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_k : unsigned(7 downto 0);
 variable VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_phase : unsigned(3 downto 0);
 variable VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_pc : unsigned(15 downto 0);
 variable VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_sp : unsigned(7 downto 0);
 variable VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_k : unsigned(7 downto 0);
 variable VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_cond : unsigned(0 downto 0);
 variable VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_phase : unsigned(3 downto 0);
 variable VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_pc : unsigned(15 downto 0);
 variable VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_sp : unsigned(7 downto 0);
 variable VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_ins : unsigned(7 downto 0);
 variable VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_k : unsigned(7 downto 0);
 variable VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_phase : unsigned(3 downto 0);
 variable VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_pc : unsigned(15 downto 0);
 variable VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_sp : unsigned(7 downto 0);
 variable VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_k : unsigned(7 downto 0);
 variable VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_cond : unsigned(0 downto 0);
 variable VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_phase : unsigned(3 downto 0);
 variable VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_pc : unsigned(15 downto 0);
 variable VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_sp : unsigned(7 downto 0);
 variable VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_ins : unsigned(7 downto 0);
 variable VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_k : unsigned(7 downto 0);
 variable VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_cond : unsigned(0 downto 0);
 variable VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_phase : unsigned(3 downto 0);
 variable VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_pc : unsigned(15 downto 0);
 variable VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_sp : unsigned(7 downto 0);
 variable VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_ins : unsigned(7 downto 0);
 variable VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_k : unsigned(7 downto 0);
 variable VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_cond : unsigned(0 downto 0);
 variable VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_phase : unsigned(3 downto 0);
 variable VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_pc : unsigned(15 downto 0);
 variable VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_sp : unsigned(7 downto 0);
 variable VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_ins : unsigned(7 downto 0);
 variable VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_k : unsigned(7 downto 0);
 variable VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_cond : unsigned(0 downto 0);
 variable VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_phase : unsigned(3 downto 0);
 variable VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_pc : unsigned(15 downto 0);
 variable VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_sp : unsigned(7 downto 0);
 variable VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_ins : unsigned(7 downto 0);
 variable VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_k : unsigned(7 downto 0);
 variable VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_cond : unsigned(0 downto 0);
 variable VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_phase : unsigned(3 downto 0);
 variable VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_pc : unsigned(15 downto 0);
 variable VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_sp : unsigned(7 downto 0);
 variable VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_ins : unsigned(7 downto 0);
 variable VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_k : unsigned(7 downto 0);
 variable VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_cond : unsigned(0 downto 0);
 variable VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_phase : unsigned(3 downto 0);
 variable VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_pc : unsigned(15 downto 0);
 variable VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_sp : unsigned(7 downto 0);
 variable VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_ins : unsigned(7 downto 0);
 variable VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_k : unsigned(7 downto 0);
 variable VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_cond : unsigned(0 downto 0);
 variable VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_phase : unsigned(3 downto 0);
 variable VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_pc : unsigned(15 downto 0);
 variable VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_sp : unsigned(7 downto 0);
 variable VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_ins : unsigned(7 downto 0);
 variable VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_k : unsigned(7 downto 0);
 variable VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_cond : unsigned(0 downto 0);
 variable VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_phase : unsigned(3 downto 0);
 variable VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_pc : unsigned(15 downto 0);
 variable VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_sp : unsigned(7 downto 0);
 variable VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_ins : unsigned(7 downto 0);
 variable VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_k : unsigned(7 downto 0);
 variable VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_cond : unsigned(0 downto 0);
 variable VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_phase : unsigned(3 downto 0);
 variable VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_pc : unsigned(15 downto 0);
 variable VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_sp : unsigned(7 downto 0);
 variable VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_ins : unsigned(7 downto 0);
 variable VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_k : unsigned(7 downto 0);
 variable VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_cond : unsigned(0 downto 0);
 variable VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_phase : unsigned(3 downto 0);
 variable VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_pc : unsigned(15 downto 0);
 variable VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_sp : unsigned(7 downto 0);
 variable VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_ins : unsigned(7 downto 0);
 variable VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_k : unsigned(7 downto 0);
 variable VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_cond : unsigned(0 downto 0);
 variable VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_phase : unsigned(3 downto 0);
 variable VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_pc : unsigned(15 downto 0);
 variable VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_sp : unsigned(7 downto 0);
 variable VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_ins : unsigned(7 downto 0);
 variable VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_k : unsigned(7 downto 0);
 variable VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_cond : unsigned(0 downto 0);
 variable VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_phase : unsigned(3 downto 0);
 variable VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_pc : unsigned(15 downto 0);
 variable VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_sp : unsigned(7 downto 0);
 variable VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_ins : unsigned(7 downto 0);
 variable VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_k : unsigned(7 downto 0);
 variable VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_cond : unsigned(0 downto 0);
 variable VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_phase : unsigned(3 downto 0);
 variable VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_pc : unsigned(15 downto 0);
 variable VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_sp : unsigned(7 downto 0);
 variable VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_ins : unsigned(7 downto 0);
 variable VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_k : unsigned(7 downto 0);
 variable VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_cond : unsigned(0 downto 0);
 variable VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_phase : unsigned(3 downto 0);
 variable VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_pc : unsigned(15 downto 0);
 variable VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_sp : unsigned(7 downto 0);
 variable VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_ins : unsigned(7 downto 0);
 variable VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_k : unsigned(7 downto 0);
 variable VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_cond : unsigned(0 downto 0);
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
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_right := to_unsigned(26, 5);
     VAR_result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_right := to_unsigned(10, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_right := to_unsigned(33, 6);
     VAR_result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_right := to_unsigned(62, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_right := to_unsigned(27, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_right := to_unsigned(36, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_right := to_unsigned(61, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_right := to_unsigned(46, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_right := to_unsigned(59, 6);
     VAR_result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_right := to_unsigned(55, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_right := to_unsigned(45, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_right := to_unsigned(42, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_right := to_unsigned(252, 8);
     VAR_result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_right := to_unsigned(255, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_right := to_unsigned(44, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_right := to_unsigned(60, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_right := to_unsigned(57, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_right := to_unsigned(56, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_right := to_unsigned(48, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_right := to_unsigned(17, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_right := to_unsigned(249, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_right := to_unsigned(40, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_right := to_unsigned(63, 6);
     VAR_result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_right := to_unsigned(12, 4);
     VAR_result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_right := to_unsigned(7, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_right := to_unsigned(24, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_right := to_unsigned(3, 2);
     VAR_result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_right := to_unsigned(15, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_right := to_unsigned(19, 5);
     VAR_result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_right := to_unsigned(21, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_right := to_unsigned(254, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_right := to_unsigned(49, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_right := to_unsigned(253, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_right := to_unsigned(22, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_right := to_unsigned(47, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_right := to_unsigned(39, 6);
     VAR_result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_right := to_unsigned(50, 6);
     VAR_result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_right := to_unsigned(23, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_right := to_unsigned(37, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_right := to_unsigned(20, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_right := to_unsigned(28, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_right := to_unsigned(251, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_right := to_unsigned(43, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_right := to_unsigned(30, 5);
     VAR_result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_right := to_unsigned(54, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_right := to_unsigned(51, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_right := to_unsigned(41, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_right := to_unsigned(53, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_right := to_unsigned(52, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_right := to_unsigned(38, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_right := to_unsigned(250, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_right := to_unsigned(35, 6);
     VAR_result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_right := to_unsigned(29, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_right := to_unsigned(11, 4);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_sp := sp;
     VAR_stack_index := stack_index;
     VAR_opcode := opcode;
     VAR_ins := ins;
     VAR_k := k;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iffalse := VAR_CLOCK_ENABLE;
     VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_ins := VAR_ins;
     VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_ins := VAR_ins;
     VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_ins := VAR_ins;
     VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_ins := VAR_ins;
     VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_ins := VAR_ins;
     VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_ins := VAR_ins;
     VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_ins := VAR_ins;
     VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_ins := VAR_ins;
     VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_ins := VAR_ins;
     VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_ins := VAR_ins;
     VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_ins := VAR_ins;
     VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_ins := VAR_ins;
     VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_ins := VAR_ins;
     VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_ins := VAR_ins;
     VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_ins := VAR_ins;
     VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_ins := VAR_ins;
     VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_ins := VAR_ins;
     VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_ins := VAR_ins;
     VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_ins := VAR_ins;
     VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_ins := VAR_ins;
     VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_ins := VAR_ins;
     VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_ins := VAR_ins;
     VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_ins := VAR_ins;
     VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_ins := VAR_ins;
     VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_ins := VAR_ins;
     VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_ins := VAR_ins;
     VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_ins := VAR_ins;
     VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_ins := VAR_ins;
     VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_ins := VAR_ins;
     VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_ins := VAR_ins;
     VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_ins := VAR_ins;
     VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_ins := VAR_ins;
     VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_ins := VAR_ins;
     VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_ins := VAR_ins;
     VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_ins := VAR_ins;
     VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_ins := VAR_ins;
     VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_ins := VAR_ins;
     VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_ins := VAR_ins;
     VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_ins := VAR_ins;
     VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_ins := VAR_ins;
     VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_k := VAR_k;
     VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_k := VAR_k;
     VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_k := VAR_k;
     VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_k := VAR_k;
     VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_k := VAR_k;
     VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_k := VAR_k;
     VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_k := VAR_k;
     VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_k := VAR_k;
     VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_k := VAR_k;
     VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_k := VAR_k;
     VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_k := VAR_k;
     VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_k := VAR_k;
     VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_k := VAR_k;
     VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_k := VAR_k;
     VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_k := VAR_k;
     VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_k := VAR_k;
     VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_k := VAR_k;
     VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_k := VAR_k;
     VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_k := VAR_k;
     VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_k := VAR_k;
     VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_k := VAR_k;
     VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_k := VAR_k;
     VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_k := VAR_k;
     VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_k := VAR_k;
     VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_k := VAR_k;
     VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_k := VAR_k;
     VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_k := VAR_k;
     VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_k := VAR_k;
     VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_k := VAR_k;
     VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_k := VAR_k;
     VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_k := VAR_k;
     VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_k := VAR_k;
     VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_k := VAR_k;
     VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_k := VAR_k;
     VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_k := VAR_k;
     REG_VAR_l16 := l16;
     REG_VAR_l8 := l8;
     REG_VAR_n16 := n16;
     REG_VAR_n8 := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_left := VAR_opcode;
     VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_pc := VAR_pc;
     VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_pc := VAR_pc;
     VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_pc := VAR_pc;
     VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_pc := VAR_pc;
     VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_pc := VAR_pc;
     VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_pc := VAR_pc;
     VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_pc := VAR_pc;
     VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_pc := VAR_pc;
     VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_pc := VAR_pc;
     VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_pc := VAR_pc;
     VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_pc := VAR_pc;
     VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_pc := VAR_pc;
     VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_pc := VAR_pc;
     VAR_opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_pc := VAR_pc;
     VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_pc := VAR_pc;
     VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_pc := VAR_pc;
     VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_pc := VAR_pc;
     VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_pc := VAR_pc;
     VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_pc := VAR_pc;
     VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_pc := VAR_pc;
     VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_pc := VAR_pc;
     VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_pc := VAR_pc;
     VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_pc := VAR_pc;
     VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_pc := VAR_pc;
     VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_pc := VAR_pc;
     VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_pc := VAR_pc;
     VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_pc := VAR_pc;
     VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_pc := VAR_pc;
     VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_pc := VAR_pc;
     VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_pc := VAR_pc;
     VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_pc := VAR_pc;
     VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_pc := VAR_pc;
     VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_pc := VAR_pc;
     VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_pc := VAR_pc;
     VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_pc := VAR_pc;
     VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_pc := VAR_pc;
     VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_pc := VAR_pc;
     VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_pc := VAR_pc;
     VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_pc := VAR_pc;
     VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_pc := VAR_pc;
     VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_pc := VAR_pc;
     VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_pc := VAR_pc;
     VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_phase := VAR_phase;
     VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_phase := VAR_phase;
     VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_phase := VAR_phase;
     VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_phase := VAR_phase;
     VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_phase := VAR_phase;
     VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_phase := VAR_phase;
     VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_phase := VAR_phase;
     VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_phase := VAR_phase;
     VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_phase := VAR_phase;
     VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_phase := VAR_phase;
     VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_phase := VAR_phase;
     VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_phase := VAR_phase;
     VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_phase := VAR_phase;
     VAR_opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_phase := VAR_phase;
     VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_phase := VAR_phase;
     VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_phase := VAR_phase;
     VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_phase := VAR_phase;
     VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_phase := VAR_phase;
     VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_phase := VAR_phase;
     VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_phase := VAR_phase;
     VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_phase := VAR_phase;
     VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_phase := VAR_phase;
     VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_phase := VAR_phase;
     VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_phase := VAR_phase;
     VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_phase := VAR_phase;
     VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_phase := VAR_phase;
     VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_phase := VAR_phase;
     VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_phase := VAR_phase;
     VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_phase := VAR_phase;
     VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_phase := VAR_phase;
     VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_phase := VAR_phase;
     VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_phase := VAR_phase;
     VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_phase := VAR_phase;
     VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_phase := VAR_phase;
     VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_phase := VAR_phase;
     VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_phase := VAR_phase;
     VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_phase := VAR_phase;
     VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_phase := VAR_phase;
     VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_phase := VAR_phase;
     VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_phase := VAR_phase;
     VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_phase := VAR_phase;
     VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_phase := VAR_phase;
     VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_sp := VAR_sp;
     VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_sp := VAR_sp;
     VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_sp := VAR_sp;
     VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_sp := VAR_sp;
     VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_sp := VAR_sp;
     VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_sp := VAR_sp;
     VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_sp := VAR_sp;
     VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_sp := VAR_sp;
     VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_sp := VAR_sp;
     VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_sp := VAR_sp;
     VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_sp := VAR_sp;
     VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_sp := VAR_sp;
     VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_sp := VAR_sp;
     VAR_opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_sp := VAR_sp;
     VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_sp := VAR_sp;
     VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_sp := VAR_sp;
     VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_sp := VAR_sp;
     VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_sp := VAR_sp;
     VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_sp := VAR_sp;
     VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_sp := VAR_sp;
     VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_sp := VAR_sp;
     VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_sp := VAR_sp;
     VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_sp := VAR_sp;
     VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_sp := VAR_sp;
     VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_sp := VAR_sp;
     VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_sp := VAR_sp;
     VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_sp := VAR_sp;
     VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_sp := VAR_sp;
     VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_sp := VAR_sp;
     VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_sp := VAR_sp;
     VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_sp := VAR_sp;
     VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_sp := VAR_sp;
     VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_sp := VAR_sp;
     VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_sp := VAR_sp;
     VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_sp := VAR_sp;
     VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_sp := VAR_sp;
     VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_sp := VAR_sp;
     VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_sp := VAR_sp;
     VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_sp := VAR_sp;
     VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_sp := VAR_sp;
     VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_sp := VAR_sp;
     VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_sp := VAR_sp;
     VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_stack_index := VAR_stack_index;
     VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_stack_index := VAR_stack_index;
     VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_stack_index := VAR_stack_index;
     VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_stack_index := VAR_stack_index;
     VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_stack_index := VAR_stack_index;
     VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_stack_index := VAR_stack_index;
     VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_stack_index := VAR_stack_index;
     VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_stack_index := VAR_stack_index;
     VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_stack_index := VAR_stack_index;
     VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_stack_index := VAR_stack_index;
     VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_stack_index := VAR_stack_index;
     VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_stack_index := VAR_stack_index;
     VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_stack_index := VAR_stack_index;
     VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_stack_index := VAR_stack_index;
     VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_stack_index := VAR_stack_index;
     VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_stack_index := VAR_stack_index;
     VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_stack_index := VAR_stack_index;
     VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_stack_index := VAR_stack_index;
     VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_stack_index := VAR_stack_index;
     VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_stack_index := VAR_stack_index;
     VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_stack_index := VAR_stack_index;
     VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_stack_index := VAR_stack_index;
     VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_stack_index := VAR_stack_index;
     VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_stack_index := VAR_stack_index;
     VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_stack_index := VAR_stack_index;
     VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_stack_index := VAR_stack_index;
     VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_stack_index := VAR_stack_index;
     VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_stack_index := VAR_stack_index;
     VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_stack_index := VAR_stack_index;
     VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_stack_index := VAR_stack_index;
     VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_stack_index := VAR_stack_index;
     VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_stack_index := VAR_stack_index;
     VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_stack_index := VAR_stack_index;
     VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_stack_index := VAR_stack_index;
     VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_stack_index := VAR_stack_index;
     VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_stack_index := VAR_stack_index;
     VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_stack_index := VAR_stack_index;
     VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_stack_index := VAR_stack_index;
     VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_stack_index := VAR_stack_index;
     VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_stack_index := VAR_stack_index;
     VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_stack_index := VAR_stack_index;
     REG_VAR_t16 := t16;
     REG_VAR_t8 := t8;
     REG_VAR_tmp16 := tmp16;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1324_c11_4e51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1327_c11_534e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1297_c11_e95a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1282_c11_4f9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1298_c11_bb32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1272_c11_5a27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1278_c11_bb60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1266_c11_3090] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1288_c11_6850] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1296_c11_608d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1292_c11_8fd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1308_c11_13d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1329_c11_2e24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1332_c11_711b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1319_c11_43ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1318_c11_0a4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1293_c11_d125] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1290_c11_11e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1325_c11_1bb1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1294_c11_9713] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1299_c11_eb5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1311_c11_4286] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1269_c11_c61c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1280_c11_4e7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1315_c11_dd30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1304_c11_e29e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1313_c11_dc84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1310_c11_a822] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1321_c11_9696] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1291_c11_03a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1276_c11_103c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1320_c11_b233] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_return_output;

     -- opc_brk_phased[uxn_opcodes_phased_h_l1264_c34_74e2] LATENCY=0
     -- Inputs
     -- Outputs
     VAR_opc_brk_phased_uxn_opcodes_phased_h_l1264_c34_74e2_return_output := opc_brk_phased_uxn_opcodes_phased_h_l1264_c34_74e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1316_c11_cf77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1307_c11_bc83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1317_c11_9f0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1268_c11_01ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1281_c11_715c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1286_c11_bda1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1323_c11_b421] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1322_c11_d309] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1264_c6_a306] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1328_c11_12d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1271_c11_2a28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1331_c11_d4ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1330_c11_18d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1267_c11_4a65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1300_c11_b197] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1314_c11_93ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1289_c11_d455] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1275_c11_e716] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1295_c11_5de2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1333_c11_66b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1274_c11_a2ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1306_c11_19c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1279_c11_f831] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1303_c11_31a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1326_c11_11e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1284_c11_0e68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1285_c11_7dfe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1302_c11_4fb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1305_c11_0c98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1270_c11_9a2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1273_c11_8a0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1287_c11_eb52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1301_c11_d8fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1283_c11_3579] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1277_c11_ee8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1309_c11_4a81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1265_c11_0600] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l1312_c11_6612] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1264_c6_a306_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1265_c11_0600_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1266_c11_3090_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1267_c11_4a65_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1268_c11_01ab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1269_c11_c61c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1270_c11_9a2b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1271_c11_2a28_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1272_c11_5a27_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1273_c11_8a0d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1274_c11_a2ef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1275_c11_e716_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1276_c11_103c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1277_c11_ee8f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1278_c11_bb60_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1279_c11_f831_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1280_c11_4e7d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1281_c11_715c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1282_c11_4f9d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1283_c11_3579_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1284_c11_0e68_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1285_c11_7dfe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1286_c11_bda1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1287_c11_eb52_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1288_c11_6850_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1289_c11_d455_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1290_c11_11e5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1291_c11_03a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1292_c11_8fd7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1293_c11_d125_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1294_c11_9713_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1295_c11_5de2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1296_c11_608d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1297_c11_e95a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1298_c11_bb32_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1299_c11_eb5c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1300_c11_b197_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1301_c11_d8fe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1302_c11_4fb5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1303_c11_31a5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1304_c11_e29e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1305_c11_0c98_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1306_c11_19c6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1307_c11_bc83_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1308_c11_13d0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1309_c11_4a81_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1310_c11_a822_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1311_c11_4286_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1312_c11_6612_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1313_c11_dc84_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1314_c11_93ef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1315_c11_dd30_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1316_c11_cf77_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1317_c11_9f0c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1318_c11_0a4d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1319_c11_43ac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1320_c11_b233_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1321_c11_9696_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1322_c11_d309_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1323_c11_b421_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1324_c11_4e51_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1325_c11_1bb1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1326_c11_11e3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1327_c11_534e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1328_c11_12d6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1329_c11_2e24_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1330_c11_18d9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1331_c11_d4ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1332_c11_711b_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l1333_c11_66b0_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_iftrue := VAR_opc_brk_phased_uxn_opcodes_phased_h_l1264_c34_74e2_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1333_c7_b63b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_cond;
     result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_return_output := result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1265_c7_dfb7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1333_c7_b63b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1266_c7_589c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1265_c1_1110] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c7_589c_return_output;
     VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1265_c1_1110_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1267_c7_04c1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1266_c1_1242] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_return_output;

     -- opc_jci_phased[uxn_opcodes_phased_h_l1265_c39_0a61] LATENCY=0
     -- Clock enable
     opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_CLOCK_ENABLE <= VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_CLOCK_ENABLE;
     -- Inputs
     opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_phase <= VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_phase;
     opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_pc <= VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_pc;
     opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_sp <= VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_sp;
     opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_stack_index <= VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_stack_index;
     -- Outputs
     VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_return_output := opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_return_output;
     VAR_opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1266_c1_1242_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iftrue := VAR_opc_jci_phased_uxn_opcodes_phased_h_l1265_c39_0a61_return_output;
     -- opc_jmi_phased[uxn_opcodes_phased_h_l1266_c39_ed6c] LATENCY=0
     -- Clock enable
     opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_CLOCK_ENABLE <= VAR_opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_CLOCK_ENABLE;
     -- Inputs
     opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_phase <= VAR_opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_phase;
     opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_pc <= VAR_opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_pc;
     opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_sp <= VAR_opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_sp;
     -- Outputs
     VAR_opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_return_output := opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1268_c7_523a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1267_c1_a19a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c7_523a_return_output;
     VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1267_c1_a19a_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iftrue := VAR_opc_jmi_phased_uxn_opcodes_phased_h_l1266_c39_ed6c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1269_c7_9a97] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1268_c1_9bd5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_return_output;

     -- opc_jsi_phased[uxn_opcodes_phased_h_l1267_c39_cc3c] LATENCY=0
     -- Clock enable
     opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_CLOCK_ENABLE <= VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_CLOCK_ENABLE;
     -- Inputs
     opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_phase <= VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_phase;
     opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_pc <= VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_pc;
     opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_sp <= VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_sp;
     opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_stack_index <= VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_stack_index;
     opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_ins <= VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_ins;
     -- Outputs
     VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_return_output := opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_return_output;
     VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1268_c1_9bd5_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iftrue := VAR_opc_jsi_phased_uxn_opcodes_phased_h_l1267_c39_cc3c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1270_c7_ad71] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1269_c1_5232] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_return_output;

     -- opc_lit_phased[uxn_opcodes_phased_h_l1268_c39_95bd] LATENCY=0
     -- Clock enable
     opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_CLOCK_ENABLE <= VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_CLOCK_ENABLE;
     -- Inputs
     opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_phase <= VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_phase;
     opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_pc <= VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_pc;
     opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_sp <= VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_sp;
     opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_stack_index <= VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_stack_index;
     opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_ins <= VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_ins;
     -- Outputs
     VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_return_output := opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_return_output;
     VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1269_c1_5232_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iftrue := VAR_opc_lit_phased_uxn_opcodes_phased_h_l1268_c39_95bd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1270_c1_1bb4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_return_output;

     -- opc_lit2_phased[uxn_opcodes_phased_h_l1269_c39_9a1e] LATENCY=0
     -- Clock enable
     opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_CLOCK_ENABLE <= VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_CLOCK_ENABLE;
     -- Inputs
     opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_phase <= VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_phase;
     opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_pc <= VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_pc;
     opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_sp <= VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_sp;
     opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_stack_index <= VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_stack_index;
     opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_ins <= VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_ins;
     -- Outputs
     VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_return_output := opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1271_c7_6e23] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_return_output;
     VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1270_c1_1bb4_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iftrue := VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1269_c39_9a1e_return_output;
     -- opc_lit_phased[uxn_opcodes_phased_h_l1270_c39_e8ce] LATENCY=0
     -- Clock enable
     opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_CLOCK_ENABLE <= VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_CLOCK_ENABLE;
     -- Inputs
     opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_phase <= VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_phase;
     opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_pc <= VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_pc;
     opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_sp <= VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_sp;
     opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_stack_index <= VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_stack_index;
     opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_ins <= VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_ins;
     -- Outputs
     VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_return_output := opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1271_c1_469a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1272_c7_ea82] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_return_output;
     VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1271_c1_469a_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iftrue := VAR_opc_lit_phased_uxn_opcodes_phased_h_l1270_c39_e8ce_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1273_c7_63d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1272_c1_87ab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_return_output;

     -- opc_lit2_phased[uxn_opcodes_phased_h_l1271_c39_1924] LATENCY=0
     -- Clock enable
     opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_CLOCK_ENABLE <= VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_CLOCK_ENABLE;
     -- Inputs
     opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_phase <= VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_phase;
     opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_pc <= VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_pc;
     opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_sp <= VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_sp;
     opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_stack_index <= VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_stack_index;
     opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_ins <= VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_ins;
     -- Outputs
     VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_return_output := opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_return_output;
     VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1272_c1_87ab_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iftrue := VAR_opc_lit2_phased_uxn_opcodes_phased_h_l1271_c39_1924_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1274_c7_cf60] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_return_output;

     -- opc_inc_phased[uxn_opcodes_phased_h_l1272_c39_1607] LATENCY=0
     -- Clock enable
     opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_CLOCK_ENABLE <= VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_CLOCK_ENABLE;
     -- Inputs
     opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_phase <= VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_phase;
     opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_pc <= VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_pc;
     opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_sp <= VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_sp;
     opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_stack_index <= VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_stack_index;
     opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_ins <= VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_ins;
     opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_k <= VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_k;
     -- Outputs
     VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_return_output := opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iftrue := VAR_opc_inc_phased_uxn_opcodes_phased_h_l1272_c39_1607_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1275_c7_e09a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1274_c1_6181] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_return_output;
     VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1274_c1_6181_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1275_c1_ecb9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_return_output;

     -- opc_pop_phased[uxn_opcodes_phased_h_l1274_c39_a660] LATENCY=0
     -- Clock enable
     opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_CLOCK_ENABLE <= VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_CLOCK_ENABLE;
     -- Inputs
     opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_phase <= VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_phase;
     opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_pc <= VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_pc;
     opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_sp <= VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_sp;
     opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_stack_index <= VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_stack_index;
     opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_ins <= VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_ins;
     opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_k <= VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_k;
     -- Outputs
     VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_return_output := opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1276_c7_94f5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_return_output;
     VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1275_c1_ecb9_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iftrue := VAR_opc_pop_phased_uxn_opcodes_phased_h_l1274_c39_a660_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1277_c7_0431] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_return_output;

     -- opc_pop2_phased[uxn_opcodes_phased_h_l1275_c39_7c50] LATENCY=0
     -- Clock enable
     opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_CLOCK_ENABLE <= VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_CLOCK_ENABLE;
     -- Inputs
     opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_phase <= VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_phase;
     opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_pc <= VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_pc;
     opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_sp <= VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_sp;
     opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_stack_index <= VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_stack_index;
     opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_ins <= VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_ins;
     opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_k <= VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_k;
     -- Outputs
     VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_return_output := opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1276_c1_3292] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1277_c7_0431_return_output;
     VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1276_c1_3292_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iftrue := VAR_opc_pop2_phased_uxn_opcodes_phased_h_l1275_c39_7c50_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1278_c7_5918] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_return_output;

     -- opc_nip_phased[uxn_opcodes_phased_h_l1276_c39_ddf8] LATENCY=0
     -- Clock enable
     opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_CLOCK_ENABLE <= VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_CLOCK_ENABLE;
     -- Inputs
     opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_phase <= VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_phase;
     opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_pc <= VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_pc;
     opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_sp <= VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_sp;
     opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_stack_index <= VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_stack_index;
     opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_ins <= VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_ins;
     opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_k <= VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_k;
     -- Outputs
     VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_return_output := opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c7_5918_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iftrue := VAR_opc_nip_phased_uxn_opcodes_phased_h_l1276_c39_ddf8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1279_c7_9544] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1278_c1_834e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1279_c7_9544_return_output;
     VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1278_c1_834e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1280_c7_f489] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_return_output;

     -- opc_swp_phased[uxn_opcodes_phased_h_l1278_c39_09c8] LATENCY=0
     -- Clock enable
     opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_CLOCK_ENABLE <= VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_CLOCK_ENABLE;
     -- Inputs
     opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_phase <= VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_phase;
     opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_pc <= VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_pc;
     opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_sp <= VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_sp;
     opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_stack_index <= VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_stack_index;
     opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_ins <= VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_ins;
     opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_k <= VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_k;
     -- Outputs
     VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_return_output := opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c7_f489_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iftrue := VAR_opc_swp_phased_uxn_opcodes_phased_h_l1278_c39_09c8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1280_c1_4e7b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1281_c7_7cb5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_return_output;
     VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1280_c1_4e7b_return_output;
     -- opc_rot_phased[uxn_opcodes_phased_h_l1280_c39_85ce] LATENCY=0
     -- Clock enable
     opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_CLOCK_ENABLE <= VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_CLOCK_ENABLE;
     -- Inputs
     opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_phase <= VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_phase;
     opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_pc <= VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_pc;
     opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_sp <= VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_sp;
     opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_stack_index <= VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_stack_index;
     opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_ins <= VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_ins;
     opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_k <= VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_k;
     -- Outputs
     VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_return_output := opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1282_c7_5960] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c7_5960_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iftrue := VAR_opc_rot_phased_uxn_opcodes_phased_h_l1280_c39_85ce_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1283_c7_ab85] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1282_c1_cb3f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_return_output;
     VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1282_c1_cb3f_return_output;
     -- opc_dup_phased[uxn_opcodes_phased_h_l1282_c39_9741] LATENCY=0
     -- Clock enable
     opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_CLOCK_ENABLE <= VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_CLOCK_ENABLE;
     -- Inputs
     opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_phase <= VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_phase;
     opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_pc <= VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_pc;
     opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_sp <= VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_sp;
     opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_stack_index <= VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_stack_index;
     opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_ins <= VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_ins;
     opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_k <= VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_k;
     -- Outputs
     VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_return_output := opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1284_c7_2929] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c7_2929_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iftrue := VAR_opc_dup_phased_uxn_opcodes_phased_h_l1282_c39_9741_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1284_c1_b17b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1285_c7_da6a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_return_output;
     VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1284_c1_b17b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1286_c7_e0be] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1285_c1_de20] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_return_output;

     -- opc_ovr_phased[uxn_opcodes_phased_h_l1284_c39_8fa7] LATENCY=0
     -- Clock enable
     opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_CLOCK_ENABLE <= VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_CLOCK_ENABLE;
     -- Inputs
     opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_phase <= VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_phase;
     opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_pc <= VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_pc;
     opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_sp <= VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_sp;
     opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_stack_index <= VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_stack_index;
     opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_ins <= VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_ins;
     opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_k <= VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_k;
     -- Outputs
     VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_return_output := opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_return_output;
     VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1285_c1_de20_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iftrue := VAR_opc_ovr_phased_uxn_opcodes_phased_h_l1284_c39_8fa7_return_output;
     -- opc_ovr2_phased[uxn_opcodes_phased_h_l1285_c39_7121] LATENCY=0
     -- Clock enable
     opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_CLOCK_ENABLE <= VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_CLOCK_ENABLE;
     -- Inputs
     opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_phase <= VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_phase;
     opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_pc <= VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_pc;
     opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_sp <= VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_sp;
     opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_stack_index <= VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_stack_index;
     opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_ins <= VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_ins;
     opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_k <= VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_k;
     -- Outputs
     VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_return_output := opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1287_c7_8005] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1286_c1_559c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1287_c7_8005_return_output;
     VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1286_c1_559c_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iftrue := VAR_opc_ovr2_phased_uxn_opcodes_phased_h_l1285_c39_7121_return_output;
     -- opc_equ_phased[uxn_opcodes_phased_h_l1286_c39_0049] LATENCY=0
     -- Clock enable
     opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_CLOCK_ENABLE <= VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_CLOCK_ENABLE;
     -- Inputs
     opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_phase <= VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_phase;
     opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_pc <= VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_pc;
     opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_sp <= VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_sp;
     opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_stack_index <= VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_stack_index;
     opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_ins <= VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_ins;
     opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_k <= VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_k;
     -- Outputs
     VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_return_output := opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1288_c7_7fd0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iftrue := VAR_opc_equ_phased_uxn_opcodes_phased_h_l1286_c39_0049_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1288_c1_5074] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1289_c7_23df] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1289_c7_23df_return_output;
     VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1288_c1_5074_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1290_c7_f597] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_return_output;

     -- opc_neq_phased[uxn_opcodes_phased_h_l1288_c39_eaed] LATENCY=0
     -- Clock enable
     opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_CLOCK_ENABLE <= VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_CLOCK_ENABLE;
     -- Inputs
     opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_phase <= VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_phase;
     opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_pc <= VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_pc;
     opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_sp <= VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_sp;
     opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_stack_index <= VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_stack_index;
     opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_ins <= VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_ins;
     opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_k <= VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_k;
     -- Outputs
     VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_return_output := opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c7_f597_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iftrue := VAR_opc_neq_phased_uxn_opcodes_phased_h_l1288_c39_eaed_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1291_c7_a527] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1290_c1_0e38] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1291_c7_a527_return_output;
     VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1290_c1_0e38_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1292_c7_48df] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_return_output;

     -- opc_gth_phased[uxn_opcodes_phased_h_l1290_c39_5713] LATENCY=0
     -- Clock enable
     opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_CLOCK_ENABLE <= VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_CLOCK_ENABLE;
     -- Inputs
     opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_phase <= VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_phase;
     opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_pc <= VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_pc;
     opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_sp <= VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_sp;
     opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_stack_index <= VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_stack_index;
     opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_ins <= VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_ins;
     opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_k <= VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_k;
     -- Outputs
     VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_return_output := opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c7_48df_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iftrue := VAR_opc_gth_phased_uxn_opcodes_phased_h_l1290_c39_5713_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1292_c1_f23a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1293_c7_3eef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_return_output;
     VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1292_c1_f23a_return_output;
     -- opc_lth_phased[uxn_opcodes_phased_h_l1292_c39_bf73] LATENCY=0
     -- Clock enable
     opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_CLOCK_ENABLE <= VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_CLOCK_ENABLE;
     -- Inputs
     opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_phase <= VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_phase;
     opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_pc <= VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_pc;
     opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_sp <= VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_sp;
     opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_stack_index <= VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_stack_index;
     opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_ins <= VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_ins;
     opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_k <= VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_k;
     -- Outputs
     VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_return_output := opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1294_c7_92c4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iftrue := VAR_opc_lth_phased_uxn_opcodes_phased_h_l1292_c39_bf73_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1295_c7_d00c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1294_c1_a332] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_return_output;
     VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1294_c1_a332_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1296_c7_a23a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_return_output;

     -- opc_jmp_phased[uxn_opcodes_phased_h_l1294_c39_f60e] LATENCY=0
     -- Clock enable
     opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_CLOCK_ENABLE <= VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_CLOCK_ENABLE;
     -- Inputs
     opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_phase <= VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_phase;
     opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_pc <= VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_pc;
     opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_sp <= VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_sp;
     opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_stack_index <= VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_stack_index;
     opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_ins <= VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_ins;
     opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_k <= VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_k;
     -- Outputs
     VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_return_output := opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1295_c1_016b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_return_output;
     VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1295_c1_016b_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iftrue := VAR_opc_jmp_phased_uxn_opcodes_phased_h_l1294_c39_f60e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1296_c1_8af1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1297_c7_919a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_return_output;

     -- opc_jmp2_phased[uxn_opcodes_phased_h_l1295_c39_c16d] LATENCY=0
     -- Clock enable
     opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_CLOCK_ENABLE <= VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_CLOCK_ENABLE;
     -- Inputs
     opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_phase <= VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_phase;
     opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_pc <= VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_pc;
     opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_sp <= VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_sp;
     opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_stack_index <= VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_stack_index;
     opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_ins <= VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_ins;
     opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_k <= VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_k;
     -- Outputs
     VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_return_output := opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1297_c7_919a_return_output;
     VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1296_c1_8af1_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iftrue := VAR_opc_jmp2_phased_uxn_opcodes_phased_h_l1295_c39_c16d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1298_c7_0922] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_return_output;

     -- opc_jcn_phased[uxn_opcodes_phased_h_l1296_c39_3f47] LATENCY=0
     -- Clock enable
     opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_CLOCK_ENABLE <= VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_CLOCK_ENABLE;
     -- Inputs
     opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_phase <= VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_phase;
     opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_pc <= VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_pc;
     opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_sp <= VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_sp;
     opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_stack_index <= VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_stack_index;
     opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_ins <= VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_ins;
     opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_k <= VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_k;
     -- Outputs
     VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_return_output := opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c7_0922_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iftrue := VAR_opc_jcn_phased_uxn_opcodes_phased_h_l1296_c39_3f47_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1298_c1_8038] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1299_c7_5b4b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_return_output;
     VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1298_c1_8038_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1300_c7_0aa1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_return_output;

     -- opc_jsr_phased[uxn_opcodes_phased_h_l1298_c39_478f] LATENCY=0
     -- Clock enable
     opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_CLOCK_ENABLE <= VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_CLOCK_ENABLE;
     -- Inputs
     opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_phase <= VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_phase;
     opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_pc <= VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_pc;
     opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_sp <= VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_sp;
     opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_stack_index <= VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_stack_index;
     opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_ins <= VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_ins;
     opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_k <= VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_k;
     -- Outputs
     VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_return_output := opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iftrue := VAR_opc_jsr_phased_uxn_opcodes_phased_h_l1298_c39_478f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1301_c7_e84f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1300_c1_e54b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_return_output;
     VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1300_c1_e54b_return_output;
     -- opc_sth_phased[uxn_opcodes_phased_h_l1300_c39_2129] LATENCY=0
     -- Clock enable
     opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_CLOCK_ENABLE <= VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_CLOCK_ENABLE;
     -- Inputs
     opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_phase <= VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_phase;
     opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_pc <= VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_pc;
     opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_sp <= VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_sp;
     opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_stack_index <= VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_stack_index;
     opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_ins <= VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_ins;
     opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_k <= VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_k;
     -- Outputs
     VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_return_output := opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1302_c7_c3df] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iftrue := VAR_opc_sth_phased_uxn_opcodes_phased_h_l1300_c39_2129_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1303_c7_b10e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1302_c1_8f10] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_return_output;
     VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1302_c1_8f10_return_output;
     -- opc_ldz_phased[uxn_opcodes_phased_h_l1302_c39_d680] LATENCY=0
     -- Clock enable
     opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_CLOCK_ENABLE <= VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_CLOCK_ENABLE;
     -- Inputs
     opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_phase <= VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_phase;
     opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_pc <= VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_pc;
     opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_sp <= VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_sp;
     opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_stack_index <= VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_stack_index;
     opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_ins <= VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_ins;
     opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_k <= VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_k;
     -- Outputs
     VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_return_output := opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1304_c7_ffe7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iftrue := VAR_opc_ldz_phased_uxn_opcodes_phased_h_l1302_c39_d680_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1304_c1_14a0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1305_c7_237c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1305_c7_237c_return_output;
     VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1304_c1_14a0_return_output;
     -- opc_stz_phased[uxn_opcodes_phased_h_l1304_c39_dfa7] LATENCY=0
     -- Clock enable
     opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_CLOCK_ENABLE <= VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_CLOCK_ENABLE;
     -- Inputs
     opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_phase <= VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_phase;
     opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_pc <= VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_pc;
     opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_sp <= VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_sp;
     opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_stack_index <= VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_stack_index;
     opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_ins <= VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_ins;
     opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_k <= VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_k;
     -- Outputs
     VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_return_output := opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1306_c7_f52b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iftrue := VAR_opc_stz_phased_uxn_opcodes_phased_h_l1304_c39_dfa7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1307_c7_f5e3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1306_c1_0d91] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_return_output;
     VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1306_c1_0d91_return_output;
     -- opc_ldr_phased[uxn_opcodes_phased_h_l1306_c39_84cd] LATENCY=0
     -- Clock enable
     opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_CLOCK_ENABLE <= VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_CLOCK_ENABLE;
     -- Inputs
     opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_phase <= VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_phase;
     opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_pc <= VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_pc;
     opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_sp <= VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_sp;
     opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_stack_index <= VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_stack_index;
     opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_ins <= VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_ins;
     opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_k <= VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_k;
     -- Outputs
     VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_return_output := opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1308_c7_4334] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c7_4334_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iftrue := VAR_opc_ldr_phased_uxn_opcodes_phased_h_l1306_c39_84cd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1308_c1_bfa7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1309_c7_dad4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_return_output;
     VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1308_c1_bfa7_return_output;
     -- opc_str_phased[uxn_opcodes_phased_h_l1308_c39_e298] LATENCY=0
     -- Clock enable
     opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_CLOCK_ENABLE <= VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_CLOCK_ENABLE;
     -- Inputs
     opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_phase <= VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_phase;
     opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_pc <= VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_pc;
     opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_sp <= VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_sp;
     opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_stack_index <= VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_stack_index;
     opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_ins <= VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_ins;
     opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_k <= VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_k;
     -- Outputs
     VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_return_output := opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1310_c7_92ef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iftrue := VAR_opc_str_phased_uxn_opcodes_phased_h_l1308_c39_e298_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1310_c1_2877] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1311_c7_3f87] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_return_output;
     VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1310_c1_2877_return_output;
     -- opc_lda_phased[uxn_opcodes_phased_h_l1310_c39_2377] LATENCY=0
     -- Clock enable
     opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_CLOCK_ENABLE <= VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_CLOCK_ENABLE;
     -- Inputs
     opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_phase <= VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_phase;
     opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_pc <= VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_pc;
     opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_sp <= VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_sp;
     opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_stack_index <= VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_stack_index;
     opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_ins <= VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_ins;
     opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_k <= VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_k;
     -- Outputs
     VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_return_output := opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1312_c7_4f0c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iftrue := VAR_opc_lda_phased_uxn_opcodes_phased_h_l1310_c39_2377_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1313_c7_28db] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1312_c1_192f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1313_c7_28db_return_output;
     VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1312_c1_192f_return_output;
     -- opc_sta_phased[uxn_opcodes_phased_h_l1312_c39_6698] LATENCY=0
     -- Clock enable
     opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_CLOCK_ENABLE <= VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_CLOCK_ENABLE;
     -- Inputs
     opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_phase <= VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_phase;
     opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_pc <= VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_pc;
     opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_sp <= VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_sp;
     opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_stack_index <= VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_stack_index;
     opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_ins <= VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_ins;
     opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_k <= VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_k;
     -- Outputs
     VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_return_output := opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1314_c7_7ccd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iftrue := VAR_opc_sta_phased_uxn_opcodes_phased_h_l1312_c39_6698_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1315_c7_36a8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1314_c1_a288] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_return_output;
     VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1314_c1_a288_return_output;
     -- opc_dei_phased[uxn_opcodes_phased_h_l1314_c39_34e0] LATENCY=0
     -- Clock enable
     opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_CLOCK_ENABLE <= VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_CLOCK_ENABLE;
     -- Inputs
     opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_phase <= VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_phase;
     opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_pc <= VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_pc;
     opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_sp <= VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_sp;
     opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_stack_index <= VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_stack_index;
     opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_ins <= VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_ins;
     opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_k <= VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_k;
     -- Outputs
     VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_return_output := opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1316_c7_8d55] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iftrue := VAR_opc_dei_phased_uxn_opcodes_phased_h_l1314_c39_34e0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1316_c1_9d24] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1317_c7_db09] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c7_db09_return_output;
     VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1316_c1_9d24_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1318_c7_3351] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1317_c1_7b96] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_return_output;

     -- opc_deo_phased[uxn_opcodes_phased_h_l1316_c39_b348] LATENCY=0
     -- Clock enable
     opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_CLOCK_ENABLE <= VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_CLOCK_ENABLE;
     -- Inputs
     opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_phase <= VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_phase;
     opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_pc <= VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_pc;
     opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_sp <= VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_sp;
     opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_stack_index <= VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_stack_index;
     opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_ins <= VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_ins;
     opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_k <= VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_k;
     -- Outputs
     VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_return_output := opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c7_3351_return_output;
     VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1317_c1_7b96_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iftrue := VAR_opc_deo_phased_uxn_opcodes_phased_h_l1316_c39_b348_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1319_c7_f6ed] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_return_output;

     -- opc_deo2_phased[uxn_opcodes_phased_h_l1317_c39_cd07] LATENCY=0
     -- Clock enable
     opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_CLOCK_ENABLE <= VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_CLOCK_ENABLE;
     -- Inputs
     opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_phase <= VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_phase;
     opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_pc <= VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_pc;
     opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_sp <= VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_sp;
     opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_stack_index <= VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_stack_index;
     opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_ins <= VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_ins;
     opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_k <= VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_k;
     -- Outputs
     VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_return_output := opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1318_c1_b2af] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_return_output;
     VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1318_c1_b2af_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iftrue := VAR_opc_deo2_phased_uxn_opcodes_phased_h_l1317_c39_cd07_return_output;
     -- opc_add_phased[uxn_opcodes_phased_h_l1318_c39_b643] LATENCY=0
     -- Clock enable
     opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_CLOCK_ENABLE <= VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_CLOCK_ENABLE;
     -- Inputs
     opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_phase <= VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_phase;
     opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_pc <= VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_pc;
     opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_sp <= VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_sp;
     opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_stack_index <= VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_stack_index;
     opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_ins <= VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_ins;
     opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_k <= VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_k;
     -- Outputs
     VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_return_output := opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1320_c7_1d82] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iftrue := VAR_opc_add_phased_uxn_opcodes_phased_h_l1318_c39_b643_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1320_c1_0b03] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1321_c7_4e6c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_return_output;
     VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1320_c1_0b03_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1322_c7_d50c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_return_output;

     -- opc_sub_phased[uxn_opcodes_phased_h_l1320_c39_b12b] LATENCY=0
     -- Clock enable
     opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_CLOCK_ENABLE <= VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_CLOCK_ENABLE;
     -- Inputs
     opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_phase <= VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_phase;
     opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_pc <= VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_pc;
     opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_sp <= VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_sp;
     opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_stack_index <= VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_stack_index;
     opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_ins <= VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_ins;
     opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_k <= VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_k;
     -- Outputs
     VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_return_output := opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iftrue := VAR_opc_sub_phased_uxn_opcodes_phased_h_l1320_c39_b12b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1322_c1_ee7b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1323_c7_4f38] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_return_output;
     VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1322_c1_ee7b_return_output;
     -- opc_mul_phased[uxn_opcodes_phased_h_l1322_c39_ecae] LATENCY=0
     -- Clock enable
     opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_CLOCK_ENABLE <= VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_CLOCK_ENABLE;
     -- Inputs
     opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_phase <= VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_phase;
     opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_pc <= VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_pc;
     opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_sp <= VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_sp;
     opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_stack_index <= VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_stack_index;
     opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_ins <= VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_ins;
     opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_k <= VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_k;
     -- Outputs
     VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_return_output := opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1324_c7_6a23] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iftrue := VAR_opc_mul_phased_uxn_opcodes_phased_h_l1322_c39_ecae_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1324_c1_df83] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1325_c7_6cbc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_return_output;
     VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1324_c1_df83_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1326_c7_ff09] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_return_output;

     -- opc_div_phased[uxn_opcodes_phased_h_l1324_c39_5168] LATENCY=0
     -- Clock enable
     opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_CLOCK_ENABLE <= VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_CLOCK_ENABLE;
     -- Inputs
     opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_phase <= VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_phase;
     opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_pc <= VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_pc;
     opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_sp <= VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_sp;
     opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_stack_index <= VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_stack_index;
     opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_ins <= VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_ins;
     opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_k <= VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_k;
     -- Outputs
     VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_return_output := opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iftrue := VAR_opc_div_phased_uxn_opcodes_phased_h_l1324_c39_5168_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1327_c7_d5eb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1326_c1_80e2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_return_output;
     VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1326_c1_80e2_return_output;
     -- opc_and_phased[uxn_opcodes_phased_h_l1326_c39_fc5d] LATENCY=0
     -- Clock enable
     opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_CLOCK_ENABLE <= VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_CLOCK_ENABLE;
     -- Inputs
     opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_phase <= VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_phase;
     opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_pc <= VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_pc;
     opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_sp <= VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_sp;
     opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_stack_index <= VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_stack_index;
     opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_ins <= VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_ins;
     opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_k <= VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_k;
     -- Outputs
     VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_return_output := opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1328_c7_d418] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c7_d418_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iftrue := VAR_opc_and_phased_uxn_opcodes_phased_h_l1326_c39_fc5d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1328_c1_9aa1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1329_c7_89f6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_return_output;
     VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1328_c1_9aa1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1330_c7_68c6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_return_output;

     -- opc_ora_phased[uxn_opcodes_phased_h_l1328_c39_3172] LATENCY=0
     -- Clock enable
     opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_CLOCK_ENABLE <= VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_CLOCK_ENABLE;
     -- Inputs
     opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_phase <= VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_phase;
     opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_pc <= VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_pc;
     opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_sp <= VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_sp;
     opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_stack_index <= VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_stack_index;
     opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_ins <= VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_ins;
     opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_k <= VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_k;
     -- Outputs
     VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_return_output := opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iftrue := VAR_opc_ora_phased_uxn_opcodes_phased_h_l1328_c39_3172_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1330_c1_ab76] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1331_c7_be16] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1331_c7_be16_return_output;
     VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1330_c1_ab76_return_output;
     -- opc_eor_phased[uxn_opcodes_phased_h_l1330_c39_aabb] LATENCY=0
     -- Clock enable
     opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_CLOCK_ENABLE <= VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_CLOCK_ENABLE;
     -- Inputs
     opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_phase <= VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_phase;
     opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_pc <= VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_pc;
     opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_sp <= VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_sp;
     opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_stack_index <= VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_stack_index;
     opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_ins <= VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_ins;
     opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_k <= VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_k;
     -- Outputs
     VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_return_output := opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1332_c7_d8be] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_return_output;

     -- Submodule level 69
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iftrue := VAR_opc_eor_phased_uxn_opcodes_phased_h_l1330_c39_aabb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l1332_c1_37b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_return_output;

     -- Submodule level 70
     VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l1332_c1_37b6_return_output;
     -- opc_sft_phased[uxn_opcodes_phased_h_l1332_c39_d69e] LATENCY=0
     -- Clock enable
     opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_CLOCK_ENABLE <= VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_CLOCK_ENABLE;
     -- Inputs
     opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_phase <= VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_phase;
     opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_pc <= VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_pc;
     opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_sp <= VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_sp;
     opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_stack_index <= VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_stack_index;
     opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_ins <= VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_ins;
     opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_k <= VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_k;
     -- Outputs
     VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_return_output := opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_return_output;

     -- Submodule level 71
     VAR_result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iftrue := VAR_opc_sft_phased_uxn_opcodes_phased_h_l1332_c39_d69e_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1332_c7_d8be] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_cond;
     result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_return_output := result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_return_output;

     -- Submodule level 72
     VAR_result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1332_c7_d8be_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1331_c7_be16] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_cond;
     result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_return_output := result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_return_output;

     -- Submodule level 73
     VAR_result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1331_c7_be16_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1330_c7_68c6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_cond;
     result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_return_output := result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_return_output;

     -- Submodule level 74
     VAR_result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1330_c7_68c6_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1329_c7_89f6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_cond;
     result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_return_output := result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_return_output;

     -- Submodule level 75
     VAR_result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1329_c7_89f6_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1328_c7_d418] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_cond;
     result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_return_output := result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_return_output;

     -- Submodule level 76
     VAR_result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1328_c7_d418_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1327_c7_d5eb] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_cond;
     result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_return_output := result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_return_output;

     -- Submodule level 77
     VAR_result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1327_c7_d5eb_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1326_c7_ff09] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_cond;
     result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_return_output := result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_return_output;

     -- Submodule level 78
     VAR_result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1326_c7_ff09_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1325_c7_6cbc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_cond;
     result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_return_output := result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_return_output;

     -- Submodule level 79
     VAR_result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1325_c7_6cbc_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1324_c7_6a23] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_cond;
     result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_return_output := result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_return_output;

     -- Submodule level 80
     VAR_result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1324_c7_6a23_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1323_c7_4f38] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_cond;
     result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_return_output := result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_return_output;

     -- Submodule level 81
     VAR_result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1323_c7_4f38_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1322_c7_d50c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_cond;
     result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_return_output := result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_return_output;

     -- Submodule level 82
     VAR_result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1322_c7_d50c_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1321_c7_4e6c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_cond;
     result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_return_output := result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_return_output;

     -- Submodule level 83
     VAR_result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1321_c7_4e6c_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1320_c7_1d82] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_cond;
     result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_return_output := result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_return_output;

     -- Submodule level 84
     VAR_result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1320_c7_1d82_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1319_c7_f6ed] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_cond;
     result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_return_output := result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_return_output;

     -- Submodule level 85
     VAR_result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1319_c7_f6ed_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1318_c7_3351] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_cond;
     result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_return_output := result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_return_output;

     -- Submodule level 86
     VAR_result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1318_c7_3351_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1317_c7_db09] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_cond;
     result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_return_output := result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_return_output;

     -- Submodule level 87
     VAR_result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1317_c7_db09_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1316_c7_8d55] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_cond;
     result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_return_output := result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_return_output;

     -- Submodule level 88
     VAR_result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1316_c7_8d55_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1315_c7_36a8] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_cond;
     result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_return_output := result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_return_output;

     -- Submodule level 89
     VAR_result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1315_c7_36a8_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1314_c7_7ccd] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_cond;
     result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_return_output := result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_return_output;

     -- Submodule level 90
     VAR_result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1314_c7_7ccd_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1313_c7_28db] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_cond;
     result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_return_output := result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_return_output;

     -- Submodule level 91
     VAR_result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1313_c7_28db_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1312_c7_4f0c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_cond;
     result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_return_output := result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_return_output;

     -- Submodule level 92
     VAR_result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1312_c7_4f0c_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1311_c7_3f87] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_cond;
     result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_return_output := result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_return_output;

     -- Submodule level 93
     VAR_result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1311_c7_3f87_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1310_c7_92ef] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_cond;
     result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_return_output := result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_return_output;

     -- Submodule level 94
     VAR_result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1310_c7_92ef_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1309_c7_dad4] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_cond;
     result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_return_output := result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_return_output;

     -- Submodule level 95
     VAR_result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1309_c7_dad4_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1308_c7_4334] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_cond;
     result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_return_output := result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_return_output;

     -- Submodule level 96
     VAR_result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1308_c7_4334_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1307_c7_f5e3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_cond;
     result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_return_output := result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_return_output;

     -- Submodule level 97
     VAR_result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1307_c7_f5e3_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1306_c7_f52b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_cond;
     result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_return_output := result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_return_output;

     -- Submodule level 98
     VAR_result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1306_c7_f52b_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1305_c7_237c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_cond;
     result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_return_output := result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_return_output;

     -- Submodule level 99
     VAR_result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1305_c7_237c_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1304_c7_ffe7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_cond;
     result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_return_output := result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_return_output;

     -- Submodule level 100
     VAR_result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1304_c7_ffe7_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1303_c7_b10e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_cond;
     result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_return_output := result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_return_output;

     -- Submodule level 101
     VAR_result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1303_c7_b10e_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1302_c7_c3df] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_cond;
     result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_return_output := result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_return_output;

     -- Submodule level 102
     VAR_result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1302_c7_c3df_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1301_c7_e84f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_cond;
     result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_return_output := result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_return_output;

     -- Submodule level 103
     VAR_result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1301_c7_e84f_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1300_c7_0aa1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_cond;
     result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_return_output := result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_return_output;

     -- Submodule level 104
     VAR_result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1300_c7_0aa1_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1299_c7_5b4b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_cond;
     result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_return_output := result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_return_output;

     -- Submodule level 105
     VAR_result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1299_c7_5b4b_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1298_c7_0922] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_cond;
     result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_return_output := result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_return_output;

     -- Submodule level 106
     VAR_result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1298_c7_0922_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1297_c7_919a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_cond;
     result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_return_output := result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_return_output;

     -- Submodule level 107
     VAR_result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1297_c7_919a_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1296_c7_a23a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_cond;
     result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_return_output := result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_return_output;

     -- Submodule level 108
     VAR_result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1296_c7_a23a_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1295_c7_d00c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_cond;
     result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_return_output := result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_return_output;

     -- Submodule level 109
     VAR_result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1295_c7_d00c_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1294_c7_92c4] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_cond;
     result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_return_output := result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_return_output;

     -- Submodule level 110
     VAR_result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1294_c7_92c4_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1293_c7_3eef] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_cond;
     result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_return_output := result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_return_output;

     -- Submodule level 111
     VAR_result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1293_c7_3eef_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1292_c7_48df] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_cond;
     result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_return_output := result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_return_output;

     -- Submodule level 112
     VAR_result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1292_c7_48df_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1291_c7_a527] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_cond;
     result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_return_output := result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_return_output;

     -- Submodule level 113
     VAR_result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1291_c7_a527_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1290_c7_f597] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_cond;
     result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_return_output := result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_return_output;

     -- Submodule level 114
     VAR_result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1290_c7_f597_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1289_c7_23df] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_cond;
     result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_return_output := result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_return_output;

     -- Submodule level 115
     VAR_result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1289_c7_23df_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1288_c7_7fd0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_cond;
     result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_return_output := result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_return_output;

     -- Submodule level 116
     VAR_result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1288_c7_7fd0_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1287_c7_8005] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_cond;
     result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_return_output := result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_return_output;

     -- Submodule level 117
     VAR_result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1287_c7_8005_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1286_c7_e0be] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_cond;
     result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_return_output := result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_return_output;

     -- Submodule level 118
     VAR_result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1286_c7_e0be_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1285_c7_da6a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_cond;
     result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_return_output := result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_return_output;

     -- Submodule level 119
     VAR_result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1285_c7_da6a_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1284_c7_2929] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_cond;
     result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_return_output := result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_return_output;

     -- Submodule level 120
     VAR_result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1284_c7_2929_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1283_c7_ab85] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_cond;
     result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_return_output := result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_return_output;

     -- Submodule level 121
     VAR_result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1283_c7_ab85_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1282_c7_5960] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_cond;
     result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_return_output := result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_return_output;

     -- Submodule level 122
     VAR_result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1282_c7_5960_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1281_c7_7cb5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_cond;
     result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_return_output := result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_return_output;

     -- Submodule level 123
     VAR_result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1281_c7_7cb5_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1280_c7_f489] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_cond;
     result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_return_output := result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_return_output;

     -- Submodule level 124
     VAR_result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1280_c7_f489_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1279_c7_9544] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_cond;
     result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_return_output := result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_return_output;

     -- Submodule level 125
     VAR_result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1279_c7_9544_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1278_c7_5918] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_cond;
     result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_return_output := result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_return_output;

     -- Submodule level 126
     VAR_result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1278_c7_5918_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1277_c7_0431] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_cond;
     result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_return_output := result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_return_output;

     -- Submodule level 127
     VAR_result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1277_c7_0431_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1276_c7_94f5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_cond;
     result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_return_output := result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_return_output;

     -- Submodule level 128
     VAR_result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1276_c7_94f5_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1275_c7_e09a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_cond;
     result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_return_output := result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_return_output;

     -- Submodule level 129
     VAR_result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1275_c7_e09a_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1274_c7_cf60] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_cond;
     result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_return_output := result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_return_output;

     -- Submodule level 130
     VAR_result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1274_c7_cf60_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1273_c7_63d4] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_cond;
     result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_return_output := result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_return_output;

     -- Submodule level 131
     VAR_result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1273_c7_63d4_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1272_c7_ea82] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_cond;
     result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_return_output := result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_return_output;

     -- Submodule level 132
     VAR_result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1272_c7_ea82_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1271_c7_6e23] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_cond;
     result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_return_output := result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_return_output;

     -- Submodule level 133
     VAR_result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1271_c7_6e23_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1270_c7_ad71] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_cond;
     result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_return_output := result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_return_output;

     -- Submodule level 134
     VAR_result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1270_c7_ad71_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1269_c7_9a97] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_cond;
     result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_return_output := result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_return_output;

     -- Submodule level 135
     VAR_result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1269_c7_9a97_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1268_c7_523a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_cond;
     result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_return_output := result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_return_output;

     -- Submodule level 136
     VAR_result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1268_c7_523a_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1267_c7_04c1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_cond;
     result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_return_output := result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_return_output;

     -- Submodule level 137
     VAR_result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1267_c7_04c1_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1266_c7_589c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_cond;
     result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_return_output := result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_return_output;

     -- Submodule level 138
     VAR_result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1266_c7_589c_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1265_c7_dfb7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_cond;
     result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_return_output := result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_return_output;

     -- Submodule level 139
     VAR_result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l1265_c7_dfb7_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l1264_c2_41dd] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_cond;
     result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_iftrue;
     result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_return_output := result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_return_output;

     -- Submodule level 140
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l1264_c2_41dd_return_output;
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
