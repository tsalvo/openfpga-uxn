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
-- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_3d31]
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_1885]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1000_c2_8540]
signal result_MUX_uxn_opcodes_h_l1000_c2_8540_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_8540_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_8540_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1000_c2_8540_return_output : unsigned(0 downto 0);

-- opc_brk[uxn_opcodes_h_l1000_c34_01cb]
signal opc_brk_uxn_opcodes_h_l1000_c34_01cb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_bfad]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_34aa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_be83]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1001_c7_1885]
signal result_MUX_uxn_opcodes_h_l1001_c7_1885_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_1885_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_1885_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1001_c7_1885_return_output : unsigned(0 downto 0);

-- opc_jci[uxn_opcodes_h_l1001_c39_26ab]
signal opc_jci_uxn_opcodes_h_l1001_c39_26ab_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_26ab_stack_index : unsigned(0 downto 0);
signal opc_jci_uxn_opcodes_h_l1001_c39_26ab_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_4926]
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_d158]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_eca6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1002_c7_be83]
signal result_MUX_uxn_opcodes_h_l1002_c7_be83_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_be83_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_be83_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1002_c7_be83_return_output : unsigned(0 downto 0);

-- opc_jmi[uxn_opcodes_h_l1002_c39_2298]
signal opc_jmi_uxn_opcodes_h_l1002_c39_2298_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmi_uxn_opcodes_h_l1002_c39_2298_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_e1bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_3853]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_2cf7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1003_c7_eca6]
signal result_MUX_uxn_opcodes_h_l1003_c7_eca6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_eca6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_eca6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1003_c7_eca6_return_output : unsigned(0 downto 0);

-- opc_jsi[uxn_opcodes_h_l1003_c39_c391]
signal opc_jsi_uxn_opcodes_h_l1003_c39_c391_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_c391_ins : unsigned(7 downto 0);
signal opc_jsi_uxn_opcodes_h_l1003_c39_c391_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_62ea]
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_693b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_9dda]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1004_c7_2cf7]
signal result_MUX_uxn_opcodes_h_l1004_c7_2cf7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_2cf7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_2cf7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1004_c7_2cf7_return_output : unsigned(0 downto 0);

-- opc_lit[uxn_opcodes_h_l1004_c39_ead2]
signal opc_lit_uxn_opcodes_h_l1004_c39_ead2_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_ead2_stack_index : unsigned(0 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_ead2_ins : unsigned(7 downto 0);
signal opc_lit_uxn_opcodes_h_l1004_c39_ead2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_1e28]
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_0cda]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_c47e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1005_c7_9dda]
signal result_MUX_uxn_opcodes_h_l1005_c7_9dda_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_9dda_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_9dda_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1005_c7_9dda_return_output : unsigned(0 downto 0);

-- opc_lit2[uxn_opcodes_h_l1005_c39_f328]
signal opc_lit2_uxn_opcodes_h_l1005_c39_f328_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_f328_stack_index : unsigned(0 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_f328_ins : unsigned(7 downto 0);
signal opc_lit2_uxn_opcodes_h_l1005_c39_f328_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_40d6]
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_fcd5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_73e5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1006_c7_c47e]
signal result_MUX_uxn_opcodes_h_l1006_c7_c47e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_c47e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_c47e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1006_c7_c47e_return_output : unsigned(0 downto 0);

-- opc_litr[uxn_opcodes_h_l1006_c39_18ec]
signal opc_litr_uxn_opcodes_h_l1006_c39_18ec_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_18ec_stack_index : unsigned(0 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_18ec_ins : unsigned(7 downto 0);
signal opc_litr_uxn_opcodes_h_l1006_c39_18ec_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_ae6d]
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_bbc3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_0a41]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1007_c7_73e5]
signal result_MUX_uxn_opcodes_h_l1007_c7_73e5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_73e5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_73e5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1007_c7_73e5_return_output : unsigned(0 downto 0);

-- opc_lit2r[uxn_opcodes_h_l1007_c39_4869]
signal opc_lit2r_uxn_opcodes_h_l1007_c39_4869_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_4869_stack_index : unsigned(0 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_4869_ins : unsigned(7 downto 0);
signal opc_lit2r_uxn_opcodes_h_l1007_c39_4869_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_b20c]
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_f73f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_91b4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1008_c7_0a41]
signal result_MUX_uxn_opcodes_h_l1008_c7_0a41_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_0a41_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_0a41_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1008_c7_0a41_return_output : unsigned(0 downto 0);

-- opc_inc[uxn_opcodes_h_l1008_c39_4c07]
signal opc_inc_uxn_opcodes_h_l1008_c39_4c07_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_4c07_stack_index : unsigned(0 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_4c07_ins : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_4c07_k : unsigned(7 downto 0);
signal opc_inc_uxn_opcodes_h_l1008_c39_4c07_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_f242]
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_d9d2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_696c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1009_c7_91b4]
signal result_MUX_uxn_opcodes_h_l1009_c7_91b4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_91b4_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_91b4_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1009_c7_91b4_return_output : unsigned(0 downto 0);

-- opc_inc2[uxn_opcodes_h_l1009_c39_60af]
signal opc_inc2_uxn_opcodes_h_l1009_c39_60af_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_60af_stack_index : unsigned(0 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_60af_ins : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_60af_k : unsigned(7 downto 0);
signal opc_inc2_uxn_opcodes_h_l1009_c39_60af_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_d552]
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_4e47]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_fcac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1010_c7_696c]
signal result_MUX_uxn_opcodes_h_l1010_c7_696c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_696c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_696c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1010_c7_696c_return_output : unsigned(0 downto 0);

-- opc_pop[uxn_opcodes_h_l1010_c39_3f3a]
signal opc_pop_uxn_opcodes_h_l1010_c39_3f3a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_3f3a_stack_index : unsigned(0 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_3f3a_ins : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_3f3a_k : unsigned(7 downto 0);
signal opc_pop_uxn_opcodes_h_l1010_c39_3f3a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_46dc]
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_913a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_6cc4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1011_c7_fcac]
signal result_MUX_uxn_opcodes_h_l1011_c7_fcac_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_fcac_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_fcac_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1011_c7_fcac_return_output : unsigned(0 downto 0);

-- opc_pop2[uxn_opcodes_h_l1011_c39_8140]
signal opc_pop2_uxn_opcodes_h_l1011_c39_8140_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_8140_stack_index : unsigned(0 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_8140_ins : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_8140_k : unsigned(7 downto 0);
signal opc_pop2_uxn_opcodes_h_l1011_c39_8140_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_79cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_8e84]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_c7d6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1012_c7_6cc4]
signal result_MUX_uxn_opcodes_h_l1012_c7_6cc4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_6cc4_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_6cc4_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1012_c7_6cc4_return_output : unsigned(0 downto 0);

-- opc_nip[uxn_opcodes_h_l1012_c39_7797]
signal opc_nip_uxn_opcodes_h_l1012_c39_7797_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_7797_stack_index : unsigned(0 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_7797_ins : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_7797_k : unsigned(7 downto 0);
signal opc_nip_uxn_opcodes_h_l1012_c39_7797_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_f111]
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_5b60]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_4fa7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1013_c7_c7d6]
signal result_MUX_uxn_opcodes_h_l1013_c7_c7d6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_c7d6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_c7d6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1013_c7_c7d6_return_output : unsigned(0 downto 0);

-- opc_nip2[uxn_opcodes_h_l1013_c39_a8cd]
signal opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_stack_index : unsigned(0 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_ins : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_k : unsigned(7 downto 0);
signal opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_d3ff]
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_f132]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_ef87]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1014_c7_4fa7]
signal result_MUX_uxn_opcodes_h_l1014_c7_4fa7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_4fa7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_4fa7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1014_c7_4fa7_return_output : unsigned(0 downto 0);

-- opc_swp[uxn_opcodes_h_l1014_c39_51e9]
signal opc_swp_uxn_opcodes_h_l1014_c39_51e9_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_51e9_stack_index : unsigned(0 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_51e9_ins : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_51e9_k : unsigned(7 downto 0);
signal opc_swp_uxn_opcodes_h_l1014_c39_51e9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_04f3]
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_f587]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_d7e0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1015_c7_ef87]
signal result_MUX_uxn_opcodes_h_l1015_c7_ef87_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_ef87_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_ef87_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1015_c7_ef87_return_output : unsigned(0 downto 0);

-- opc_swp2[uxn_opcodes_h_l1015_c39_6315]
signal opc_swp2_uxn_opcodes_h_l1015_c39_6315_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_6315_stack_index : unsigned(0 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_6315_ins : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_6315_k : unsigned(7 downto 0);
signal opc_swp2_uxn_opcodes_h_l1015_c39_6315_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_d0a8]
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_bf8e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_ea66]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1016_c7_d7e0]
signal result_MUX_uxn_opcodes_h_l1016_c7_d7e0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_d7e0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_d7e0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1016_c7_d7e0_return_output : unsigned(0 downto 0);

-- opc_rot[uxn_opcodes_h_l1016_c39_02bc]
signal opc_rot_uxn_opcodes_h_l1016_c39_02bc_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_02bc_stack_index : unsigned(0 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_02bc_ins : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_02bc_k : unsigned(7 downto 0);
signal opc_rot_uxn_opcodes_h_l1016_c39_02bc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_4b22]
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_fec1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_bf6e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1017_c7_ea66]
signal result_MUX_uxn_opcodes_h_l1017_c7_ea66_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_ea66_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_ea66_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1017_c7_ea66_return_output : unsigned(0 downto 0);

-- opc_rot2[uxn_opcodes_h_l1017_c39_1d9d]
signal opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_stack_index : unsigned(0 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_ins : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_k : unsigned(7 downto 0);
signal opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_3358]
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_b966]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_3cd7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1018_c7_bf6e]
signal result_MUX_uxn_opcodes_h_l1018_c7_bf6e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_bf6e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_bf6e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1018_c7_bf6e_return_output : unsigned(0 downto 0);

-- opc_dup[uxn_opcodes_h_l1018_c39_441c]
signal opc_dup_uxn_opcodes_h_l1018_c39_441c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_441c_stack_index : unsigned(0 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_441c_ins : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_441c_k : unsigned(7 downto 0);
signal opc_dup_uxn_opcodes_h_l1018_c39_441c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_1d94]
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_80ba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_8298]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1019_c7_3cd7]
signal result_MUX_uxn_opcodes_h_l1019_c7_3cd7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_3cd7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_3cd7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1019_c7_3cd7_return_output : unsigned(0 downto 0);

-- opc_dup2[uxn_opcodes_h_l1019_c39_bab0]
signal opc_dup2_uxn_opcodes_h_l1019_c39_bab0_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_bab0_stack_index : unsigned(0 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_bab0_ins : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_bab0_k : unsigned(7 downto 0);
signal opc_dup2_uxn_opcodes_h_l1019_c39_bab0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_9b5a]
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_527f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_5295]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1020_c7_8298]
signal result_MUX_uxn_opcodes_h_l1020_c7_8298_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_8298_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_8298_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1020_c7_8298_return_output : unsigned(0 downto 0);

-- opc_ovr[uxn_opcodes_h_l1020_c39_93cd]
signal opc_ovr_uxn_opcodes_h_l1020_c39_93cd_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_93cd_stack_index : unsigned(0 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_93cd_ins : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_93cd_k : unsigned(7 downto 0);
signal opc_ovr_uxn_opcodes_h_l1020_c39_93cd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_d375]
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_cb9e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_beb0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1021_c7_5295]
signal result_MUX_uxn_opcodes_h_l1021_c7_5295_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_5295_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_5295_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1021_c7_5295_return_output : unsigned(0 downto 0);

-- opc_ovr2[uxn_opcodes_h_l1021_c39_d0c0]
signal opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_stack_index : unsigned(0 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_ins : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_k : unsigned(7 downto 0);
signal opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_38a3]
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_0806]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_0752]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1022_c7_beb0]
signal result_MUX_uxn_opcodes_h_l1022_c7_beb0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_beb0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_beb0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1022_c7_beb0_return_output : unsigned(0 downto 0);

-- opc_equ[uxn_opcodes_h_l1022_c39_8e37]
signal opc_equ_uxn_opcodes_h_l1022_c39_8e37_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_8e37_stack_index : unsigned(0 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_8e37_ins : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_8e37_k : unsigned(7 downto 0);
signal opc_equ_uxn_opcodes_h_l1022_c39_8e37_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_6e93]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_46f8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_64f0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1023_c7_0752]
signal result_MUX_uxn_opcodes_h_l1023_c7_0752_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_0752_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_0752_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1023_c7_0752_return_output : unsigned(0 downto 0);

-- opc_equ2[uxn_opcodes_h_l1023_c39_cc9e]
signal opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_stack_index : unsigned(0 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_ins : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_k : unsigned(7 downto 0);
signal opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_d5fa]
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_8bfb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_1a90]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1024_c7_64f0]
signal result_MUX_uxn_opcodes_h_l1024_c7_64f0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_64f0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_64f0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1024_c7_64f0_return_output : unsigned(0 downto 0);

-- opc_neq[uxn_opcodes_h_l1024_c39_dce8]
signal opc_neq_uxn_opcodes_h_l1024_c39_dce8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_dce8_stack_index : unsigned(0 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_dce8_ins : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_dce8_k : unsigned(7 downto 0);
signal opc_neq_uxn_opcodes_h_l1024_c39_dce8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_1e90]
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_1933]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_25c1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1025_c7_1a90]
signal result_MUX_uxn_opcodes_h_l1025_c7_1a90_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_1a90_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_1a90_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1025_c7_1a90_return_output : unsigned(0 downto 0);

-- opc_neq2[uxn_opcodes_h_l1025_c39_a776]
signal opc_neq2_uxn_opcodes_h_l1025_c39_a776_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_a776_stack_index : unsigned(0 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_a776_ins : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_a776_k : unsigned(7 downto 0);
signal opc_neq2_uxn_opcodes_h_l1025_c39_a776_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_ae70]
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_ad0d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_b341]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1026_c7_25c1]
signal result_MUX_uxn_opcodes_h_l1026_c7_25c1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_25c1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_25c1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1026_c7_25c1_return_output : unsigned(0 downto 0);

-- opc_gth[uxn_opcodes_h_l1026_c39_64a6]
signal opc_gth_uxn_opcodes_h_l1026_c39_64a6_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_64a6_stack_index : unsigned(0 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_64a6_ins : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_64a6_k : unsigned(7 downto 0);
signal opc_gth_uxn_opcodes_h_l1026_c39_64a6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_725e]
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_6547]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_4a7c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1027_c7_b341]
signal result_MUX_uxn_opcodes_h_l1027_c7_b341_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_b341_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_b341_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1027_c7_b341_return_output : unsigned(0 downto 0);

-- opc_gth2[uxn_opcodes_h_l1027_c39_9c10]
signal opc_gth2_uxn_opcodes_h_l1027_c39_9c10_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_9c10_stack_index : unsigned(0 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_9c10_ins : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_9c10_k : unsigned(7 downto 0);
signal opc_gth2_uxn_opcodes_h_l1027_c39_9c10_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_32c2]
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_7f3b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_d249]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1028_c7_4a7c]
signal result_MUX_uxn_opcodes_h_l1028_c7_4a7c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_4a7c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_4a7c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1028_c7_4a7c_return_output : unsigned(0 downto 0);

-- opc_lth[uxn_opcodes_h_l1028_c39_4ca7]
signal opc_lth_uxn_opcodes_h_l1028_c39_4ca7_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_4ca7_stack_index : unsigned(0 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_4ca7_ins : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_4ca7_k : unsigned(7 downto 0);
signal opc_lth_uxn_opcodes_h_l1028_c39_4ca7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_ed05]
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_5b15]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_0216]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1029_c7_d249]
signal result_MUX_uxn_opcodes_h_l1029_c7_d249_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_d249_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_d249_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1029_c7_d249_return_output : unsigned(0 downto 0);

-- opc_lth2[uxn_opcodes_h_l1029_c39_fe53]
signal opc_lth2_uxn_opcodes_h_l1029_c39_fe53_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_fe53_stack_index : unsigned(0 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_fe53_ins : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_fe53_k : unsigned(7 downto 0);
signal opc_lth2_uxn_opcodes_h_l1029_c39_fe53_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_cd9e]
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_e405]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_d19b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1030_c7_0216]
signal result_MUX_uxn_opcodes_h_l1030_c7_0216_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_0216_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_0216_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1030_c7_0216_return_output : unsigned(0 downto 0);

-- opc_jmp[uxn_opcodes_h_l1030_c39_67d3]
signal opc_jmp_uxn_opcodes_h_l1030_c39_67d3_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_67d3_stack_index : unsigned(0 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_67d3_ins : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_67d3_k : unsigned(7 downto 0);
signal opc_jmp_uxn_opcodes_h_l1030_c39_67d3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_e99a]
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_0e69]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_7153]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1031_c7_d19b]
signal result_MUX_uxn_opcodes_h_l1031_c7_d19b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_d19b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_d19b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1031_c7_d19b_return_output : unsigned(0 downto 0);

-- opc_jmp2[uxn_opcodes_h_l1031_c39_2abe]
signal opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_stack_index : unsigned(0 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_ins : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_k : unsigned(7 downto 0);
signal opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_856f]
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_7014]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_4c65]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1032_c7_7153]
signal result_MUX_uxn_opcodes_h_l1032_c7_7153_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_7153_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_7153_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1032_c7_7153_return_output : unsigned(0 downto 0);

-- opc_jcn[uxn_opcodes_h_l1032_c39_faf8]
signal opc_jcn_uxn_opcodes_h_l1032_c39_faf8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_faf8_stack_index : unsigned(0 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_faf8_ins : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_faf8_k : unsigned(7 downto 0);
signal opc_jcn_uxn_opcodes_h_l1032_c39_faf8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_15ae]
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_99e0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_5ca3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1033_c7_4c65]
signal result_MUX_uxn_opcodes_h_l1033_c7_4c65_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_4c65_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_4c65_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1033_c7_4c65_return_output : unsigned(0 downto 0);

-- opc_jcn2[uxn_opcodes_h_l1033_c39_4666]
signal opc_jcn2_uxn_opcodes_h_l1033_c39_4666_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_4666_stack_index : unsigned(0 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_4666_ins : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_4666_k : unsigned(7 downto 0);
signal opc_jcn2_uxn_opcodes_h_l1033_c39_4666_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_26b7]
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_efac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_b08c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1034_c7_5ca3]
signal result_MUX_uxn_opcodes_h_l1034_c7_5ca3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_5ca3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_5ca3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1034_c7_5ca3_return_output : unsigned(0 downto 0);

-- opc_jsr[uxn_opcodes_h_l1034_c39_4d03]
signal opc_jsr_uxn_opcodes_h_l1034_c39_4d03_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_4d03_stack_index : unsigned(0 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_4d03_ins : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_4d03_k : unsigned(7 downto 0);
signal opc_jsr_uxn_opcodes_h_l1034_c39_4d03_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_0e18]
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_87b3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_86f7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1035_c7_b08c]
signal result_MUX_uxn_opcodes_h_l1035_c7_b08c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_b08c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_b08c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1035_c7_b08c_return_output : unsigned(0 downto 0);

-- opc_jsr2[uxn_opcodes_h_l1035_c39_1c11]
signal opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_stack_index : unsigned(0 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_ins : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_k : unsigned(7 downto 0);
signal opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_583a]
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_24cd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_8e53]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1036_c7_86f7]
signal result_MUX_uxn_opcodes_h_l1036_c7_86f7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_86f7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_86f7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1036_c7_86f7_return_output : unsigned(0 downto 0);

-- opc_sth[uxn_opcodes_h_l1036_c39_8e27]
signal opc_sth_uxn_opcodes_h_l1036_c39_8e27_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_8e27_stack_index : unsigned(0 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_8e27_ins : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_8e27_k : unsigned(7 downto 0);
signal opc_sth_uxn_opcodes_h_l1036_c39_8e27_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_6631]
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_6c4a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_0b30]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1037_c7_8e53]
signal result_MUX_uxn_opcodes_h_l1037_c7_8e53_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_8e53_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_8e53_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1037_c7_8e53_return_output : unsigned(0 downto 0);

-- opc_sth2[uxn_opcodes_h_l1037_c39_3a9f]
signal opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_stack_index : unsigned(0 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_ins : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_k : unsigned(7 downto 0);
signal opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_29df]
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_7c10]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_65ef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1038_c7_0b30]
signal result_MUX_uxn_opcodes_h_l1038_c7_0b30_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_0b30_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_0b30_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1038_c7_0b30_return_output : unsigned(0 downto 0);

-- opc_ldz[uxn_opcodes_h_l1038_c39_09a7]
signal opc_ldz_uxn_opcodes_h_l1038_c39_09a7_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_09a7_stack_index : unsigned(0 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_09a7_ins : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_09a7_k : unsigned(7 downto 0);
signal opc_ldz_uxn_opcodes_h_l1038_c39_09a7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_3d45]
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_eaf5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_48b9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1039_c7_65ef]
signal result_MUX_uxn_opcodes_h_l1039_c7_65ef_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_65ef_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_65ef_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1039_c7_65ef_return_output : unsigned(0 downto 0);

-- opc_ldz2[uxn_opcodes_h_l1039_c39_665b]
signal opc_ldz2_uxn_opcodes_h_l1039_c39_665b_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_665b_stack_index : unsigned(0 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_665b_ins : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_665b_k : unsigned(7 downto 0);
signal opc_ldz2_uxn_opcodes_h_l1039_c39_665b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_f766]
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_2956]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_bc80]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1040_c7_48b9]
signal result_MUX_uxn_opcodes_h_l1040_c7_48b9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_48b9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_48b9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1040_c7_48b9_return_output : unsigned(0 downto 0);

-- opc_stz[uxn_opcodes_h_l1040_c39_b81a]
signal opc_stz_uxn_opcodes_h_l1040_c39_b81a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_b81a_stack_index : unsigned(0 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_b81a_ins : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_b81a_k : unsigned(7 downto 0);
signal opc_stz_uxn_opcodes_h_l1040_c39_b81a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_07d5]
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_65c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_02cd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1041_c7_bc80]
signal result_MUX_uxn_opcodes_h_l1041_c7_bc80_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_bc80_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_bc80_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1041_c7_bc80_return_output : unsigned(0 downto 0);

-- opc_stz2[uxn_opcodes_h_l1041_c39_0297]
signal opc_stz2_uxn_opcodes_h_l1041_c39_0297_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_0297_stack_index : unsigned(0 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_0297_ins : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_0297_k : unsigned(7 downto 0);
signal opc_stz2_uxn_opcodes_h_l1041_c39_0297_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_05c2]
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_ad3e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_4389]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1042_c7_02cd]
signal result_MUX_uxn_opcodes_h_l1042_c7_02cd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_02cd_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_02cd_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1042_c7_02cd_return_output : unsigned(0 downto 0);

-- opc_ldr[uxn_opcodes_h_l1042_c39_fe4a]
signal opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_stack_index : unsigned(0 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_ins : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_k : unsigned(7 downto 0);
signal opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_c1b5]
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_64fd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_a467]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1043_c7_4389]
signal result_MUX_uxn_opcodes_h_l1043_c7_4389_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_4389_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_4389_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1043_c7_4389_return_output : unsigned(0 downto 0);

-- opc_ldr2[uxn_opcodes_h_l1043_c39_a66a]
signal opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_stack_index : unsigned(0 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_ins : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_k : unsigned(7 downto 0);
signal opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_2c92]
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_c42b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_995e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1044_c7_a467]
signal result_MUX_uxn_opcodes_h_l1044_c7_a467_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_a467_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_a467_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1044_c7_a467_return_output : unsigned(0 downto 0);

-- opc_str[uxn_opcodes_h_l1044_c39_8183]
signal opc_str_uxn_opcodes_h_l1044_c39_8183_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_8183_stack_index : unsigned(0 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_8183_ins : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_8183_k : unsigned(7 downto 0);
signal opc_str_uxn_opcodes_h_l1044_c39_8183_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_266e]
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_e5c0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_93a6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1045_c7_995e]
signal result_MUX_uxn_opcodes_h_l1045_c7_995e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_995e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_995e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1045_c7_995e_return_output : unsigned(0 downto 0);

-- opc_str2[uxn_opcodes_h_l1045_c39_ed64]
signal opc_str2_uxn_opcodes_h_l1045_c39_ed64_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_ed64_stack_index : unsigned(0 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_ed64_ins : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_ed64_k : unsigned(7 downto 0);
signal opc_str2_uxn_opcodes_h_l1045_c39_ed64_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_9ae5]
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_95f0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_aa2a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1046_c7_93a6]
signal result_MUX_uxn_opcodes_h_l1046_c7_93a6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_93a6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_93a6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1046_c7_93a6_return_output : unsigned(0 downto 0);

-- opc_lda[uxn_opcodes_h_l1046_c39_452f]
signal opc_lda_uxn_opcodes_h_l1046_c39_452f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_452f_stack_index : unsigned(0 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_452f_ins : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_452f_k : unsigned(7 downto 0);
signal opc_lda_uxn_opcodes_h_l1046_c39_452f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_f730]
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_b057]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_c21d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1047_c7_aa2a]
signal result_MUX_uxn_opcodes_h_l1047_c7_aa2a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_aa2a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_aa2a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1047_c7_aa2a_return_output : unsigned(0 downto 0);

-- opc_lda2[uxn_opcodes_h_l1047_c39_822f]
signal opc_lda2_uxn_opcodes_h_l1047_c39_822f_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_822f_stack_index : unsigned(0 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_822f_ins : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_822f_k : unsigned(7 downto 0);
signal opc_lda2_uxn_opcodes_h_l1047_c39_822f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_ff96]
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_85eb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_0b4b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1048_c7_c21d]
signal result_MUX_uxn_opcodes_h_l1048_c7_c21d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_c21d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_c21d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1048_c7_c21d_return_output : unsigned(0 downto 0);

-- opc_sta[uxn_opcodes_h_l1048_c39_6e12]
signal opc_sta_uxn_opcodes_h_l1048_c39_6e12_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_6e12_stack_index : unsigned(0 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_6e12_ins : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_6e12_k : unsigned(7 downto 0);
signal opc_sta_uxn_opcodes_h_l1048_c39_6e12_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_5f3c]
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_b110]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_8923]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1049_c7_0b4b]
signal result_MUX_uxn_opcodes_h_l1049_c7_0b4b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_0b4b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_0b4b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1049_c7_0b4b_return_output : unsigned(0 downto 0);

-- opc_sta2[uxn_opcodes_h_l1049_c39_c880]
signal opc_sta2_uxn_opcodes_h_l1049_c39_c880_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_c880_stack_index : unsigned(0 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_c880_ins : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_c880_k : unsigned(7 downto 0);
signal opc_sta2_uxn_opcodes_h_l1049_c39_c880_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_e685]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_295b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_be74]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1050_c7_8923]
signal result_MUX_uxn_opcodes_h_l1050_c7_8923_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_8923_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_8923_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1050_c7_8923_return_output : unsigned(0 downto 0);

-- opc_dei[uxn_opcodes_h_l1050_c39_5bc3]
signal opc_dei_uxn_opcodes_h_l1050_c39_5bc3_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_5bc3_stack_index : unsigned(0 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_5bc3_ins : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_5bc3_k : unsigned(7 downto 0);
signal opc_dei_uxn_opcodes_h_l1050_c39_5bc3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_046f]
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_a3b5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_6093]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1051_c7_be74]
signal result_MUX_uxn_opcodes_h_l1051_c7_be74_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_be74_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_be74_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1051_c7_be74_return_output : unsigned(0 downto 0);

-- opc_dei2[uxn_opcodes_h_l1051_c39_1396]
signal opc_dei2_uxn_opcodes_h_l1051_c39_1396_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_1396_stack_index : unsigned(0 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_1396_ins : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_1396_k : unsigned(7 downto 0);
signal opc_dei2_uxn_opcodes_h_l1051_c39_1396_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_3aa7]
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_a9ab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_6eeb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1052_c7_6093]
signal result_MUX_uxn_opcodes_h_l1052_c7_6093_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_6093_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_6093_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1052_c7_6093_return_output : unsigned(0 downto 0);

-- opc_deo[uxn_opcodes_h_l1052_c39_7c09]
signal opc_deo_uxn_opcodes_h_l1052_c39_7c09_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_7c09_stack_index : unsigned(0 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_7c09_ins : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_7c09_k : unsigned(7 downto 0);
signal opc_deo_uxn_opcodes_h_l1052_c39_7c09_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_729c]
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_b939]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_1711]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1053_c7_6eeb]
signal result_MUX_uxn_opcodes_h_l1053_c7_6eeb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_6eeb_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_6eeb_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1053_c7_6eeb_return_output : unsigned(0 downto 0);

-- opc_deo2[uxn_opcodes_h_l1053_c39_d550]
signal opc_deo2_uxn_opcodes_h_l1053_c39_d550_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_d550_stack_index : unsigned(0 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_d550_ins : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_d550_k : unsigned(7 downto 0);
signal opc_deo2_uxn_opcodes_h_l1053_c39_d550_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_ddf4]
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_5536]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_2713]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1054_c7_1711]
signal result_MUX_uxn_opcodes_h_l1054_c7_1711_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_1711_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_1711_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1054_c7_1711_return_output : unsigned(0 downto 0);

-- opc_add[uxn_opcodes_h_l1054_c39_13bf]
signal opc_add_uxn_opcodes_h_l1054_c39_13bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_13bf_stack_index : unsigned(0 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_13bf_ins : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_13bf_k : unsigned(7 downto 0);
signal opc_add_uxn_opcodes_h_l1054_c39_13bf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_516e]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_b812]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_2b10]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1055_c7_2713]
signal result_MUX_uxn_opcodes_h_l1055_c7_2713_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_2713_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_2713_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1055_c7_2713_return_output : unsigned(0 downto 0);

-- opc_add2[uxn_opcodes_h_l1055_c39_ed35]
signal opc_add2_uxn_opcodes_h_l1055_c39_ed35_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_ed35_stack_index : unsigned(0 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_ed35_ins : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_ed35_k : unsigned(7 downto 0);
signal opc_add2_uxn_opcodes_h_l1055_c39_ed35_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_3183]
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_2807]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_fb69]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1056_c7_2b10]
signal result_MUX_uxn_opcodes_h_l1056_c7_2b10_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_2b10_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_2b10_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1056_c7_2b10_return_output : unsigned(0 downto 0);

-- opc_sub[uxn_opcodes_h_l1056_c39_0fdc]
signal opc_sub_uxn_opcodes_h_l1056_c39_0fdc_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_0fdc_stack_index : unsigned(0 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_0fdc_ins : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_0fdc_k : unsigned(7 downto 0);
signal opc_sub_uxn_opcodes_h_l1056_c39_0fdc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_6182]
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_3c34]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_13da]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1057_c7_fb69]
signal result_MUX_uxn_opcodes_h_l1057_c7_fb69_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_fb69_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_fb69_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1057_c7_fb69_return_output : unsigned(0 downto 0);

-- opc_sub2[uxn_opcodes_h_l1057_c39_343c]
signal opc_sub2_uxn_opcodes_h_l1057_c39_343c_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_343c_stack_index : unsigned(0 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_343c_ins : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_343c_k : unsigned(7 downto 0);
signal opc_sub2_uxn_opcodes_h_l1057_c39_343c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_9def]
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_4598]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_217b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1058_c7_13da]
signal result_MUX_uxn_opcodes_h_l1058_c7_13da_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_13da_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_13da_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1058_c7_13da_return_output : unsigned(0 downto 0);

-- opc_mul[uxn_opcodes_h_l1058_c39_1069]
signal opc_mul_uxn_opcodes_h_l1058_c39_1069_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_1069_stack_index : unsigned(0 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_1069_ins : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_1069_k : unsigned(7 downto 0);
signal opc_mul_uxn_opcodes_h_l1058_c39_1069_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_b132]
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_c359]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_e8ea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1059_c7_217b]
signal result_MUX_uxn_opcodes_h_l1059_c7_217b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_217b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_217b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1059_c7_217b_return_output : unsigned(0 downto 0);

-- opc_mul2[uxn_opcodes_h_l1059_c39_f5d8]
signal opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_stack_index : unsigned(0 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_ins : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_k : unsigned(7 downto 0);
signal opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_f458]
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_40b5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_7d68]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1060_c7_e8ea]
signal result_MUX_uxn_opcodes_h_l1060_c7_e8ea_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_e8ea_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_e8ea_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1060_c7_e8ea_return_output : unsigned(0 downto 0);

-- opc_div[uxn_opcodes_h_l1060_c39_c275]
signal opc_div_uxn_opcodes_h_l1060_c39_c275_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_c275_stack_index : unsigned(0 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_c275_ins : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_c275_k : unsigned(7 downto 0);
signal opc_div_uxn_opcodes_h_l1060_c39_c275_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_3bd0]
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_dc35]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_014d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1061_c7_7d68]
signal result_MUX_uxn_opcodes_h_l1061_c7_7d68_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_7d68_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_7d68_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1061_c7_7d68_return_output : unsigned(0 downto 0);

-- opc_div2[uxn_opcodes_h_l1061_c39_fc84]
signal opc_div2_uxn_opcodes_h_l1061_c39_fc84_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_fc84_stack_index : unsigned(0 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_fc84_ins : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_fc84_k : unsigned(7 downto 0);
signal opc_div2_uxn_opcodes_h_l1061_c39_fc84_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_92c6]
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_6e0a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_6031]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1062_c7_014d]
signal result_MUX_uxn_opcodes_h_l1062_c7_014d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_014d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_014d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1062_c7_014d_return_output : unsigned(0 downto 0);

-- opc_and[uxn_opcodes_h_l1062_c39_5672]
signal opc_and_uxn_opcodes_h_l1062_c39_5672_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_5672_stack_index : unsigned(0 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_5672_ins : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_5672_k : unsigned(7 downto 0);
signal opc_and_uxn_opcodes_h_l1062_c39_5672_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_8728]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_c2ff]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_8a1f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1063_c7_6031]
signal result_MUX_uxn_opcodes_h_l1063_c7_6031_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_6031_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_6031_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1063_c7_6031_return_output : unsigned(0 downto 0);

-- opc_and2[uxn_opcodes_h_l1063_c39_af79]
signal opc_and2_uxn_opcodes_h_l1063_c39_af79_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_af79_stack_index : unsigned(0 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_af79_ins : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_af79_k : unsigned(7 downto 0);
signal opc_and2_uxn_opcodes_h_l1063_c39_af79_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_e752]
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_09c9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_8781]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1064_c7_8a1f]
signal result_MUX_uxn_opcodes_h_l1064_c7_8a1f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_8a1f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_8a1f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1064_c7_8a1f_return_output : unsigned(0 downto 0);

-- opc_ora[uxn_opcodes_h_l1064_c39_35e4]
signal opc_ora_uxn_opcodes_h_l1064_c39_35e4_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_35e4_stack_index : unsigned(0 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_35e4_ins : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_35e4_k : unsigned(7 downto 0);
signal opc_ora_uxn_opcodes_h_l1064_c39_35e4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_2ad4]
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_8baf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_fd47]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1065_c7_8781]
signal result_MUX_uxn_opcodes_h_l1065_c7_8781_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_8781_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_8781_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1065_c7_8781_return_output : unsigned(0 downto 0);

-- opc_ora2[uxn_opcodes_h_l1065_c39_2dd8]
signal opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_stack_index : unsigned(0 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_ins : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_k : unsigned(7 downto 0);
signal opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_38c8]
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_ee57]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_44a7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1066_c7_fd47]
signal result_MUX_uxn_opcodes_h_l1066_c7_fd47_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_fd47_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_fd47_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1066_c7_fd47_return_output : unsigned(0 downto 0);

-- opc_eor[uxn_opcodes_h_l1066_c39_7c54]
signal opc_eor_uxn_opcodes_h_l1066_c39_7c54_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_7c54_stack_index : unsigned(0 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_7c54_ins : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_7c54_k : unsigned(7 downto 0);
signal opc_eor_uxn_opcodes_h_l1066_c39_7c54_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_0666]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_0bf1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_c06f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1067_c7_44a7]
signal result_MUX_uxn_opcodes_h_l1067_c7_44a7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_44a7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_44a7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1067_c7_44a7_return_output : unsigned(0 downto 0);

-- opc_eor2[uxn_opcodes_h_l1067_c39_9be1]
signal opc_eor2_uxn_opcodes_h_l1067_c39_9be1_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_9be1_stack_index : unsigned(0 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_9be1_ins : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_9be1_k : unsigned(7 downto 0);
signal opc_eor2_uxn_opcodes_h_l1067_c39_9be1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_fafd]
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_d9b5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_07ce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1068_c7_c06f]
signal result_MUX_uxn_opcodes_h_l1068_c7_c06f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_c06f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_c06f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1068_c7_c06f_return_output : unsigned(0 downto 0);

-- opc_sft[uxn_opcodes_h_l1068_c39_1754]
signal opc_sft_uxn_opcodes_h_l1068_c39_1754_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_1754_stack_index : unsigned(0 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_1754_ins : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_1754_k : unsigned(7 downto 0);
signal opc_sft_uxn_opcodes_h_l1068_c39_1754_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_3a92]
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_5e72]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l1069_c7_07ce]
signal result_MUX_uxn_opcodes_h_l1069_c7_07ce_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_07ce_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_07ce_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l1069_c7_07ce_return_output : unsigned(0 downto 0);

-- opc_sft2[uxn_opcodes_h_l1069_c39_fea1]
signal opc_sft2_uxn_opcodes_h_l1069_c39_fea1_CLOCK_ENABLE : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_fea1_stack_index : unsigned(0 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_fea1_ins : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_fea1_k : unsigned(7 downto 0);
signal opc_sft2_uxn_opcodes_h_l1069_c39_fea1_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_left,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_right,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_return_output);

-- result_MUX_uxn_opcodes_h_l1000_c2_8540
result_MUX_uxn_opcodes_h_l1000_c2_8540 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1000_c2_8540_cond,
result_MUX_uxn_opcodes_h_l1000_c2_8540_iftrue,
result_MUX_uxn_opcodes_h_l1000_c2_8540_iffalse,
result_MUX_uxn_opcodes_h_l1000_c2_8540_return_output);

-- opc_brk_uxn_opcodes_h_l1000_c34_01cb
opc_brk_uxn_opcodes_h_l1000_c34_01cb : entity work.opc_brk_0CLK_de264c78 port map (
opc_brk_uxn_opcodes_h_l1000_c34_01cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_return_output);

-- result_MUX_uxn_opcodes_h_l1001_c7_1885
result_MUX_uxn_opcodes_h_l1001_c7_1885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1001_c7_1885_cond,
result_MUX_uxn_opcodes_h_l1001_c7_1885_iftrue,
result_MUX_uxn_opcodes_h_l1001_c7_1885_iffalse,
result_MUX_uxn_opcodes_h_l1001_c7_1885_return_output);

-- opc_jci_uxn_opcodes_h_l1001_c39_26ab
opc_jci_uxn_opcodes_h_l1001_c39_26ab : entity work.opc_jci_0CLK_4c4669f6 port map (
clk,
opc_jci_uxn_opcodes_h_l1001_c39_26ab_CLOCK_ENABLE,
opc_jci_uxn_opcodes_h_l1001_c39_26ab_stack_index,
opc_jci_uxn_opcodes_h_l1001_c39_26ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_left,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_right,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_return_output);

-- result_MUX_uxn_opcodes_h_l1002_c7_be83
result_MUX_uxn_opcodes_h_l1002_c7_be83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1002_c7_be83_cond,
result_MUX_uxn_opcodes_h_l1002_c7_be83_iftrue,
result_MUX_uxn_opcodes_h_l1002_c7_be83_iffalse,
result_MUX_uxn_opcodes_h_l1002_c7_be83_return_output);

-- opc_jmi_uxn_opcodes_h_l1002_c39_2298
opc_jmi_uxn_opcodes_h_l1002_c39_2298 : entity work.opc_jmi_0CLK_dd82b7a2 port map (
clk,
opc_jmi_uxn_opcodes_h_l1002_c39_2298_CLOCK_ENABLE,
opc_jmi_uxn_opcodes_h_l1002_c39_2298_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_return_output);

-- result_MUX_uxn_opcodes_h_l1003_c7_eca6
result_MUX_uxn_opcodes_h_l1003_c7_eca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1003_c7_eca6_cond,
result_MUX_uxn_opcodes_h_l1003_c7_eca6_iftrue,
result_MUX_uxn_opcodes_h_l1003_c7_eca6_iffalse,
result_MUX_uxn_opcodes_h_l1003_c7_eca6_return_output);

-- opc_jsi_uxn_opcodes_h_l1003_c39_c391
opc_jsi_uxn_opcodes_h_l1003_c39_c391 : entity work.opc_jsi_0CLK_0a77da6f port map (
clk,
opc_jsi_uxn_opcodes_h_l1003_c39_c391_CLOCK_ENABLE,
opc_jsi_uxn_opcodes_h_l1003_c39_c391_ins,
opc_jsi_uxn_opcodes_h_l1003_c39_c391_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_left,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_right,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_return_output);

-- result_MUX_uxn_opcodes_h_l1004_c7_2cf7
result_MUX_uxn_opcodes_h_l1004_c7_2cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1004_c7_2cf7_cond,
result_MUX_uxn_opcodes_h_l1004_c7_2cf7_iftrue,
result_MUX_uxn_opcodes_h_l1004_c7_2cf7_iffalse,
result_MUX_uxn_opcodes_h_l1004_c7_2cf7_return_output);

-- opc_lit_uxn_opcodes_h_l1004_c39_ead2
opc_lit_uxn_opcodes_h_l1004_c39_ead2 : entity work.opc_lit_0CLK_fb192e55 port map (
clk,
opc_lit_uxn_opcodes_h_l1004_c39_ead2_CLOCK_ENABLE,
opc_lit_uxn_opcodes_h_l1004_c39_ead2_stack_index,
opc_lit_uxn_opcodes_h_l1004_c39_ead2_ins,
opc_lit_uxn_opcodes_h_l1004_c39_ead2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_left,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_right,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_return_output);

-- result_MUX_uxn_opcodes_h_l1005_c7_9dda
result_MUX_uxn_opcodes_h_l1005_c7_9dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1005_c7_9dda_cond,
result_MUX_uxn_opcodes_h_l1005_c7_9dda_iftrue,
result_MUX_uxn_opcodes_h_l1005_c7_9dda_iffalse,
result_MUX_uxn_opcodes_h_l1005_c7_9dda_return_output);

-- opc_lit2_uxn_opcodes_h_l1005_c39_f328
opc_lit2_uxn_opcodes_h_l1005_c39_f328 : entity work.opc_lit2_0CLK_3aa2ab20 port map (
clk,
opc_lit2_uxn_opcodes_h_l1005_c39_f328_CLOCK_ENABLE,
opc_lit2_uxn_opcodes_h_l1005_c39_f328_stack_index,
opc_lit2_uxn_opcodes_h_l1005_c39_f328_ins,
opc_lit2_uxn_opcodes_h_l1005_c39_f328_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_left,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_right,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_return_output);

-- result_MUX_uxn_opcodes_h_l1006_c7_c47e
result_MUX_uxn_opcodes_h_l1006_c7_c47e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1006_c7_c47e_cond,
result_MUX_uxn_opcodes_h_l1006_c7_c47e_iftrue,
result_MUX_uxn_opcodes_h_l1006_c7_c47e_iffalse,
result_MUX_uxn_opcodes_h_l1006_c7_c47e_return_output);

-- opc_litr_uxn_opcodes_h_l1006_c39_18ec
opc_litr_uxn_opcodes_h_l1006_c39_18ec : entity work.opc_litr_0CLK_fb192e55 port map (
clk,
opc_litr_uxn_opcodes_h_l1006_c39_18ec_CLOCK_ENABLE,
opc_litr_uxn_opcodes_h_l1006_c39_18ec_stack_index,
opc_litr_uxn_opcodes_h_l1006_c39_18ec_ins,
opc_litr_uxn_opcodes_h_l1006_c39_18ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_left,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_right,
BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_return_output);

-- result_MUX_uxn_opcodes_h_l1007_c7_73e5
result_MUX_uxn_opcodes_h_l1007_c7_73e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1007_c7_73e5_cond,
result_MUX_uxn_opcodes_h_l1007_c7_73e5_iftrue,
result_MUX_uxn_opcodes_h_l1007_c7_73e5_iffalse,
result_MUX_uxn_opcodes_h_l1007_c7_73e5_return_output);

-- opc_lit2r_uxn_opcodes_h_l1007_c39_4869
opc_lit2r_uxn_opcodes_h_l1007_c39_4869 : entity work.opc_lit2r_0CLK_3aa2ab20 port map (
clk,
opc_lit2r_uxn_opcodes_h_l1007_c39_4869_CLOCK_ENABLE,
opc_lit2r_uxn_opcodes_h_l1007_c39_4869_stack_index,
opc_lit2r_uxn_opcodes_h_l1007_c39_4869_ins,
opc_lit2r_uxn_opcodes_h_l1007_c39_4869_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_left,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_right,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_return_output);

-- result_MUX_uxn_opcodes_h_l1008_c7_0a41
result_MUX_uxn_opcodes_h_l1008_c7_0a41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1008_c7_0a41_cond,
result_MUX_uxn_opcodes_h_l1008_c7_0a41_iftrue,
result_MUX_uxn_opcodes_h_l1008_c7_0a41_iffalse,
result_MUX_uxn_opcodes_h_l1008_c7_0a41_return_output);

-- opc_inc_uxn_opcodes_h_l1008_c39_4c07
opc_inc_uxn_opcodes_h_l1008_c39_4c07 : entity work.opc_inc_0CLK_d6df7042 port map (
clk,
opc_inc_uxn_opcodes_h_l1008_c39_4c07_CLOCK_ENABLE,
opc_inc_uxn_opcodes_h_l1008_c39_4c07_stack_index,
opc_inc_uxn_opcodes_h_l1008_c39_4c07_ins,
opc_inc_uxn_opcodes_h_l1008_c39_4c07_k,
opc_inc_uxn_opcodes_h_l1008_c39_4c07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_left,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_right,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_return_output);

-- result_MUX_uxn_opcodes_h_l1009_c7_91b4
result_MUX_uxn_opcodes_h_l1009_c7_91b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1009_c7_91b4_cond,
result_MUX_uxn_opcodes_h_l1009_c7_91b4_iftrue,
result_MUX_uxn_opcodes_h_l1009_c7_91b4_iffalse,
result_MUX_uxn_opcodes_h_l1009_c7_91b4_return_output);

-- opc_inc2_uxn_opcodes_h_l1009_c39_60af
opc_inc2_uxn_opcodes_h_l1009_c39_60af : entity work.opc_inc2_0CLK_ab649236 port map (
clk,
opc_inc2_uxn_opcodes_h_l1009_c39_60af_CLOCK_ENABLE,
opc_inc2_uxn_opcodes_h_l1009_c39_60af_stack_index,
opc_inc2_uxn_opcodes_h_l1009_c39_60af_ins,
opc_inc2_uxn_opcodes_h_l1009_c39_60af_k,
opc_inc2_uxn_opcodes_h_l1009_c39_60af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_left,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_right,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_return_output);

-- result_MUX_uxn_opcodes_h_l1010_c7_696c
result_MUX_uxn_opcodes_h_l1010_c7_696c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1010_c7_696c_cond,
result_MUX_uxn_opcodes_h_l1010_c7_696c_iftrue,
result_MUX_uxn_opcodes_h_l1010_c7_696c_iffalse,
result_MUX_uxn_opcodes_h_l1010_c7_696c_return_output);

-- opc_pop_uxn_opcodes_h_l1010_c39_3f3a
opc_pop_uxn_opcodes_h_l1010_c39_3f3a : entity work.opc_pop_0CLK_dffed988 port map (
clk,
opc_pop_uxn_opcodes_h_l1010_c39_3f3a_CLOCK_ENABLE,
opc_pop_uxn_opcodes_h_l1010_c39_3f3a_stack_index,
opc_pop_uxn_opcodes_h_l1010_c39_3f3a_ins,
opc_pop_uxn_opcodes_h_l1010_c39_3f3a_k,
opc_pop_uxn_opcodes_h_l1010_c39_3f3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_left,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_right,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_return_output);

-- result_MUX_uxn_opcodes_h_l1011_c7_fcac
result_MUX_uxn_opcodes_h_l1011_c7_fcac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1011_c7_fcac_cond,
result_MUX_uxn_opcodes_h_l1011_c7_fcac_iftrue,
result_MUX_uxn_opcodes_h_l1011_c7_fcac_iffalse,
result_MUX_uxn_opcodes_h_l1011_c7_fcac_return_output);

-- opc_pop2_uxn_opcodes_h_l1011_c39_8140
opc_pop2_uxn_opcodes_h_l1011_c39_8140 : entity work.opc_pop2_0CLK_dffed988 port map (
clk,
opc_pop2_uxn_opcodes_h_l1011_c39_8140_CLOCK_ENABLE,
opc_pop2_uxn_opcodes_h_l1011_c39_8140_stack_index,
opc_pop2_uxn_opcodes_h_l1011_c39_8140_ins,
opc_pop2_uxn_opcodes_h_l1011_c39_8140_k,
opc_pop2_uxn_opcodes_h_l1011_c39_8140_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_return_output);

-- result_MUX_uxn_opcodes_h_l1012_c7_6cc4
result_MUX_uxn_opcodes_h_l1012_c7_6cc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1012_c7_6cc4_cond,
result_MUX_uxn_opcodes_h_l1012_c7_6cc4_iftrue,
result_MUX_uxn_opcodes_h_l1012_c7_6cc4_iffalse,
result_MUX_uxn_opcodes_h_l1012_c7_6cc4_return_output);

-- opc_nip_uxn_opcodes_h_l1012_c39_7797
opc_nip_uxn_opcodes_h_l1012_c39_7797 : entity work.opc_nip_0CLK_eee12f66 port map (
clk,
opc_nip_uxn_opcodes_h_l1012_c39_7797_CLOCK_ENABLE,
opc_nip_uxn_opcodes_h_l1012_c39_7797_stack_index,
opc_nip_uxn_opcodes_h_l1012_c39_7797_ins,
opc_nip_uxn_opcodes_h_l1012_c39_7797_k,
opc_nip_uxn_opcodes_h_l1012_c39_7797_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_left,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_right,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_return_output);

-- result_MUX_uxn_opcodes_h_l1013_c7_c7d6
result_MUX_uxn_opcodes_h_l1013_c7_c7d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1013_c7_c7d6_cond,
result_MUX_uxn_opcodes_h_l1013_c7_c7d6_iftrue,
result_MUX_uxn_opcodes_h_l1013_c7_c7d6_iffalse,
result_MUX_uxn_opcodes_h_l1013_c7_c7d6_return_output);

-- opc_nip2_uxn_opcodes_h_l1013_c39_a8cd
opc_nip2_uxn_opcodes_h_l1013_c39_a8cd : entity work.opc_nip2_0CLK_595bc5ba port map (
clk,
opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_CLOCK_ENABLE,
opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_stack_index,
opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_ins,
opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_k,
opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_left,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_right,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_return_output);

-- result_MUX_uxn_opcodes_h_l1014_c7_4fa7
result_MUX_uxn_opcodes_h_l1014_c7_4fa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1014_c7_4fa7_cond,
result_MUX_uxn_opcodes_h_l1014_c7_4fa7_iftrue,
result_MUX_uxn_opcodes_h_l1014_c7_4fa7_iffalse,
result_MUX_uxn_opcodes_h_l1014_c7_4fa7_return_output);

-- opc_swp_uxn_opcodes_h_l1014_c39_51e9
opc_swp_uxn_opcodes_h_l1014_c39_51e9 : entity work.opc_swp_0CLK_8b182ca9 port map (
clk,
opc_swp_uxn_opcodes_h_l1014_c39_51e9_CLOCK_ENABLE,
opc_swp_uxn_opcodes_h_l1014_c39_51e9_stack_index,
opc_swp_uxn_opcodes_h_l1014_c39_51e9_ins,
opc_swp_uxn_opcodes_h_l1014_c39_51e9_k,
opc_swp_uxn_opcodes_h_l1014_c39_51e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_left,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_right,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_return_output);

-- result_MUX_uxn_opcodes_h_l1015_c7_ef87
result_MUX_uxn_opcodes_h_l1015_c7_ef87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1015_c7_ef87_cond,
result_MUX_uxn_opcodes_h_l1015_c7_ef87_iftrue,
result_MUX_uxn_opcodes_h_l1015_c7_ef87_iffalse,
result_MUX_uxn_opcodes_h_l1015_c7_ef87_return_output);

-- opc_swp2_uxn_opcodes_h_l1015_c39_6315
opc_swp2_uxn_opcodes_h_l1015_c39_6315 : entity work.opc_swp2_0CLK_1cf85e9c port map (
clk,
opc_swp2_uxn_opcodes_h_l1015_c39_6315_CLOCK_ENABLE,
opc_swp2_uxn_opcodes_h_l1015_c39_6315_stack_index,
opc_swp2_uxn_opcodes_h_l1015_c39_6315_ins,
opc_swp2_uxn_opcodes_h_l1015_c39_6315_k,
opc_swp2_uxn_opcodes_h_l1015_c39_6315_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_left,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_right,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_return_output);

-- result_MUX_uxn_opcodes_h_l1016_c7_d7e0
result_MUX_uxn_opcodes_h_l1016_c7_d7e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1016_c7_d7e0_cond,
result_MUX_uxn_opcodes_h_l1016_c7_d7e0_iftrue,
result_MUX_uxn_opcodes_h_l1016_c7_d7e0_iffalse,
result_MUX_uxn_opcodes_h_l1016_c7_d7e0_return_output);

-- opc_rot_uxn_opcodes_h_l1016_c39_02bc
opc_rot_uxn_opcodes_h_l1016_c39_02bc : entity work.opc_rot_0CLK_4850ef50 port map (
clk,
opc_rot_uxn_opcodes_h_l1016_c39_02bc_CLOCK_ENABLE,
opc_rot_uxn_opcodes_h_l1016_c39_02bc_stack_index,
opc_rot_uxn_opcodes_h_l1016_c39_02bc_ins,
opc_rot_uxn_opcodes_h_l1016_c39_02bc_k,
opc_rot_uxn_opcodes_h_l1016_c39_02bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_left,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_right,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_return_output);

-- result_MUX_uxn_opcodes_h_l1017_c7_ea66
result_MUX_uxn_opcodes_h_l1017_c7_ea66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1017_c7_ea66_cond,
result_MUX_uxn_opcodes_h_l1017_c7_ea66_iftrue,
result_MUX_uxn_opcodes_h_l1017_c7_ea66_iffalse,
result_MUX_uxn_opcodes_h_l1017_c7_ea66_return_output);

-- opc_rot2_uxn_opcodes_h_l1017_c39_1d9d
opc_rot2_uxn_opcodes_h_l1017_c39_1d9d : entity work.opc_rot2_0CLK_49c1023c port map (
clk,
opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_CLOCK_ENABLE,
opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_stack_index,
opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_ins,
opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_k,
opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_left,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_right,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_return_output);

-- result_MUX_uxn_opcodes_h_l1018_c7_bf6e
result_MUX_uxn_opcodes_h_l1018_c7_bf6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1018_c7_bf6e_cond,
result_MUX_uxn_opcodes_h_l1018_c7_bf6e_iftrue,
result_MUX_uxn_opcodes_h_l1018_c7_bf6e_iffalse,
result_MUX_uxn_opcodes_h_l1018_c7_bf6e_return_output);

-- opc_dup_uxn_opcodes_h_l1018_c39_441c
opc_dup_uxn_opcodes_h_l1018_c39_441c : entity work.opc_dup_0CLK_dd62d56e port map (
clk,
opc_dup_uxn_opcodes_h_l1018_c39_441c_CLOCK_ENABLE,
opc_dup_uxn_opcodes_h_l1018_c39_441c_stack_index,
opc_dup_uxn_opcodes_h_l1018_c39_441c_ins,
opc_dup_uxn_opcodes_h_l1018_c39_441c_k,
opc_dup_uxn_opcodes_h_l1018_c39_441c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_left,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_right,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_return_output);

-- result_MUX_uxn_opcodes_h_l1019_c7_3cd7
result_MUX_uxn_opcodes_h_l1019_c7_3cd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1019_c7_3cd7_cond,
result_MUX_uxn_opcodes_h_l1019_c7_3cd7_iftrue,
result_MUX_uxn_opcodes_h_l1019_c7_3cd7_iffalse,
result_MUX_uxn_opcodes_h_l1019_c7_3cd7_return_output);

-- opc_dup2_uxn_opcodes_h_l1019_c39_bab0
opc_dup2_uxn_opcodes_h_l1019_c39_bab0 : entity work.opc_dup2_0CLK_c8878770 port map (
clk,
opc_dup2_uxn_opcodes_h_l1019_c39_bab0_CLOCK_ENABLE,
opc_dup2_uxn_opcodes_h_l1019_c39_bab0_stack_index,
opc_dup2_uxn_opcodes_h_l1019_c39_bab0_ins,
opc_dup2_uxn_opcodes_h_l1019_c39_bab0_k,
opc_dup2_uxn_opcodes_h_l1019_c39_bab0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_left,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_right,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_return_output);

-- result_MUX_uxn_opcodes_h_l1020_c7_8298
result_MUX_uxn_opcodes_h_l1020_c7_8298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1020_c7_8298_cond,
result_MUX_uxn_opcodes_h_l1020_c7_8298_iftrue,
result_MUX_uxn_opcodes_h_l1020_c7_8298_iffalse,
result_MUX_uxn_opcodes_h_l1020_c7_8298_return_output);

-- opc_ovr_uxn_opcodes_h_l1020_c39_93cd
opc_ovr_uxn_opcodes_h_l1020_c39_93cd : entity work.opc_ovr_0CLK_09d9764c port map (
clk,
opc_ovr_uxn_opcodes_h_l1020_c39_93cd_CLOCK_ENABLE,
opc_ovr_uxn_opcodes_h_l1020_c39_93cd_stack_index,
opc_ovr_uxn_opcodes_h_l1020_c39_93cd_ins,
opc_ovr_uxn_opcodes_h_l1020_c39_93cd_k,
opc_ovr_uxn_opcodes_h_l1020_c39_93cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_left,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_right,
BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_return_output);

-- result_MUX_uxn_opcodes_h_l1021_c7_5295
result_MUX_uxn_opcodes_h_l1021_c7_5295 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1021_c7_5295_cond,
result_MUX_uxn_opcodes_h_l1021_c7_5295_iftrue,
result_MUX_uxn_opcodes_h_l1021_c7_5295_iffalse,
result_MUX_uxn_opcodes_h_l1021_c7_5295_return_output);

-- opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0
opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0 : entity work.opc_ovr2_0CLK_3d799363 port map (
clk,
opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_CLOCK_ENABLE,
opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_stack_index,
opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_ins,
opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_k,
opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_left,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_right,
BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_return_output);

-- result_MUX_uxn_opcodes_h_l1022_c7_beb0
result_MUX_uxn_opcodes_h_l1022_c7_beb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1022_c7_beb0_cond,
result_MUX_uxn_opcodes_h_l1022_c7_beb0_iftrue,
result_MUX_uxn_opcodes_h_l1022_c7_beb0_iffalse,
result_MUX_uxn_opcodes_h_l1022_c7_beb0_return_output);

-- opc_equ_uxn_opcodes_h_l1022_c39_8e37
opc_equ_uxn_opcodes_h_l1022_c39_8e37 : entity work.opc_equ_0CLK_4bcf4f80 port map (
clk,
opc_equ_uxn_opcodes_h_l1022_c39_8e37_CLOCK_ENABLE,
opc_equ_uxn_opcodes_h_l1022_c39_8e37_stack_index,
opc_equ_uxn_opcodes_h_l1022_c39_8e37_ins,
opc_equ_uxn_opcodes_h_l1022_c39_8e37_k,
opc_equ_uxn_opcodes_h_l1022_c39_8e37_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_return_output);

-- result_MUX_uxn_opcodes_h_l1023_c7_0752
result_MUX_uxn_opcodes_h_l1023_c7_0752 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1023_c7_0752_cond,
result_MUX_uxn_opcodes_h_l1023_c7_0752_iftrue,
result_MUX_uxn_opcodes_h_l1023_c7_0752_iffalse,
result_MUX_uxn_opcodes_h_l1023_c7_0752_return_output);

-- opc_equ2_uxn_opcodes_h_l1023_c39_cc9e
opc_equ2_uxn_opcodes_h_l1023_c39_cc9e : entity work.opc_equ2_0CLK_aa0f47c3 port map (
clk,
opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_CLOCK_ENABLE,
opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_stack_index,
opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_ins,
opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_k,
opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_left,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_right,
BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_return_output);

-- result_MUX_uxn_opcodes_h_l1024_c7_64f0
result_MUX_uxn_opcodes_h_l1024_c7_64f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1024_c7_64f0_cond,
result_MUX_uxn_opcodes_h_l1024_c7_64f0_iftrue,
result_MUX_uxn_opcodes_h_l1024_c7_64f0_iffalse,
result_MUX_uxn_opcodes_h_l1024_c7_64f0_return_output);

-- opc_neq_uxn_opcodes_h_l1024_c39_dce8
opc_neq_uxn_opcodes_h_l1024_c39_dce8 : entity work.opc_neq_0CLK_4bcf4f80 port map (
clk,
opc_neq_uxn_opcodes_h_l1024_c39_dce8_CLOCK_ENABLE,
opc_neq_uxn_opcodes_h_l1024_c39_dce8_stack_index,
opc_neq_uxn_opcodes_h_l1024_c39_dce8_ins,
opc_neq_uxn_opcodes_h_l1024_c39_dce8_k,
opc_neq_uxn_opcodes_h_l1024_c39_dce8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_left,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_right,
BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_return_output);

-- result_MUX_uxn_opcodes_h_l1025_c7_1a90
result_MUX_uxn_opcodes_h_l1025_c7_1a90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1025_c7_1a90_cond,
result_MUX_uxn_opcodes_h_l1025_c7_1a90_iftrue,
result_MUX_uxn_opcodes_h_l1025_c7_1a90_iffalse,
result_MUX_uxn_opcodes_h_l1025_c7_1a90_return_output);

-- opc_neq2_uxn_opcodes_h_l1025_c39_a776
opc_neq2_uxn_opcodes_h_l1025_c39_a776 : entity work.opc_neq2_0CLK_aa0f47c3 port map (
clk,
opc_neq2_uxn_opcodes_h_l1025_c39_a776_CLOCK_ENABLE,
opc_neq2_uxn_opcodes_h_l1025_c39_a776_stack_index,
opc_neq2_uxn_opcodes_h_l1025_c39_a776_ins,
opc_neq2_uxn_opcodes_h_l1025_c39_a776_k,
opc_neq2_uxn_opcodes_h_l1025_c39_a776_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_left,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_right,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_return_output);

-- result_MUX_uxn_opcodes_h_l1026_c7_25c1
result_MUX_uxn_opcodes_h_l1026_c7_25c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1026_c7_25c1_cond,
result_MUX_uxn_opcodes_h_l1026_c7_25c1_iftrue,
result_MUX_uxn_opcodes_h_l1026_c7_25c1_iffalse,
result_MUX_uxn_opcodes_h_l1026_c7_25c1_return_output);

-- opc_gth_uxn_opcodes_h_l1026_c39_64a6
opc_gth_uxn_opcodes_h_l1026_c39_64a6 : entity work.opc_gth_0CLK_4bcf4f80 port map (
clk,
opc_gth_uxn_opcodes_h_l1026_c39_64a6_CLOCK_ENABLE,
opc_gth_uxn_opcodes_h_l1026_c39_64a6_stack_index,
opc_gth_uxn_opcodes_h_l1026_c39_64a6_ins,
opc_gth_uxn_opcodes_h_l1026_c39_64a6_k,
opc_gth_uxn_opcodes_h_l1026_c39_64a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_left,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_right,
BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_return_output);

-- result_MUX_uxn_opcodes_h_l1027_c7_b341
result_MUX_uxn_opcodes_h_l1027_c7_b341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1027_c7_b341_cond,
result_MUX_uxn_opcodes_h_l1027_c7_b341_iftrue,
result_MUX_uxn_opcodes_h_l1027_c7_b341_iffalse,
result_MUX_uxn_opcodes_h_l1027_c7_b341_return_output);

-- opc_gth2_uxn_opcodes_h_l1027_c39_9c10
opc_gth2_uxn_opcodes_h_l1027_c39_9c10 : entity work.opc_gth2_0CLK_aa0f47c3 port map (
clk,
opc_gth2_uxn_opcodes_h_l1027_c39_9c10_CLOCK_ENABLE,
opc_gth2_uxn_opcodes_h_l1027_c39_9c10_stack_index,
opc_gth2_uxn_opcodes_h_l1027_c39_9c10_ins,
opc_gth2_uxn_opcodes_h_l1027_c39_9c10_k,
opc_gth2_uxn_opcodes_h_l1027_c39_9c10_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_left,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_right,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_return_output);

-- result_MUX_uxn_opcodes_h_l1028_c7_4a7c
result_MUX_uxn_opcodes_h_l1028_c7_4a7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1028_c7_4a7c_cond,
result_MUX_uxn_opcodes_h_l1028_c7_4a7c_iftrue,
result_MUX_uxn_opcodes_h_l1028_c7_4a7c_iffalse,
result_MUX_uxn_opcodes_h_l1028_c7_4a7c_return_output);

-- opc_lth_uxn_opcodes_h_l1028_c39_4ca7
opc_lth_uxn_opcodes_h_l1028_c39_4ca7 : entity work.opc_lth_0CLK_4bcf4f80 port map (
clk,
opc_lth_uxn_opcodes_h_l1028_c39_4ca7_CLOCK_ENABLE,
opc_lth_uxn_opcodes_h_l1028_c39_4ca7_stack_index,
opc_lth_uxn_opcodes_h_l1028_c39_4ca7_ins,
opc_lth_uxn_opcodes_h_l1028_c39_4ca7_k,
opc_lth_uxn_opcodes_h_l1028_c39_4ca7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_left,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_right,
BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_return_output);

-- result_MUX_uxn_opcodes_h_l1029_c7_d249
result_MUX_uxn_opcodes_h_l1029_c7_d249 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1029_c7_d249_cond,
result_MUX_uxn_opcodes_h_l1029_c7_d249_iftrue,
result_MUX_uxn_opcodes_h_l1029_c7_d249_iffalse,
result_MUX_uxn_opcodes_h_l1029_c7_d249_return_output);

-- opc_lth2_uxn_opcodes_h_l1029_c39_fe53
opc_lth2_uxn_opcodes_h_l1029_c39_fe53 : entity work.opc_lth2_0CLK_aa0f47c3 port map (
clk,
opc_lth2_uxn_opcodes_h_l1029_c39_fe53_CLOCK_ENABLE,
opc_lth2_uxn_opcodes_h_l1029_c39_fe53_stack_index,
opc_lth2_uxn_opcodes_h_l1029_c39_fe53_ins,
opc_lth2_uxn_opcodes_h_l1029_c39_fe53_k,
opc_lth2_uxn_opcodes_h_l1029_c39_fe53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_left,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_right,
BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_return_output);

-- result_MUX_uxn_opcodes_h_l1030_c7_0216
result_MUX_uxn_opcodes_h_l1030_c7_0216 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1030_c7_0216_cond,
result_MUX_uxn_opcodes_h_l1030_c7_0216_iftrue,
result_MUX_uxn_opcodes_h_l1030_c7_0216_iffalse,
result_MUX_uxn_opcodes_h_l1030_c7_0216_return_output);

-- opc_jmp_uxn_opcodes_h_l1030_c39_67d3
opc_jmp_uxn_opcodes_h_l1030_c39_67d3 : entity work.opc_jmp_0CLK_ab8f8397 port map (
clk,
opc_jmp_uxn_opcodes_h_l1030_c39_67d3_CLOCK_ENABLE,
opc_jmp_uxn_opcodes_h_l1030_c39_67d3_stack_index,
opc_jmp_uxn_opcodes_h_l1030_c39_67d3_ins,
opc_jmp_uxn_opcodes_h_l1030_c39_67d3_k,
opc_jmp_uxn_opcodes_h_l1030_c39_67d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_left,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_right,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_return_output);

-- result_MUX_uxn_opcodes_h_l1031_c7_d19b
result_MUX_uxn_opcodes_h_l1031_c7_d19b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1031_c7_d19b_cond,
result_MUX_uxn_opcodes_h_l1031_c7_d19b_iftrue,
result_MUX_uxn_opcodes_h_l1031_c7_d19b_iffalse,
result_MUX_uxn_opcodes_h_l1031_c7_d19b_return_output);

-- opc_jmp2_uxn_opcodes_h_l1031_c39_2abe
opc_jmp2_uxn_opcodes_h_l1031_c39_2abe : entity work.opc_jmp2_0CLK_cd0ff700 port map (
clk,
opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_CLOCK_ENABLE,
opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_stack_index,
opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_ins,
opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_k,
opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_left,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_right,
BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_return_output);

-- result_MUX_uxn_opcodes_h_l1032_c7_7153
result_MUX_uxn_opcodes_h_l1032_c7_7153 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1032_c7_7153_cond,
result_MUX_uxn_opcodes_h_l1032_c7_7153_iftrue,
result_MUX_uxn_opcodes_h_l1032_c7_7153_iffalse,
result_MUX_uxn_opcodes_h_l1032_c7_7153_return_output);

-- opc_jcn_uxn_opcodes_h_l1032_c39_faf8
opc_jcn_uxn_opcodes_h_l1032_c39_faf8 : entity work.opc_jcn_0CLK_7f8adde9 port map (
clk,
opc_jcn_uxn_opcodes_h_l1032_c39_faf8_CLOCK_ENABLE,
opc_jcn_uxn_opcodes_h_l1032_c39_faf8_stack_index,
opc_jcn_uxn_opcodes_h_l1032_c39_faf8_ins,
opc_jcn_uxn_opcodes_h_l1032_c39_faf8_k,
opc_jcn_uxn_opcodes_h_l1032_c39_faf8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_left,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_right,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_return_output);

-- result_MUX_uxn_opcodes_h_l1033_c7_4c65
result_MUX_uxn_opcodes_h_l1033_c7_4c65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1033_c7_4c65_cond,
result_MUX_uxn_opcodes_h_l1033_c7_4c65_iftrue,
result_MUX_uxn_opcodes_h_l1033_c7_4c65_iffalse,
result_MUX_uxn_opcodes_h_l1033_c7_4c65_return_output);

-- opc_jcn2_uxn_opcodes_h_l1033_c39_4666
opc_jcn2_uxn_opcodes_h_l1033_c39_4666 : entity work.opc_jcn2_0CLK_fc8f03ff port map (
clk,
opc_jcn2_uxn_opcodes_h_l1033_c39_4666_CLOCK_ENABLE,
opc_jcn2_uxn_opcodes_h_l1033_c39_4666_stack_index,
opc_jcn2_uxn_opcodes_h_l1033_c39_4666_ins,
opc_jcn2_uxn_opcodes_h_l1033_c39_4666_k,
opc_jcn2_uxn_opcodes_h_l1033_c39_4666_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_left,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_right,
BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_return_output);

-- result_MUX_uxn_opcodes_h_l1034_c7_5ca3
result_MUX_uxn_opcodes_h_l1034_c7_5ca3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1034_c7_5ca3_cond,
result_MUX_uxn_opcodes_h_l1034_c7_5ca3_iftrue,
result_MUX_uxn_opcodes_h_l1034_c7_5ca3_iffalse,
result_MUX_uxn_opcodes_h_l1034_c7_5ca3_return_output);

-- opc_jsr_uxn_opcodes_h_l1034_c39_4d03
opc_jsr_uxn_opcodes_h_l1034_c39_4d03 : entity work.opc_jsr_0CLK_1d648d8a port map (
clk,
opc_jsr_uxn_opcodes_h_l1034_c39_4d03_CLOCK_ENABLE,
opc_jsr_uxn_opcodes_h_l1034_c39_4d03_stack_index,
opc_jsr_uxn_opcodes_h_l1034_c39_4d03_ins,
opc_jsr_uxn_opcodes_h_l1034_c39_4d03_k,
opc_jsr_uxn_opcodes_h_l1034_c39_4d03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_left,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_right,
BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_return_output);

-- result_MUX_uxn_opcodes_h_l1035_c7_b08c
result_MUX_uxn_opcodes_h_l1035_c7_b08c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1035_c7_b08c_cond,
result_MUX_uxn_opcodes_h_l1035_c7_b08c_iftrue,
result_MUX_uxn_opcodes_h_l1035_c7_b08c_iffalse,
result_MUX_uxn_opcodes_h_l1035_c7_b08c_return_output);

-- opc_jsr2_uxn_opcodes_h_l1035_c39_1c11
opc_jsr2_uxn_opcodes_h_l1035_c39_1c11 : entity work.opc_jsr2_0CLK_421159e4 port map (
clk,
opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_CLOCK_ENABLE,
opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_stack_index,
opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_ins,
opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_k,
opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_left,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_right,
BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_return_output);

-- result_MUX_uxn_opcodes_h_l1036_c7_86f7
result_MUX_uxn_opcodes_h_l1036_c7_86f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1036_c7_86f7_cond,
result_MUX_uxn_opcodes_h_l1036_c7_86f7_iftrue,
result_MUX_uxn_opcodes_h_l1036_c7_86f7_iffalse,
result_MUX_uxn_opcodes_h_l1036_c7_86f7_return_output);

-- opc_sth_uxn_opcodes_h_l1036_c39_8e27
opc_sth_uxn_opcodes_h_l1036_c39_8e27 : entity work.opc_sth_0CLK_3ec49a15 port map (
clk,
opc_sth_uxn_opcodes_h_l1036_c39_8e27_CLOCK_ENABLE,
opc_sth_uxn_opcodes_h_l1036_c39_8e27_stack_index,
opc_sth_uxn_opcodes_h_l1036_c39_8e27_ins,
opc_sth_uxn_opcodes_h_l1036_c39_8e27_k,
opc_sth_uxn_opcodes_h_l1036_c39_8e27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_left,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_right,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_return_output);

-- result_MUX_uxn_opcodes_h_l1037_c7_8e53
result_MUX_uxn_opcodes_h_l1037_c7_8e53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1037_c7_8e53_cond,
result_MUX_uxn_opcodes_h_l1037_c7_8e53_iftrue,
result_MUX_uxn_opcodes_h_l1037_c7_8e53_iffalse,
result_MUX_uxn_opcodes_h_l1037_c7_8e53_return_output);

-- opc_sth2_uxn_opcodes_h_l1037_c39_3a9f
opc_sth2_uxn_opcodes_h_l1037_c39_3a9f : entity work.opc_sth2_0CLK_186906f2 port map (
clk,
opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_CLOCK_ENABLE,
opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_stack_index,
opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_ins,
opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_k,
opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_left,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_right,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_return_output);

-- result_MUX_uxn_opcodes_h_l1038_c7_0b30
result_MUX_uxn_opcodes_h_l1038_c7_0b30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1038_c7_0b30_cond,
result_MUX_uxn_opcodes_h_l1038_c7_0b30_iftrue,
result_MUX_uxn_opcodes_h_l1038_c7_0b30_iffalse,
result_MUX_uxn_opcodes_h_l1038_c7_0b30_return_output);

-- opc_ldz_uxn_opcodes_h_l1038_c39_09a7
opc_ldz_uxn_opcodes_h_l1038_c39_09a7 : entity work.opc_ldz_0CLK_7041f0d4 port map (
clk,
opc_ldz_uxn_opcodes_h_l1038_c39_09a7_CLOCK_ENABLE,
opc_ldz_uxn_opcodes_h_l1038_c39_09a7_stack_index,
opc_ldz_uxn_opcodes_h_l1038_c39_09a7_ins,
opc_ldz_uxn_opcodes_h_l1038_c39_09a7_k,
opc_ldz_uxn_opcodes_h_l1038_c39_09a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_left,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_right,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_return_output);

-- result_MUX_uxn_opcodes_h_l1039_c7_65ef
result_MUX_uxn_opcodes_h_l1039_c7_65ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1039_c7_65ef_cond,
result_MUX_uxn_opcodes_h_l1039_c7_65ef_iftrue,
result_MUX_uxn_opcodes_h_l1039_c7_65ef_iffalse,
result_MUX_uxn_opcodes_h_l1039_c7_65ef_return_output);

-- opc_ldz2_uxn_opcodes_h_l1039_c39_665b
opc_ldz2_uxn_opcodes_h_l1039_c39_665b : entity work.opc_ldz2_0CLK_7c39c135 port map (
clk,
opc_ldz2_uxn_opcodes_h_l1039_c39_665b_CLOCK_ENABLE,
opc_ldz2_uxn_opcodes_h_l1039_c39_665b_stack_index,
opc_ldz2_uxn_opcodes_h_l1039_c39_665b_ins,
opc_ldz2_uxn_opcodes_h_l1039_c39_665b_k,
opc_ldz2_uxn_opcodes_h_l1039_c39_665b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_left,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_right,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_return_output);

-- result_MUX_uxn_opcodes_h_l1040_c7_48b9
result_MUX_uxn_opcodes_h_l1040_c7_48b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1040_c7_48b9_cond,
result_MUX_uxn_opcodes_h_l1040_c7_48b9_iftrue,
result_MUX_uxn_opcodes_h_l1040_c7_48b9_iffalse,
result_MUX_uxn_opcodes_h_l1040_c7_48b9_return_output);

-- opc_stz_uxn_opcodes_h_l1040_c39_b81a
opc_stz_uxn_opcodes_h_l1040_c39_b81a : entity work.opc_stz_0CLK_b96dbee9 port map (
clk,
opc_stz_uxn_opcodes_h_l1040_c39_b81a_CLOCK_ENABLE,
opc_stz_uxn_opcodes_h_l1040_c39_b81a_stack_index,
opc_stz_uxn_opcodes_h_l1040_c39_b81a_ins,
opc_stz_uxn_opcodes_h_l1040_c39_b81a_k,
opc_stz_uxn_opcodes_h_l1040_c39_b81a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_left,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_right,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_return_output);

-- result_MUX_uxn_opcodes_h_l1041_c7_bc80
result_MUX_uxn_opcodes_h_l1041_c7_bc80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1041_c7_bc80_cond,
result_MUX_uxn_opcodes_h_l1041_c7_bc80_iftrue,
result_MUX_uxn_opcodes_h_l1041_c7_bc80_iffalse,
result_MUX_uxn_opcodes_h_l1041_c7_bc80_return_output);

-- opc_stz2_uxn_opcodes_h_l1041_c39_0297
opc_stz2_uxn_opcodes_h_l1041_c39_0297 : entity work.opc_stz2_0CLK_4d96a8bf port map (
clk,
opc_stz2_uxn_opcodes_h_l1041_c39_0297_CLOCK_ENABLE,
opc_stz2_uxn_opcodes_h_l1041_c39_0297_stack_index,
opc_stz2_uxn_opcodes_h_l1041_c39_0297_ins,
opc_stz2_uxn_opcodes_h_l1041_c39_0297_k,
opc_stz2_uxn_opcodes_h_l1041_c39_0297_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_left,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_right,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_return_output);

-- result_MUX_uxn_opcodes_h_l1042_c7_02cd
result_MUX_uxn_opcodes_h_l1042_c7_02cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1042_c7_02cd_cond,
result_MUX_uxn_opcodes_h_l1042_c7_02cd_iftrue,
result_MUX_uxn_opcodes_h_l1042_c7_02cd_iffalse,
result_MUX_uxn_opcodes_h_l1042_c7_02cd_return_output);

-- opc_ldr_uxn_opcodes_h_l1042_c39_fe4a
opc_ldr_uxn_opcodes_h_l1042_c39_fe4a : entity work.opc_ldr_0CLK_82f21321 port map (
clk,
opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_CLOCK_ENABLE,
opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_stack_index,
opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_ins,
opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_k,
opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_left,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_right,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_return_output);

-- result_MUX_uxn_opcodes_h_l1043_c7_4389
result_MUX_uxn_opcodes_h_l1043_c7_4389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1043_c7_4389_cond,
result_MUX_uxn_opcodes_h_l1043_c7_4389_iftrue,
result_MUX_uxn_opcodes_h_l1043_c7_4389_iffalse,
result_MUX_uxn_opcodes_h_l1043_c7_4389_return_output);

-- opc_ldr2_uxn_opcodes_h_l1043_c39_a66a
opc_ldr2_uxn_opcodes_h_l1043_c39_a66a : entity work.opc_ldr2_0CLK_70d4381b port map (
clk,
opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_CLOCK_ENABLE,
opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_stack_index,
opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_ins,
opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_k,
opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_left,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_right,
BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_return_output);

-- result_MUX_uxn_opcodes_h_l1044_c7_a467
result_MUX_uxn_opcodes_h_l1044_c7_a467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1044_c7_a467_cond,
result_MUX_uxn_opcodes_h_l1044_c7_a467_iftrue,
result_MUX_uxn_opcodes_h_l1044_c7_a467_iffalse,
result_MUX_uxn_opcodes_h_l1044_c7_a467_return_output);

-- opc_str_uxn_opcodes_h_l1044_c39_8183
opc_str_uxn_opcodes_h_l1044_c39_8183 : entity work.opc_str_0CLK_312a4701 port map (
clk,
opc_str_uxn_opcodes_h_l1044_c39_8183_CLOCK_ENABLE,
opc_str_uxn_opcodes_h_l1044_c39_8183_stack_index,
opc_str_uxn_opcodes_h_l1044_c39_8183_ins,
opc_str_uxn_opcodes_h_l1044_c39_8183_k,
opc_str_uxn_opcodes_h_l1044_c39_8183_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_left,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_right,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_return_output);

-- result_MUX_uxn_opcodes_h_l1045_c7_995e
result_MUX_uxn_opcodes_h_l1045_c7_995e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1045_c7_995e_cond,
result_MUX_uxn_opcodes_h_l1045_c7_995e_iftrue,
result_MUX_uxn_opcodes_h_l1045_c7_995e_iffalse,
result_MUX_uxn_opcodes_h_l1045_c7_995e_return_output);

-- opc_str2_uxn_opcodes_h_l1045_c39_ed64
opc_str2_uxn_opcodes_h_l1045_c39_ed64 : entity work.opc_str2_0CLK_9c90a87c port map (
clk,
opc_str2_uxn_opcodes_h_l1045_c39_ed64_CLOCK_ENABLE,
opc_str2_uxn_opcodes_h_l1045_c39_ed64_stack_index,
opc_str2_uxn_opcodes_h_l1045_c39_ed64_ins,
opc_str2_uxn_opcodes_h_l1045_c39_ed64_k,
opc_str2_uxn_opcodes_h_l1045_c39_ed64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_left,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_right,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_return_output);

-- result_MUX_uxn_opcodes_h_l1046_c7_93a6
result_MUX_uxn_opcodes_h_l1046_c7_93a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1046_c7_93a6_cond,
result_MUX_uxn_opcodes_h_l1046_c7_93a6_iftrue,
result_MUX_uxn_opcodes_h_l1046_c7_93a6_iffalse,
result_MUX_uxn_opcodes_h_l1046_c7_93a6_return_output);

-- opc_lda_uxn_opcodes_h_l1046_c39_452f
opc_lda_uxn_opcodes_h_l1046_c39_452f : entity work.opc_lda_0CLK_bb6fd9ae port map (
clk,
opc_lda_uxn_opcodes_h_l1046_c39_452f_CLOCK_ENABLE,
opc_lda_uxn_opcodes_h_l1046_c39_452f_stack_index,
opc_lda_uxn_opcodes_h_l1046_c39_452f_ins,
opc_lda_uxn_opcodes_h_l1046_c39_452f_k,
opc_lda_uxn_opcodes_h_l1046_c39_452f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_left,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_right,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_return_output);

-- result_MUX_uxn_opcodes_h_l1047_c7_aa2a
result_MUX_uxn_opcodes_h_l1047_c7_aa2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1047_c7_aa2a_cond,
result_MUX_uxn_opcodes_h_l1047_c7_aa2a_iftrue,
result_MUX_uxn_opcodes_h_l1047_c7_aa2a_iffalse,
result_MUX_uxn_opcodes_h_l1047_c7_aa2a_return_output);

-- opc_lda2_uxn_opcodes_h_l1047_c39_822f
opc_lda2_uxn_opcodes_h_l1047_c39_822f : entity work.opc_lda2_0CLK_92ff38d5 port map (
clk,
opc_lda2_uxn_opcodes_h_l1047_c39_822f_CLOCK_ENABLE,
opc_lda2_uxn_opcodes_h_l1047_c39_822f_stack_index,
opc_lda2_uxn_opcodes_h_l1047_c39_822f_ins,
opc_lda2_uxn_opcodes_h_l1047_c39_822f_k,
opc_lda2_uxn_opcodes_h_l1047_c39_822f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_left,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_right,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_return_output);

-- result_MUX_uxn_opcodes_h_l1048_c7_c21d
result_MUX_uxn_opcodes_h_l1048_c7_c21d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1048_c7_c21d_cond,
result_MUX_uxn_opcodes_h_l1048_c7_c21d_iftrue,
result_MUX_uxn_opcodes_h_l1048_c7_c21d_iffalse,
result_MUX_uxn_opcodes_h_l1048_c7_c21d_return_output);

-- opc_sta_uxn_opcodes_h_l1048_c39_6e12
opc_sta_uxn_opcodes_h_l1048_c39_6e12 : entity work.opc_sta_0CLK_9debfd4d port map (
clk,
opc_sta_uxn_opcodes_h_l1048_c39_6e12_CLOCK_ENABLE,
opc_sta_uxn_opcodes_h_l1048_c39_6e12_stack_index,
opc_sta_uxn_opcodes_h_l1048_c39_6e12_ins,
opc_sta_uxn_opcodes_h_l1048_c39_6e12_k,
opc_sta_uxn_opcodes_h_l1048_c39_6e12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_left,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_right,
BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_return_output);

-- result_MUX_uxn_opcodes_h_l1049_c7_0b4b
result_MUX_uxn_opcodes_h_l1049_c7_0b4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1049_c7_0b4b_cond,
result_MUX_uxn_opcodes_h_l1049_c7_0b4b_iftrue,
result_MUX_uxn_opcodes_h_l1049_c7_0b4b_iffalse,
result_MUX_uxn_opcodes_h_l1049_c7_0b4b_return_output);

-- opc_sta2_uxn_opcodes_h_l1049_c39_c880
opc_sta2_uxn_opcodes_h_l1049_c39_c880 : entity work.opc_sta2_0CLK_5153798f port map (
clk,
opc_sta2_uxn_opcodes_h_l1049_c39_c880_CLOCK_ENABLE,
opc_sta2_uxn_opcodes_h_l1049_c39_c880_stack_index,
opc_sta2_uxn_opcodes_h_l1049_c39_c880_ins,
opc_sta2_uxn_opcodes_h_l1049_c39_c880_k,
opc_sta2_uxn_opcodes_h_l1049_c39_c880_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_return_output);

-- result_MUX_uxn_opcodes_h_l1050_c7_8923
result_MUX_uxn_opcodes_h_l1050_c7_8923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1050_c7_8923_cond,
result_MUX_uxn_opcodes_h_l1050_c7_8923_iftrue,
result_MUX_uxn_opcodes_h_l1050_c7_8923_iffalse,
result_MUX_uxn_opcodes_h_l1050_c7_8923_return_output);

-- opc_dei_uxn_opcodes_h_l1050_c39_5bc3
opc_dei_uxn_opcodes_h_l1050_c39_5bc3 : entity work.opc_dei_0CLK_4cadf5f3 port map (
clk,
opc_dei_uxn_opcodes_h_l1050_c39_5bc3_CLOCK_ENABLE,
opc_dei_uxn_opcodes_h_l1050_c39_5bc3_stack_index,
opc_dei_uxn_opcodes_h_l1050_c39_5bc3_ins,
opc_dei_uxn_opcodes_h_l1050_c39_5bc3_k,
opc_dei_uxn_opcodes_h_l1050_c39_5bc3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_left,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_right,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_return_output);

-- result_MUX_uxn_opcodes_h_l1051_c7_be74
result_MUX_uxn_opcodes_h_l1051_c7_be74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1051_c7_be74_cond,
result_MUX_uxn_opcodes_h_l1051_c7_be74_iftrue,
result_MUX_uxn_opcodes_h_l1051_c7_be74_iffalse,
result_MUX_uxn_opcodes_h_l1051_c7_be74_return_output);

-- opc_dei2_uxn_opcodes_h_l1051_c39_1396
opc_dei2_uxn_opcodes_h_l1051_c39_1396 : entity work.opc_dei2_0CLK_1a8244c2 port map (
clk,
opc_dei2_uxn_opcodes_h_l1051_c39_1396_CLOCK_ENABLE,
opc_dei2_uxn_opcodes_h_l1051_c39_1396_stack_index,
opc_dei2_uxn_opcodes_h_l1051_c39_1396_ins,
opc_dei2_uxn_opcodes_h_l1051_c39_1396_k,
opc_dei2_uxn_opcodes_h_l1051_c39_1396_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_left,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_right,
BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_return_output);

-- result_MUX_uxn_opcodes_h_l1052_c7_6093
result_MUX_uxn_opcodes_h_l1052_c7_6093 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1052_c7_6093_cond,
result_MUX_uxn_opcodes_h_l1052_c7_6093_iftrue,
result_MUX_uxn_opcodes_h_l1052_c7_6093_iffalse,
result_MUX_uxn_opcodes_h_l1052_c7_6093_return_output);

-- opc_deo_uxn_opcodes_h_l1052_c39_7c09
opc_deo_uxn_opcodes_h_l1052_c39_7c09 : entity work.opc_deo_0CLK_434848af port map (
clk,
opc_deo_uxn_opcodes_h_l1052_c39_7c09_CLOCK_ENABLE,
opc_deo_uxn_opcodes_h_l1052_c39_7c09_stack_index,
opc_deo_uxn_opcodes_h_l1052_c39_7c09_ins,
opc_deo_uxn_opcodes_h_l1052_c39_7c09_k,
opc_deo_uxn_opcodes_h_l1052_c39_7c09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_left,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_right,
BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_return_output);

-- result_MUX_uxn_opcodes_h_l1053_c7_6eeb
result_MUX_uxn_opcodes_h_l1053_c7_6eeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1053_c7_6eeb_cond,
result_MUX_uxn_opcodes_h_l1053_c7_6eeb_iftrue,
result_MUX_uxn_opcodes_h_l1053_c7_6eeb_iffalse,
result_MUX_uxn_opcodes_h_l1053_c7_6eeb_return_output);

-- opc_deo2_uxn_opcodes_h_l1053_c39_d550
opc_deo2_uxn_opcodes_h_l1053_c39_d550 : entity work.opc_deo2_0CLK_d7508b32 port map (
clk,
opc_deo2_uxn_opcodes_h_l1053_c39_d550_CLOCK_ENABLE,
opc_deo2_uxn_opcodes_h_l1053_c39_d550_stack_index,
opc_deo2_uxn_opcodes_h_l1053_c39_d550_ins,
opc_deo2_uxn_opcodes_h_l1053_c39_d550_k,
opc_deo2_uxn_opcodes_h_l1053_c39_d550_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_left,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_right,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_return_output);

-- result_MUX_uxn_opcodes_h_l1054_c7_1711
result_MUX_uxn_opcodes_h_l1054_c7_1711 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1054_c7_1711_cond,
result_MUX_uxn_opcodes_h_l1054_c7_1711_iftrue,
result_MUX_uxn_opcodes_h_l1054_c7_1711_iffalse,
result_MUX_uxn_opcodes_h_l1054_c7_1711_return_output);

-- opc_add_uxn_opcodes_h_l1054_c39_13bf
opc_add_uxn_opcodes_h_l1054_c39_13bf : entity work.opc_add_0CLK_fec2727b port map (
clk,
opc_add_uxn_opcodes_h_l1054_c39_13bf_CLOCK_ENABLE,
opc_add_uxn_opcodes_h_l1054_c39_13bf_stack_index,
opc_add_uxn_opcodes_h_l1054_c39_13bf_ins,
opc_add_uxn_opcodes_h_l1054_c39_13bf_k,
opc_add_uxn_opcodes_h_l1054_c39_13bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_return_output);

-- result_MUX_uxn_opcodes_h_l1055_c7_2713
result_MUX_uxn_opcodes_h_l1055_c7_2713 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1055_c7_2713_cond,
result_MUX_uxn_opcodes_h_l1055_c7_2713_iftrue,
result_MUX_uxn_opcodes_h_l1055_c7_2713_iffalse,
result_MUX_uxn_opcodes_h_l1055_c7_2713_return_output);

-- opc_add2_uxn_opcodes_h_l1055_c39_ed35
opc_add2_uxn_opcodes_h_l1055_c39_ed35 : entity work.opc_add2_0CLK_3ec85585 port map (
clk,
opc_add2_uxn_opcodes_h_l1055_c39_ed35_CLOCK_ENABLE,
opc_add2_uxn_opcodes_h_l1055_c39_ed35_stack_index,
opc_add2_uxn_opcodes_h_l1055_c39_ed35_ins,
opc_add2_uxn_opcodes_h_l1055_c39_ed35_k,
opc_add2_uxn_opcodes_h_l1055_c39_ed35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_left,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_right,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_return_output);

-- result_MUX_uxn_opcodes_h_l1056_c7_2b10
result_MUX_uxn_opcodes_h_l1056_c7_2b10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1056_c7_2b10_cond,
result_MUX_uxn_opcodes_h_l1056_c7_2b10_iftrue,
result_MUX_uxn_opcodes_h_l1056_c7_2b10_iffalse,
result_MUX_uxn_opcodes_h_l1056_c7_2b10_return_output);

-- opc_sub_uxn_opcodes_h_l1056_c39_0fdc
opc_sub_uxn_opcodes_h_l1056_c39_0fdc : entity work.opc_sub_0CLK_fec2727b port map (
clk,
opc_sub_uxn_opcodes_h_l1056_c39_0fdc_CLOCK_ENABLE,
opc_sub_uxn_opcodes_h_l1056_c39_0fdc_stack_index,
opc_sub_uxn_opcodes_h_l1056_c39_0fdc_ins,
opc_sub_uxn_opcodes_h_l1056_c39_0fdc_k,
opc_sub_uxn_opcodes_h_l1056_c39_0fdc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_left,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_right,
BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_return_output);

-- result_MUX_uxn_opcodes_h_l1057_c7_fb69
result_MUX_uxn_opcodes_h_l1057_c7_fb69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1057_c7_fb69_cond,
result_MUX_uxn_opcodes_h_l1057_c7_fb69_iftrue,
result_MUX_uxn_opcodes_h_l1057_c7_fb69_iffalse,
result_MUX_uxn_opcodes_h_l1057_c7_fb69_return_output);

-- opc_sub2_uxn_opcodes_h_l1057_c39_343c
opc_sub2_uxn_opcodes_h_l1057_c39_343c : entity work.opc_sub2_0CLK_3ec85585 port map (
clk,
opc_sub2_uxn_opcodes_h_l1057_c39_343c_CLOCK_ENABLE,
opc_sub2_uxn_opcodes_h_l1057_c39_343c_stack_index,
opc_sub2_uxn_opcodes_h_l1057_c39_343c_ins,
opc_sub2_uxn_opcodes_h_l1057_c39_343c_k,
opc_sub2_uxn_opcodes_h_l1057_c39_343c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_left,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_right,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_return_output);

-- result_MUX_uxn_opcodes_h_l1058_c7_13da
result_MUX_uxn_opcodes_h_l1058_c7_13da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1058_c7_13da_cond,
result_MUX_uxn_opcodes_h_l1058_c7_13da_iftrue,
result_MUX_uxn_opcodes_h_l1058_c7_13da_iffalse,
result_MUX_uxn_opcodes_h_l1058_c7_13da_return_output);

-- opc_mul_uxn_opcodes_h_l1058_c39_1069
opc_mul_uxn_opcodes_h_l1058_c39_1069 : entity work.opc_mul_0CLK_fec2727b port map (
clk,
opc_mul_uxn_opcodes_h_l1058_c39_1069_CLOCK_ENABLE,
opc_mul_uxn_opcodes_h_l1058_c39_1069_stack_index,
opc_mul_uxn_opcodes_h_l1058_c39_1069_ins,
opc_mul_uxn_opcodes_h_l1058_c39_1069_k,
opc_mul_uxn_opcodes_h_l1058_c39_1069_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_left,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_right,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_return_output);

-- result_MUX_uxn_opcodes_h_l1059_c7_217b
result_MUX_uxn_opcodes_h_l1059_c7_217b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1059_c7_217b_cond,
result_MUX_uxn_opcodes_h_l1059_c7_217b_iftrue,
result_MUX_uxn_opcodes_h_l1059_c7_217b_iffalse,
result_MUX_uxn_opcodes_h_l1059_c7_217b_return_output);

-- opc_mul2_uxn_opcodes_h_l1059_c39_f5d8
opc_mul2_uxn_opcodes_h_l1059_c39_f5d8 : entity work.opc_mul2_0CLK_3ec85585 port map (
clk,
opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_CLOCK_ENABLE,
opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_stack_index,
opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_ins,
opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_k,
opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_left,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_right,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_return_output);

-- result_MUX_uxn_opcodes_h_l1060_c7_e8ea
result_MUX_uxn_opcodes_h_l1060_c7_e8ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1060_c7_e8ea_cond,
result_MUX_uxn_opcodes_h_l1060_c7_e8ea_iftrue,
result_MUX_uxn_opcodes_h_l1060_c7_e8ea_iffalse,
result_MUX_uxn_opcodes_h_l1060_c7_e8ea_return_output);

-- opc_div_uxn_opcodes_h_l1060_c39_c275
opc_div_uxn_opcodes_h_l1060_c39_c275 : entity work.opc_div_0CLK_eff7b951 port map (
clk,
opc_div_uxn_opcodes_h_l1060_c39_c275_CLOCK_ENABLE,
opc_div_uxn_opcodes_h_l1060_c39_c275_stack_index,
opc_div_uxn_opcodes_h_l1060_c39_c275_ins,
opc_div_uxn_opcodes_h_l1060_c39_c275_k,
opc_div_uxn_opcodes_h_l1060_c39_c275_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_left,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_right,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_return_output);

-- result_MUX_uxn_opcodes_h_l1061_c7_7d68
result_MUX_uxn_opcodes_h_l1061_c7_7d68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1061_c7_7d68_cond,
result_MUX_uxn_opcodes_h_l1061_c7_7d68_iftrue,
result_MUX_uxn_opcodes_h_l1061_c7_7d68_iffalse,
result_MUX_uxn_opcodes_h_l1061_c7_7d68_return_output);

-- opc_div2_uxn_opcodes_h_l1061_c39_fc84
opc_div2_uxn_opcodes_h_l1061_c39_fc84 : entity work.opc_div2_0CLK_e1a1d759 port map (
clk,
opc_div2_uxn_opcodes_h_l1061_c39_fc84_CLOCK_ENABLE,
opc_div2_uxn_opcodes_h_l1061_c39_fc84_stack_index,
opc_div2_uxn_opcodes_h_l1061_c39_fc84_ins,
opc_div2_uxn_opcodes_h_l1061_c39_fc84_k,
opc_div2_uxn_opcodes_h_l1061_c39_fc84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_left,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_right,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_return_output);

-- result_MUX_uxn_opcodes_h_l1062_c7_014d
result_MUX_uxn_opcodes_h_l1062_c7_014d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1062_c7_014d_cond,
result_MUX_uxn_opcodes_h_l1062_c7_014d_iftrue,
result_MUX_uxn_opcodes_h_l1062_c7_014d_iffalse,
result_MUX_uxn_opcodes_h_l1062_c7_014d_return_output);

-- opc_and_uxn_opcodes_h_l1062_c39_5672
opc_and_uxn_opcodes_h_l1062_c39_5672 : entity work.opc_and_0CLK_fec2727b port map (
clk,
opc_and_uxn_opcodes_h_l1062_c39_5672_CLOCK_ENABLE,
opc_and_uxn_opcodes_h_l1062_c39_5672_stack_index,
opc_and_uxn_opcodes_h_l1062_c39_5672_ins,
opc_and_uxn_opcodes_h_l1062_c39_5672_k,
opc_and_uxn_opcodes_h_l1062_c39_5672_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_return_output);

-- result_MUX_uxn_opcodes_h_l1063_c7_6031
result_MUX_uxn_opcodes_h_l1063_c7_6031 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1063_c7_6031_cond,
result_MUX_uxn_opcodes_h_l1063_c7_6031_iftrue,
result_MUX_uxn_opcodes_h_l1063_c7_6031_iffalse,
result_MUX_uxn_opcodes_h_l1063_c7_6031_return_output);

-- opc_and2_uxn_opcodes_h_l1063_c39_af79
opc_and2_uxn_opcodes_h_l1063_c39_af79 : entity work.opc_and2_0CLK_3ec85585 port map (
clk,
opc_and2_uxn_opcodes_h_l1063_c39_af79_CLOCK_ENABLE,
opc_and2_uxn_opcodes_h_l1063_c39_af79_stack_index,
opc_and2_uxn_opcodes_h_l1063_c39_af79_ins,
opc_and2_uxn_opcodes_h_l1063_c39_af79_k,
opc_and2_uxn_opcodes_h_l1063_c39_af79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_left,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_right,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_return_output);

-- result_MUX_uxn_opcodes_h_l1064_c7_8a1f
result_MUX_uxn_opcodes_h_l1064_c7_8a1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1064_c7_8a1f_cond,
result_MUX_uxn_opcodes_h_l1064_c7_8a1f_iftrue,
result_MUX_uxn_opcodes_h_l1064_c7_8a1f_iffalse,
result_MUX_uxn_opcodes_h_l1064_c7_8a1f_return_output);

-- opc_ora_uxn_opcodes_h_l1064_c39_35e4
opc_ora_uxn_opcodes_h_l1064_c39_35e4 : entity work.opc_ora_0CLK_fec2727b port map (
clk,
opc_ora_uxn_opcodes_h_l1064_c39_35e4_CLOCK_ENABLE,
opc_ora_uxn_opcodes_h_l1064_c39_35e4_stack_index,
opc_ora_uxn_opcodes_h_l1064_c39_35e4_ins,
opc_ora_uxn_opcodes_h_l1064_c39_35e4_k,
opc_ora_uxn_opcodes_h_l1064_c39_35e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_left,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_right,
BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_return_output);

-- result_MUX_uxn_opcodes_h_l1065_c7_8781
result_MUX_uxn_opcodes_h_l1065_c7_8781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1065_c7_8781_cond,
result_MUX_uxn_opcodes_h_l1065_c7_8781_iftrue,
result_MUX_uxn_opcodes_h_l1065_c7_8781_iffalse,
result_MUX_uxn_opcodes_h_l1065_c7_8781_return_output);

-- opc_ora2_uxn_opcodes_h_l1065_c39_2dd8
opc_ora2_uxn_opcodes_h_l1065_c39_2dd8 : entity work.opc_ora2_0CLK_3ec85585 port map (
clk,
opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_CLOCK_ENABLE,
opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_stack_index,
opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_ins,
opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_k,
opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_left,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_right,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_return_output);

-- result_MUX_uxn_opcodes_h_l1066_c7_fd47
result_MUX_uxn_opcodes_h_l1066_c7_fd47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1066_c7_fd47_cond,
result_MUX_uxn_opcodes_h_l1066_c7_fd47_iftrue,
result_MUX_uxn_opcodes_h_l1066_c7_fd47_iffalse,
result_MUX_uxn_opcodes_h_l1066_c7_fd47_return_output);

-- opc_eor_uxn_opcodes_h_l1066_c39_7c54
opc_eor_uxn_opcodes_h_l1066_c39_7c54 : entity work.opc_eor_0CLK_fec2727b port map (
clk,
opc_eor_uxn_opcodes_h_l1066_c39_7c54_CLOCK_ENABLE,
opc_eor_uxn_opcodes_h_l1066_c39_7c54_stack_index,
opc_eor_uxn_opcodes_h_l1066_c39_7c54_ins,
opc_eor_uxn_opcodes_h_l1066_c39_7c54_k,
opc_eor_uxn_opcodes_h_l1066_c39_7c54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_return_output);

-- result_MUX_uxn_opcodes_h_l1067_c7_44a7
result_MUX_uxn_opcodes_h_l1067_c7_44a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1067_c7_44a7_cond,
result_MUX_uxn_opcodes_h_l1067_c7_44a7_iftrue,
result_MUX_uxn_opcodes_h_l1067_c7_44a7_iffalse,
result_MUX_uxn_opcodes_h_l1067_c7_44a7_return_output);

-- opc_eor2_uxn_opcodes_h_l1067_c39_9be1
opc_eor2_uxn_opcodes_h_l1067_c39_9be1 : entity work.opc_eor2_0CLK_3ec85585 port map (
clk,
opc_eor2_uxn_opcodes_h_l1067_c39_9be1_CLOCK_ENABLE,
opc_eor2_uxn_opcodes_h_l1067_c39_9be1_stack_index,
opc_eor2_uxn_opcodes_h_l1067_c39_9be1_ins,
opc_eor2_uxn_opcodes_h_l1067_c39_9be1_k,
opc_eor2_uxn_opcodes_h_l1067_c39_9be1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_left,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_right,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_return_output);

-- result_MUX_uxn_opcodes_h_l1068_c7_c06f
result_MUX_uxn_opcodes_h_l1068_c7_c06f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1068_c7_c06f_cond,
result_MUX_uxn_opcodes_h_l1068_c7_c06f_iftrue,
result_MUX_uxn_opcodes_h_l1068_c7_c06f_iffalse,
result_MUX_uxn_opcodes_h_l1068_c7_c06f_return_output);

-- opc_sft_uxn_opcodes_h_l1068_c39_1754
opc_sft_uxn_opcodes_h_l1068_c39_1754 : entity work.opc_sft_0CLK_db76791a port map (
clk,
opc_sft_uxn_opcodes_h_l1068_c39_1754_CLOCK_ENABLE,
opc_sft_uxn_opcodes_h_l1068_c39_1754_stack_index,
opc_sft_uxn_opcodes_h_l1068_c39_1754_ins,
opc_sft_uxn_opcodes_h_l1068_c39_1754_k,
opc_sft_uxn_opcodes_h_l1068_c39_1754_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_left,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_right,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_return_output);

-- result_MUX_uxn_opcodes_h_l1069_c7_07ce
result_MUX_uxn_opcodes_h_l1069_c7_07ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l1069_c7_07ce_cond,
result_MUX_uxn_opcodes_h_l1069_c7_07ce_iftrue,
result_MUX_uxn_opcodes_h_l1069_c7_07ce_iffalse,
result_MUX_uxn_opcodes_h_l1069_c7_07ce_return_output);

-- opc_sft2_uxn_opcodes_h_l1069_c39_fea1
opc_sft2_uxn_opcodes_h_l1069_c39_fea1 : entity work.opc_sft2_0CLK_effe98ec port map (
clk,
opc_sft2_uxn_opcodes_h_l1069_c39_fea1_CLOCK_ENABLE,
opc_sft2_uxn_opcodes_h_l1069_c39_fea1_stack_index,
opc_sft2_uxn_opcodes_h_l1069_c39_fea1_ins,
opc_sft2_uxn_opcodes_h_l1069_c39_fea1_k,
opc_sft2_uxn_opcodes_h_l1069_c39_fea1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_return_output,
 result_MUX_uxn_opcodes_h_l1000_c2_8540_return_output,
 opc_brk_uxn_opcodes_h_l1000_c34_01cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_return_output,
 result_MUX_uxn_opcodes_h_l1001_c7_1885_return_output,
 opc_jci_uxn_opcodes_h_l1001_c39_26ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_return_output,
 result_MUX_uxn_opcodes_h_l1002_c7_be83_return_output,
 opc_jmi_uxn_opcodes_h_l1002_c39_2298_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_return_output,
 result_MUX_uxn_opcodes_h_l1003_c7_eca6_return_output,
 opc_jsi_uxn_opcodes_h_l1003_c39_c391_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_return_output,
 result_MUX_uxn_opcodes_h_l1004_c7_2cf7_return_output,
 opc_lit_uxn_opcodes_h_l1004_c39_ead2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_return_output,
 result_MUX_uxn_opcodes_h_l1005_c7_9dda_return_output,
 opc_lit2_uxn_opcodes_h_l1005_c39_f328_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_return_output,
 result_MUX_uxn_opcodes_h_l1006_c7_c47e_return_output,
 opc_litr_uxn_opcodes_h_l1006_c39_18ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_return_output,
 result_MUX_uxn_opcodes_h_l1007_c7_73e5_return_output,
 opc_lit2r_uxn_opcodes_h_l1007_c39_4869_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_return_output,
 result_MUX_uxn_opcodes_h_l1008_c7_0a41_return_output,
 opc_inc_uxn_opcodes_h_l1008_c39_4c07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_return_output,
 result_MUX_uxn_opcodes_h_l1009_c7_91b4_return_output,
 opc_inc2_uxn_opcodes_h_l1009_c39_60af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_return_output,
 result_MUX_uxn_opcodes_h_l1010_c7_696c_return_output,
 opc_pop_uxn_opcodes_h_l1010_c39_3f3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_return_output,
 result_MUX_uxn_opcodes_h_l1011_c7_fcac_return_output,
 opc_pop2_uxn_opcodes_h_l1011_c39_8140_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_return_output,
 result_MUX_uxn_opcodes_h_l1012_c7_6cc4_return_output,
 opc_nip_uxn_opcodes_h_l1012_c39_7797_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_return_output,
 result_MUX_uxn_opcodes_h_l1013_c7_c7d6_return_output,
 opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_return_output,
 result_MUX_uxn_opcodes_h_l1014_c7_4fa7_return_output,
 opc_swp_uxn_opcodes_h_l1014_c39_51e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_return_output,
 result_MUX_uxn_opcodes_h_l1015_c7_ef87_return_output,
 opc_swp2_uxn_opcodes_h_l1015_c39_6315_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_return_output,
 result_MUX_uxn_opcodes_h_l1016_c7_d7e0_return_output,
 opc_rot_uxn_opcodes_h_l1016_c39_02bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_return_output,
 result_MUX_uxn_opcodes_h_l1017_c7_ea66_return_output,
 opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_return_output,
 result_MUX_uxn_opcodes_h_l1018_c7_bf6e_return_output,
 opc_dup_uxn_opcodes_h_l1018_c39_441c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_return_output,
 result_MUX_uxn_opcodes_h_l1019_c7_3cd7_return_output,
 opc_dup2_uxn_opcodes_h_l1019_c39_bab0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_return_output,
 result_MUX_uxn_opcodes_h_l1020_c7_8298_return_output,
 opc_ovr_uxn_opcodes_h_l1020_c39_93cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_return_output,
 result_MUX_uxn_opcodes_h_l1021_c7_5295_return_output,
 opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_return_output,
 result_MUX_uxn_opcodes_h_l1022_c7_beb0_return_output,
 opc_equ_uxn_opcodes_h_l1022_c39_8e37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_return_output,
 result_MUX_uxn_opcodes_h_l1023_c7_0752_return_output,
 opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_return_output,
 result_MUX_uxn_opcodes_h_l1024_c7_64f0_return_output,
 opc_neq_uxn_opcodes_h_l1024_c39_dce8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_return_output,
 result_MUX_uxn_opcodes_h_l1025_c7_1a90_return_output,
 opc_neq2_uxn_opcodes_h_l1025_c39_a776_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_return_output,
 result_MUX_uxn_opcodes_h_l1026_c7_25c1_return_output,
 opc_gth_uxn_opcodes_h_l1026_c39_64a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_return_output,
 result_MUX_uxn_opcodes_h_l1027_c7_b341_return_output,
 opc_gth2_uxn_opcodes_h_l1027_c39_9c10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_return_output,
 result_MUX_uxn_opcodes_h_l1028_c7_4a7c_return_output,
 opc_lth_uxn_opcodes_h_l1028_c39_4ca7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_return_output,
 result_MUX_uxn_opcodes_h_l1029_c7_d249_return_output,
 opc_lth2_uxn_opcodes_h_l1029_c39_fe53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_return_output,
 result_MUX_uxn_opcodes_h_l1030_c7_0216_return_output,
 opc_jmp_uxn_opcodes_h_l1030_c39_67d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_return_output,
 result_MUX_uxn_opcodes_h_l1031_c7_d19b_return_output,
 opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_return_output,
 result_MUX_uxn_opcodes_h_l1032_c7_7153_return_output,
 opc_jcn_uxn_opcodes_h_l1032_c39_faf8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_return_output,
 result_MUX_uxn_opcodes_h_l1033_c7_4c65_return_output,
 opc_jcn2_uxn_opcodes_h_l1033_c39_4666_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_return_output,
 result_MUX_uxn_opcodes_h_l1034_c7_5ca3_return_output,
 opc_jsr_uxn_opcodes_h_l1034_c39_4d03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_return_output,
 result_MUX_uxn_opcodes_h_l1035_c7_b08c_return_output,
 opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_return_output,
 result_MUX_uxn_opcodes_h_l1036_c7_86f7_return_output,
 opc_sth_uxn_opcodes_h_l1036_c39_8e27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_return_output,
 result_MUX_uxn_opcodes_h_l1037_c7_8e53_return_output,
 opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_return_output,
 result_MUX_uxn_opcodes_h_l1038_c7_0b30_return_output,
 opc_ldz_uxn_opcodes_h_l1038_c39_09a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_return_output,
 result_MUX_uxn_opcodes_h_l1039_c7_65ef_return_output,
 opc_ldz2_uxn_opcodes_h_l1039_c39_665b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_return_output,
 result_MUX_uxn_opcodes_h_l1040_c7_48b9_return_output,
 opc_stz_uxn_opcodes_h_l1040_c39_b81a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_return_output,
 result_MUX_uxn_opcodes_h_l1041_c7_bc80_return_output,
 opc_stz2_uxn_opcodes_h_l1041_c39_0297_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_return_output,
 result_MUX_uxn_opcodes_h_l1042_c7_02cd_return_output,
 opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_return_output,
 result_MUX_uxn_opcodes_h_l1043_c7_4389_return_output,
 opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_return_output,
 result_MUX_uxn_opcodes_h_l1044_c7_a467_return_output,
 opc_str_uxn_opcodes_h_l1044_c39_8183_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_return_output,
 result_MUX_uxn_opcodes_h_l1045_c7_995e_return_output,
 opc_str2_uxn_opcodes_h_l1045_c39_ed64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_return_output,
 result_MUX_uxn_opcodes_h_l1046_c7_93a6_return_output,
 opc_lda_uxn_opcodes_h_l1046_c39_452f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_return_output,
 result_MUX_uxn_opcodes_h_l1047_c7_aa2a_return_output,
 opc_lda2_uxn_opcodes_h_l1047_c39_822f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_return_output,
 result_MUX_uxn_opcodes_h_l1048_c7_c21d_return_output,
 opc_sta_uxn_opcodes_h_l1048_c39_6e12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_return_output,
 result_MUX_uxn_opcodes_h_l1049_c7_0b4b_return_output,
 opc_sta2_uxn_opcodes_h_l1049_c39_c880_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_return_output,
 result_MUX_uxn_opcodes_h_l1050_c7_8923_return_output,
 opc_dei_uxn_opcodes_h_l1050_c39_5bc3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_return_output,
 result_MUX_uxn_opcodes_h_l1051_c7_be74_return_output,
 opc_dei2_uxn_opcodes_h_l1051_c39_1396_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_return_output,
 result_MUX_uxn_opcodes_h_l1052_c7_6093_return_output,
 opc_deo_uxn_opcodes_h_l1052_c39_7c09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_return_output,
 result_MUX_uxn_opcodes_h_l1053_c7_6eeb_return_output,
 opc_deo2_uxn_opcodes_h_l1053_c39_d550_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_return_output,
 result_MUX_uxn_opcodes_h_l1054_c7_1711_return_output,
 opc_add_uxn_opcodes_h_l1054_c39_13bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_return_output,
 result_MUX_uxn_opcodes_h_l1055_c7_2713_return_output,
 opc_add2_uxn_opcodes_h_l1055_c39_ed35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_return_output,
 result_MUX_uxn_opcodes_h_l1056_c7_2b10_return_output,
 opc_sub_uxn_opcodes_h_l1056_c39_0fdc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_return_output,
 result_MUX_uxn_opcodes_h_l1057_c7_fb69_return_output,
 opc_sub2_uxn_opcodes_h_l1057_c39_343c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_return_output,
 result_MUX_uxn_opcodes_h_l1058_c7_13da_return_output,
 opc_mul_uxn_opcodes_h_l1058_c39_1069_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_return_output,
 result_MUX_uxn_opcodes_h_l1059_c7_217b_return_output,
 opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_return_output,
 result_MUX_uxn_opcodes_h_l1060_c7_e8ea_return_output,
 opc_div_uxn_opcodes_h_l1060_c39_c275_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_return_output,
 result_MUX_uxn_opcodes_h_l1061_c7_7d68_return_output,
 opc_div2_uxn_opcodes_h_l1061_c39_fc84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_return_output,
 result_MUX_uxn_opcodes_h_l1062_c7_014d_return_output,
 opc_and_uxn_opcodes_h_l1062_c39_5672_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_return_output,
 result_MUX_uxn_opcodes_h_l1063_c7_6031_return_output,
 opc_and2_uxn_opcodes_h_l1063_c39_af79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_return_output,
 result_MUX_uxn_opcodes_h_l1064_c7_8a1f_return_output,
 opc_ora_uxn_opcodes_h_l1064_c39_35e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_return_output,
 result_MUX_uxn_opcodes_h_l1065_c7_8781_return_output,
 opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_return_output,
 result_MUX_uxn_opcodes_h_l1066_c7_fd47_return_output,
 opc_eor_uxn_opcodes_h_l1066_c39_7c54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_return_output,
 result_MUX_uxn_opcodes_h_l1067_c7_44a7_return_output,
 opc_eor2_uxn_opcodes_h_l1067_c39_9be1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_return_output,
 result_MUX_uxn_opcodes_h_l1068_c7_c06f_return_output,
 opc_sft_uxn_opcodes_h_l1068_c39_1754_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_return_output,
 result_MUX_uxn_opcodes_h_l1069_c7_07ce_return_output,
 opc_sft2_uxn_opcodes_h_l1069_c39_fea1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_opcode : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_8540_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_8540_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_1885_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_8540_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1000_c2_8540_cond : unsigned(0 downto 0);
 variable VAR_opc_brk_uxn_opcodes_h_l1000_c34_01cb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_1885_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_1885_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_be83_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1001_c7_1885_cond : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_26ab_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_26ab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jci_uxn_opcodes_h_l1001_c39_26ab_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_be83_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_be83_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_eca6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1002_c7_be83_cond : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_2298_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmi_uxn_opcodes_h_l1002_c39_2298_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_eca6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_eca6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_2cf7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1003_c7_eca6_cond : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_c391_ins : unsigned(7 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_c391_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsi_uxn_opcodes_h_l1003_c39_c391_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_2cf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_2cf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_9dda_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1004_c7_2cf7_cond : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_ead2_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_ead2_ins : unsigned(7 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_ead2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit_uxn_opcodes_h_l1004_c39_ead2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_9dda_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_9dda_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_c47e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1005_c7_9dda_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_f328_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_f328_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_f328_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2_uxn_opcodes_h_l1005_c39_f328_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_c47e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_c47e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_73e5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1006_c7_c47e_cond : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_18ec_stack_index : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_18ec_ins : unsigned(7 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_18ec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_litr_uxn_opcodes_h_l1006_c39_18ec_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_73e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_73e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_0a41_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1007_c7_73e5_cond : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4869_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4869_ins : unsigned(7 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4869_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4869_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_0a41_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_0a41_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_91b4_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1008_c7_0a41_cond : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_4c07_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_4c07_ins : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_4c07_k : unsigned(7 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_4c07_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc_uxn_opcodes_h_l1008_c39_4c07_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_91b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_91b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_696c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1009_c7_91b4_cond : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_60af_stack_index : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_60af_ins : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_60af_k : unsigned(7 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_60af_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_inc2_uxn_opcodes_h_l1009_c39_60af_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_696c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_696c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_fcac_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1010_c7_696c_cond : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_3f3a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_3f3a_ins : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_3f3a_k : unsigned(7 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_3f3a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop_uxn_opcodes_h_l1010_c39_3f3a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_fcac_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_fcac_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_6cc4_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1011_c7_fcac_cond : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8140_stack_index : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8140_ins : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8140_k : unsigned(7 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8140_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8140_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_6cc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_6cc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_c7d6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1012_c7_6cc4_cond : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_7797_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_7797_ins : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_7797_k : unsigned(7 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_7797_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip_uxn_opcodes_h_l1012_c39_7797_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_c7d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_c7d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_4fa7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1013_c7_c7d6_cond : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_stack_index : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_ins : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_k : unsigned(7 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_4fa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_4fa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_ef87_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1014_c7_4fa7_cond : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_51e9_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_51e9_ins : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_51e9_k : unsigned(7 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_51e9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp_uxn_opcodes_h_l1014_c39_51e9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_ef87_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_ef87_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_d7e0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1015_c7_ef87_cond : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_6315_stack_index : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_6315_ins : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_6315_k : unsigned(7 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_6315_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_swp2_uxn_opcodes_h_l1015_c39_6315_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_d7e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_d7e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_ea66_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1016_c7_d7e0_cond : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_02bc_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_02bc_ins : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_02bc_k : unsigned(7 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_02bc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot_uxn_opcodes_h_l1016_c39_02bc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_ea66_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_ea66_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_bf6e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1017_c7_ea66_cond : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_stack_index : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_ins : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_k : unsigned(7 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_bf6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_bf6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_3cd7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1018_c7_bf6e_cond : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_441c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_441c_ins : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_441c_k : unsigned(7 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_441c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup_uxn_opcodes_h_l1018_c39_441c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_3cd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_3cd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_8298_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1019_c7_3cd7_cond : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_bab0_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_bab0_ins : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_bab0_k : unsigned(7 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_bab0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dup2_uxn_opcodes_h_l1019_c39_bab0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_8298_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_8298_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_5295_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1020_c7_8298_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_93cd_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_93cd_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_93cd_k : unsigned(7 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_93cd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr_uxn_opcodes_h_l1020_c39_93cd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_5295_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_5295_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_beb0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1021_c7_5295_cond : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_ins : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_k : unsigned(7 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_beb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_beb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_0752_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1022_c7_beb0_cond : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_8e37_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_8e37_ins : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_8e37_k : unsigned(7 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_8e37_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ_uxn_opcodes_h_l1022_c39_8e37_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_0752_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_0752_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_64f0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1023_c7_0752_cond : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_stack_index : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_ins : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_k : unsigned(7 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_64f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_64f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_1a90_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1024_c7_64f0_cond : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_dce8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_dce8_ins : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_dce8_k : unsigned(7 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_dce8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq_uxn_opcodes_h_l1024_c39_dce8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_1a90_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_1a90_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_25c1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1025_c7_1a90_cond : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_a776_stack_index : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_a776_ins : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_a776_k : unsigned(7 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_a776_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_neq2_uxn_opcodes_h_l1025_c39_a776_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_25c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_25c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_b341_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1026_c7_25c1_cond : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_64a6_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_64a6_ins : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_64a6_k : unsigned(7 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_64a6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth_uxn_opcodes_h_l1026_c39_64a6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_b341_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_b341_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_4a7c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1027_c7_b341_cond : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_9c10_stack_index : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_9c10_ins : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_9c10_k : unsigned(7 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_9c10_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_gth2_uxn_opcodes_h_l1027_c39_9c10_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_4a7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_4a7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_d249_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1028_c7_4a7c_cond : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_4ca7_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_4ca7_ins : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_4ca7_k : unsigned(7 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_4ca7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth_uxn_opcodes_h_l1028_c39_4ca7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_d249_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_d249_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_0216_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1029_c7_d249_cond : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_fe53_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_fe53_ins : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_fe53_k : unsigned(7 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_fe53_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lth2_uxn_opcodes_h_l1029_c39_fe53_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_0216_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_0216_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_d19b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1030_c7_0216_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_67d3_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_67d3_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_67d3_k : unsigned(7 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_67d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp_uxn_opcodes_h_l1030_c39_67d3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_d19b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_d19b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_7153_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1031_c7_d19b_cond : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_ins : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_k : unsigned(7 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_7153_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_7153_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_4c65_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1032_c7_7153_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_faf8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_faf8_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_faf8_k : unsigned(7 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_faf8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn_uxn_opcodes_h_l1032_c39_faf8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_4c65_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_4c65_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_5ca3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1033_c7_4c65_cond : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4666_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4666_ins : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4666_k : unsigned(7 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4666_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4666_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_5ca3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_5ca3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_b08c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1034_c7_5ca3_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4d03_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4d03_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4d03_k : unsigned(7 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4d03_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4d03_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_b08c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_b08c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_86f7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1035_c7_b08c_cond : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_stack_index : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_ins : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_k : unsigned(7 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_86f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_86f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_8e53_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1036_c7_86f7_cond : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_8e27_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_8e27_ins : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_8e27_k : unsigned(7 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_8e27_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth_uxn_opcodes_h_l1036_c39_8e27_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_8e53_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_8e53_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_0b30_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1037_c7_8e53_cond : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_ins : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_k : unsigned(7 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_0b30_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_0b30_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_65ef_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1038_c7_0b30_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_09a7_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_09a7_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_09a7_k : unsigned(7 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_09a7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz_uxn_opcodes_h_l1038_c39_09a7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_65ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_65ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_48b9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1039_c7_65ef_cond : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_665b_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_665b_ins : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_665b_k : unsigned(7 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_665b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_665b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_48b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_48b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_bc80_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1040_c7_48b9_cond : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_b81a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_b81a_ins : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_b81a_k : unsigned(7 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_b81a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz_uxn_opcodes_h_l1040_c39_b81a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_bc80_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_bc80_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_02cd_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1041_c7_bc80_cond : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_0297_stack_index : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_0297_ins : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_0297_k : unsigned(7 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_0297_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_stz2_uxn_opcodes_h_l1041_c39_0297_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_02cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_02cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_4389_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1042_c7_02cd_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_k : unsigned(7 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_4389_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_4389_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_a467_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1043_c7_4389_cond : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_ins : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_k : unsigned(7 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_a467_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_a467_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_995e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1044_c7_a467_cond : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_8183_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_8183_ins : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_8183_k : unsigned(7 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_8183_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str_uxn_opcodes_h_l1044_c39_8183_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_995e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_995e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_93a6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1045_c7_995e_cond : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_ed64_stack_index : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_ed64_ins : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_ed64_k : unsigned(7 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_ed64_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_str2_uxn_opcodes_h_l1045_c39_ed64_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_93a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_93a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_aa2a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1046_c7_93a6_cond : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_452f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_452f_ins : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_452f_k : unsigned(7 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_452f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda_uxn_opcodes_h_l1046_c39_452f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_aa2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_aa2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_c21d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1047_c7_aa2a_cond : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_822f_stack_index : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_822f_ins : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_822f_k : unsigned(7 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_822f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_lda2_uxn_opcodes_h_l1047_c39_822f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_c21d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_c21d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_0b4b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1048_c7_c21d_cond : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_6e12_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_6e12_ins : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_6e12_k : unsigned(7 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_6e12_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta_uxn_opcodes_h_l1048_c39_6e12_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_0b4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_0b4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_8923_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1049_c7_0b4b_cond : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c880_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c880_ins : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c880_k : unsigned(7 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c880_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c880_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_8923_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_8923_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_be74_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1050_c7_8923_cond : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_5bc3_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_5bc3_ins : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_5bc3_k : unsigned(7 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_5bc3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei_uxn_opcodes_h_l1050_c39_5bc3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_be74_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_be74_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_6093_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1051_c7_be74_cond : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_1396_stack_index : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_1396_ins : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_1396_k : unsigned(7 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_1396_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_dei2_uxn_opcodes_h_l1051_c39_1396_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_6093_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_6093_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_6eeb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1052_c7_6093_cond : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_7c09_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_7c09_ins : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_7c09_k : unsigned(7 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_7c09_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo_uxn_opcodes_h_l1052_c39_7c09_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_6eeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_6eeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_1711_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1053_c7_6eeb_cond : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d550_stack_index : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d550_ins : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d550_k : unsigned(7 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d550_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d550_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_1711_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_1711_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_2713_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1054_c7_1711_cond : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_13bf_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_13bf_ins : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_13bf_k : unsigned(7 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_13bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add_uxn_opcodes_h_l1054_c39_13bf_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_2713_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_2713_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_2b10_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1055_c7_2713_cond : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_ed35_stack_index : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_ed35_ins : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_ed35_k : unsigned(7 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_ed35_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_add2_uxn_opcodes_h_l1055_c39_ed35_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_2b10_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_2b10_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_fb69_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1056_c7_2b10_cond : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_0fdc_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_0fdc_ins : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_0fdc_k : unsigned(7 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_0fdc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub_uxn_opcodes_h_l1056_c39_0fdc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_fb69_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_fb69_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_13da_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1057_c7_fb69_cond : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_343c_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_343c_ins : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_343c_k : unsigned(7 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_343c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sub2_uxn_opcodes_h_l1057_c39_343c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_13da_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_13da_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_217b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1058_c7_13da_cond : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_1069_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_1069_ins : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_1069_k : unsigned(7 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_1069_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul_uxn_opcodes_h_l1058_c39_1069_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_217b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_217b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_e8ea_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1059_c7_217b_cond : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_ins : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_k : unsigned(7 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_e8ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_e8ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_7d68_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1060_c7_e8ea_cond : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_c275_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_c275_ins : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_c275_k : unsigned(7 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_c275_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div_uxn_opcodes_h_l1060_c39_c275_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_7d68_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_7d68_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_014d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1061_c7_7d68_cond : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_fc84_stack_index : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_fc84_ins : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_fc84_k : unsigned(7 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_fc84_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_div2_uxn_opcodes_h_l1061_c39_fc84_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_014d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_014d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_6031_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1062_c7_014d_cond : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_5672_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_5672_ins : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_5672_k : unsigned(7 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_5672_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and_uxn_opcodes_h_l1062_c39_5672_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_6031_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_6031_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_8a1f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1063_c7_6031_cond : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_af79_stack_index : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_af79_ins : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_af79_k : unsigned(7 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_af79_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_and2_uxn_opcodes_h_l1063_c39_af79_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_8a1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_8a1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_8781_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1064_c7_8a1f_cond : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_35e4_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_35e4_ins : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_35e4_k : unsigned(7 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_35e4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora_uxn_opcodes_h_l1064_c39_35e4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_8781_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_8781_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_fd47_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1065_c7_8781_cond : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_stack_index : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_ins : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_k : unsigned(7 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_fd47_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_fd47_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_44a7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1066_c7_fd47_cond : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_7c54_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_7c54_ins : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_7c54_k : unsigned(7 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_7c54_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor_uxn_opcodes_h_l1066_c39_7c54_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_44a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_44a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_c06f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1067_c7_44a7_cond : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9be1_stack_index : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9be1_ins : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9be1_k : unsigned(7 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9be1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9be1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_c06f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_c06f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_07ce_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1068_c7_c06f_cond : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_1754_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_1754_ins : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_1754_k : unsigned(7 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_1754_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft_uxn_opcodes_h_l1068_c39_1754_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_07ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_07ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l1069_c7_07ce_cond : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_fea1_stack_index : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_fea1_ins : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_fea1_k : unsigned(7 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_fea1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_opc_sft2_uxn_opcodes_h_l1069_c39_fea1_return_output : unsigned(0 downto 0);
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_right := to_unsigned(21, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_right := to_unsigned(54, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_right := to_unsigned(18, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_right := to_unsigned(43, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_right := to_unsigned(56, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_right := to_unsigned(45, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_right := to_unsigned(48, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_right := to_unsigned(42, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_right := to_unsigned(249, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_right := to_unsigned(35, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_right := to_unsigned(254, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_right := to_unsigned(58, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_right := to_unsigned(9, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_right := to_unsigned(252, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_right := to_unsigned(29, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_right := to_unsigned(251, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_right := to_unsigned(36, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_right := to_unsigned(30, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_right := to_unsigned(40, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_right := to_unsigned(37, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_right := to_unsigned(41, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_right := to_unsigned(57, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_right := to_unsigned(46, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_right := to_unsigned(38, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_right := to_unsigned(16, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_right := to_unsigned(53, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_right := to_unsigned(55, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_right := to_unsigned(47, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_right := to_unsigned(17, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_right := to_unsigned(62, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_right := to_unsigned(25, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_right := to_unsigned(12, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_right := to_unsigned(39, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_right := to_unsigned(23, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_right := to_unsigned(24, 5);
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_07ce_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_right := to_unsigned(52, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_right := to_unsigned(50, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_right := to_unsigned(253, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_right := to_unsigned(250, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_right := to_unsigned(61, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_right := to_unsigned(44, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_right := to_unsigned(51, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_right := to_unsigned(31, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_right := to_unsigned(20, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_right := to_unsigned(60, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_right := to_unsigned(59, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_right := to_unsigned(33, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_right := to_unsigned(26, 5);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_iffalse := VAR_CLOCK_ENABLE;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_ed35_ins := VAR_ins;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_13bf_ins := VAR_ins;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_af79_ins := VAR_ins;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_5672_ins := VAR_ins;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_1396_ins := VAR_ins;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_5bc3_ins := VAR_ins;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d550_ins := VAR_ins;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_7c09_ins := VAR_ins;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_fc84_ins := VAR_ins;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_c275_ins := VAR_ins;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_bab0_ins := VAR_ins;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_441c_ins := VAR_ins;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9be1_ins := VAR_ins;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_7c54_ins := VAR_ins;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_ins := VAR_ins;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_8e37_ins := VAR_ins;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_9c10_ins := VAR_ins;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_64a6_ins := VAR_ins;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_60af_ins := VAR_ins;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_4c07_ins := VAR_ins;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4666_ins := VAR_ins;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_faf8_ins := VAR_ins;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_ins := VAR_ins;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_67d3_ins := VAR_ins;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_c391_ins := VAR_ins;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_ins := VAR_ins;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4d03_ins := VAR_ins;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_822f_ins := VAR_ins;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_452f_ins := VAR_ins;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_ins := VAR_ins;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_ins := VAR_ins;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_665b_ins := VAR_ins;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_09a7_ins := VAR_ins;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_f328_ins := VAR_ins;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4869_ins := VAR_ins;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_ead2_ins := VAR_ins;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_18ec_ins := VAR_ins;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_fe53_ins := VAR_ins;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_4ca7_ins := VAR_ins;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_ins := VAR_ins;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_1069_ins := VAR_ins;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_a776_ins := VAR_ins;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_dce8_ins := VAR_ins;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_ins := VAR_ins;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_7797_ins := VAR_ins;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_ins := VAR_ins;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_35e4_ins := VAR_ins;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_ins := VAR_ins;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_93cd_ins := VAR_ins;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8140_ins := VAR_ins;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_3f3a_ins := VAR_ins;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_ins := VAR_ins;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_02bc_ins := VAR_ins;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_fea1_ins := VAR_ins;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_1754_ins := VAR_ins;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c880_ins := VAR_ins;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_6e12_ins := VAR_ins;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_ins := VAR_ins;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_8e27_ins := VAR_ins;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_ed64_ins := VAR_ins;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_8183_ins := VAR_ins;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_0297_ins := VAR_ins;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_b81a_ins := VAR_ins;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_343c_ins := VAR_ins;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_0fdc_ins := VAR_ins;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_6315_ins := VAR_ins;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_51e9_ins := VAR_ins;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_ed35_k := VAR_k;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_13bf_k := VAR_k;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_af79_k := VAR_k;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_5672_k := VAR_k;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_1396_k := VAR_k;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_5bc3_k := VAR_k;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d550_k := VAR_k;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_7c09_k := VAR_k;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_fc84_k := VAR_k;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_c275_k := VAR_k;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_bab0_k := VAR_k;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_441c_k := VAR_k;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9be1_k := VAR_k;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_7c54_k := VAR_k;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_k := VAR_k;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_8e37_k := VAR_k;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_9c10_k := VAR_k;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_64a6_k := VAR_k;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_60af_k := VAR_k;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_4c07_k := VAR_k;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4666_k := VAR_k;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_faf8_k := VAR_k;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_k := VAR_k;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_67d3_k := VAR_k;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_k := VAR_k;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4d03_k := VAR_k;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_822f_k := VAR_k;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_452f_k := VAR_k;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_k := VAR_k;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_k := VAR_k;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_665b_k := VAR_k;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_09a7_k := VAR_k;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_fe53_k := VAR_k;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_4ca7_k := VAR_k;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_k := VAR_k;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_1069_k := VAR_k;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_a776_k := VAR_k;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_dce8_k := VAR_k;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_k := VAR_k;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_7797_k := VAR_k;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_k := VAR_k;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_35e4_k := VAR_k;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_k := VAR_k;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_93cd_k := VAR_k;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8140_k := VAR_k;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_3f3a_k := VAR_k;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_k := VAR_k;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_02bc_k := VAR_k;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_fea1_k := VAR_k;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_1754_k := VAR_k;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c880_k := VAR_k;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_6e12_k := VAR_k;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_k := VAR_k;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_8e27_k := VAR_k;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_ed64_k := VAR_k;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_8183_k := VAR_k;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_0297_k := VAR_k;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_b81a_k := VAR_k;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_343c_k := VAR_k;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_0fdc_k := VAR_k;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_6315_k := VAR_k;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_51e9_k := VAR_k;
     REG_VAR_l16 := l16;
     REG_VAR_l8 := l8;
     REG_VAR_n16 := n16;
     REG_VAR_n8 := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_left := VAR_opcode;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_left := VAR_opcode;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_ed35_stack_index := VAR_stack_index;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_13bf_stack_index := VAR_stack_index;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_af79_stack_index := VAR_stack_index;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_5672_stack_index := VAR_stack_index;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_1396_stack_index := VAR_stack_index;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_5bc3_stack_index := VAR_stack_index;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d550_stack_index := VAR_stack_index;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_7c09_stack_index := VAR_stack_index;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_fc84_stack_index := VAR_stack_index;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_c275_stack_index := VAR_stack_index;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_bab0_stack_index := VAR_stack_index;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_441c_stack_index := VAR_stack_index;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9be1_stack_index := VAR_stack_index;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_7c54_stack_index := VAR_stack_index;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_stack_index := VAR_stack_index;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_8e37_stack_index := VAR_stack_index;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_9c10_stack_index := VAR_stack_index;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_64a6_stack_index := VAR_stack_index;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_60af_stack_index := VAR_stack_index;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_4c07_stack_index := VAR_stack_index;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_26ab_stack_index := VAR_stack_index;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4666_stack_index := VAR_stack_index;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_faf8_stack_index := VAR_stack_index;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_stack_index := VAR_stack_index;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_67d3_stack_index := VAR_stack_index;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_stack_index := VAR_stack_index;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4d03_stack_index := VAR_stack_index;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_822f_stack_index := VAR_stack_index;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_452f_stack_index := VAR_stack_index;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_stack_index := VAR_stack_index;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_stack_index := VAR_stack_index;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_665b_stack_index := VAR_stack_index;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_09a7_stack_index := VAR_stack_index;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_f328_stack_index := VAR_stack_index;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4869_stack_index := VAR_stack_index;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_ead2_stack_index := VAR_stack_index;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_18ec_stack_index := VAR_stack_index;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_fe53_stack_index := VAR_stack_index;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_4ca7_stack_index := VAR_stack_index;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_stack_index := VAR_stack_index;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_1069_stack_index := VAR_stack_index;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_a776_stack_index := VAR_stack_index;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_dce8_stack_index := VAR_stack_index;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_stack_index := VAR_stack_index;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_7797_stack_index := VAR_stack_index;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_stack_index := VAR_stack_index;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_35e4_stack_index := VAR_stack_index;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_stack_index := VAR_stack_index;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_93cd_stack_index := VAR_stack_index;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8140_stack_index := VAR_stack_index;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_3f3a_stack_index := VAR_stack_index;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_stack_index := VAR_stack_index;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_02bc_stack_index := VAR_stack_index;
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_fea1_stack_index := VAR_stack_index;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_1754_stack_index := VAR_stack_index;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c880_stack_index := VAR_stack_index;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_6e12_stack_index := VAR_stack_index;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_stack_index := VAR_stack_index;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_8e27_stack_index := VAR_stack_index;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_ed64_stack_index := VAR_stack_index;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_8183_stack_index := VAR_stack_index;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_0297_stack_index := VAR_stack_index;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_b81a_stack_index := VAR_stack_index;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_343c_stack_index := VAR_stack_index;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_0fdc_stack_index := VAR_stack_index;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_6315_stack_index := VAR_stack_index;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_51e9_stack_index := VAR_stack_index;
     REG_VAR_t16 := t16;
     REG_VAR_t8 := t8;
     REG_VAR_tmp16 := tmp16;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_6e93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_1e28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_left;
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_return_output := BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_f111] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_left;
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_return_output := BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_4b22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_left;
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_return_output := BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_3d31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_left;
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_return_output := BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_9b5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_bfad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_3a92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_left;
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_return_output := BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1029_c11_ed05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_left;
     BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_return_output := BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_92c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_15ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_516e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_ddf4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_04f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_f730] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_left;
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_return_output := BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1021_c11_d375] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_left;
     BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_return_output := BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_b20c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1053_c11_729c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_return_output;

     -- opc_brk[uxn_opcodes_h_l1000_c34_01cb] LATENCY=0
     -- Inputs
     -- Outputs
     VAR_opc_brk_uxn_opcodes_h_l1000_c34_01cb_return_output := opc_brk_uxn_opcodes_h_l1000_c34_01cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1036_c11_583a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_fafd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_e1bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_29df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_left;
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_return_output := BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_8728] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_07d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_46dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1007_c11_ae6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_d552] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_left;
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_return_output := BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1057_c11_6182] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_left;
     BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_return_output := BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_c1b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_0666] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_3bd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_6631] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_left;
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_return_output := BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_3358] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_left;
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_return_output := BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1025_c11_1e90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_left;
     BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_return_output := BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_38c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_f242] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_left;
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_return_output := BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_e99a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1022_c11_38a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1012_c11_79cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_ae70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_left;
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_return_output := BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_d3ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_b132] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_left;
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_return_output := BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_f458] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_left;
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_return_output := BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_046f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_e752] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_left;
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_return_output := BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1052_c11_3aa7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_f766] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_left;
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_return_output := BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_9def] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_left;
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_return_output := BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_40d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1034_c11_26b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1027_c11_725e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_266e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1065_c11_2ad4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1032_c11_856f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_d0a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1035_c11_0e18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_left;
     BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_return_output := BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_3183] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_left;
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_return_output := BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_62ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_ff96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_left;
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_return_output := BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1030_c11_cd9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1049_c11_5f3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_4926] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_left;
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_return_output := BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_32c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_05c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_e685] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1024_c11_d5fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_9ae5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1044_c11_2c92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_left;
     BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_return_output := BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_3d45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_left;
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_return_output := BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_1d94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_left;
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_return_output := BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_8540_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_3d31_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_1885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_bfad_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_be83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_4926_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_eca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_e1bb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_2cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_62ea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_9dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1e28_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_c47e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_40d6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_73e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1007_c11_ae6d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_0a41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_b20c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_91b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_f242_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_696c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_d552_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_fcac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_46dc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_6cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1012_c11_79cc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_c7d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_f111_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_4fa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_d3ff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_ef87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_04f3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_d7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_d0a8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_ea66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_4b22_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_bf6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_3358_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_3cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_1d94_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_8298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_9b5a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_5295_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1021_c11_d375_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_beb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1022_c11_38a3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_0752_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6e93_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_64f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1024_c11_d5fa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_1a90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c11_1e90_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_25c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_ae70_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_b341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1027_c11_725e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_4a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_32c2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_d249_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1029_c11_ed05_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_0216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1030_c11_cd9e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_d19b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_e99a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_7153_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c11_856f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_4c65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_15ae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_5ca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c11_26b7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_b08c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1035_c11_0e18_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_86f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1036_c11_583a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_8e53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_6631_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_0b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_29df_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_65ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_3d45_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_48b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_f766_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_bc80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_07d5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_02cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_05c2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_4389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_c1b5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_a467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1044_c11_2c92_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_995e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_266e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_93a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9ae5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_aa2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_f730_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_c21d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_ff96_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_0b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1049_c11_5f3c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_8923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_e685_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_be74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_046f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_6093_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1052_c11_3aa7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_6eeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1053_c11_729c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_1711_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_ddf4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_2713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_516e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_2b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_3183_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_fb69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1057_c11_6182_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_13da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_9def_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_217b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_b132_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_e8ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_f458_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_7d68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_3bd0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_014d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_92c6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_6031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_8728_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_8a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_e752_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_8781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1065_c11_2ad4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_fd47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_38c8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_44a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_0666_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_c06f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_fafd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_07ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_3a92_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_8540_iftrue := VAR_opc_brk_uxn_opcodes_h_l1000_c34_01cb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c7_1885] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c7_1885_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c7_be83] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1001_c1_34aa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c7_be83_return_output;
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_26ab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1001_c1_34aa_return_output;
     -- opc_jci[uxn_opcodes_h_l1001_c39_26ab] LATENCY=0
     -- Clock enable
     opc_jci_uxn_opcodes_h_l1001_c39_26ab_CLOCK_ENABLE <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_26ab_CLOCK_ENABLE;
     -- Inputs
     opc_jci_uxn_opcodes_h_l1001_c39_26ab_stack_index <= VAR_opc_jci_uxn_opcodes_h_l1001_c39_26ab_stack_index;
     -- Outputs
     VAR_opc_jci_uxn_opcodes_h_l1001_c39_26ab_return_output := opc_jci_uxn_opcodes_h_l1001_c39_26ab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c7_eca6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1002_c1_d158] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c7_eca6_return_output;
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_2298_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1002_c1_d158_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_1885_iftrue := VAR_opc_jci_uxn_opcodes_h_l1001_c39_26ab_return_output;
     -- opc_jmi[uxn_opcodes_h_l1002_c39_2298] LATENCY=0
     -- Clock enable
     opc_jmi_uxn_opcodes_h_l1002_c39_2298_CLOCK_ENABLE <= VAR_opc_jmi_uxn_opcodes_h_l1002_c39_2298_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_opc_jmi_uxn_opcodes_h_l1002_c39_2298_return_output := opc_jmi_uxn_opcodes_h_l1002_c39_2298_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c7_2cf7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1003_c1_3853] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c7_2cf7_return_output;
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_c391_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1003_c1_3853_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_be83_iftrue := VAR_opc_jmi_uxn_opcodes_h_l1002_c39_2298_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c7_9dda] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_return_output;

     -- opc_jsi[uxn_opcodes_h_l1003_c39_c391] LATENCY=0
     -- Clock enable
     opc_jsi_uxn_opcodes_h_l1003_c39_c391_CLOCK_ENABLE <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_c391_CLOCK_ENABLE;
     -- Inputs
     opc_jsi_uxn_opcodes_h_l1003_c39_c391_ins <= VAR_opc_jsi_uxn_opcodes_h_l1003_c39_c391_ins;
     -- Outputs
     VAR_opc_jsi_uxn_opcodes_h_l1003_c39_c391_return_output := opc_jsi_uxn_opcodes_h_l1003_c39_c391_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1004_c1_693b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c7_9dda_return_output;
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_ead2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1004_c1_693b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_eca6_iftrue := VAR_opc_jsi_uxn_opcodes_h_l1003_c39_c391_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c7_c47e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_return_output;

     -- opc_lit[uxn_opcodes_h_l1004_c39_ead2] LATENCY=0
     -- Clock enable
     opc_lit_uxn_opcodes_h_l1004_c39_ead2_CLOCK_ENABLE <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_ead2_CLOCK_ENABLE;
     -- Inputs
     opc_lit_uxn_opcodes_h_l1004_c39_ead2_stack_index <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_ead2_stack_index;
     opc_lit_uxn_opcodes_h_l1004_c39_ead2_ins <= VAR_opc_lit_uxn_opcodes_h_l1004_c39_ead2_ins;
     -- Outputs
     VAR_opc_lit_uxn_opcodes_h_l1004_c39_ead2_return_output := opc_lit_uxn_opcodes_h_l1004_c39_ead2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1005_c1_0cda] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c7_c47e_return_output;
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_f328_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1005_c1_0cda_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_2cf7_iftrue := VAR_opc_lit_uxn_opcodes_h_l1004_c39_ead2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1006_c1_fcd5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_return_output;

     -- opc_lit2[uxn_opcodes_h_l1005_c39_f328] LATENCY=0
     -- Clock enable
     opc_lit2_uxn_opcodes_h_l1005_c39_f328_CLOCK_ENABLE <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_f328_CLOCK_ENABLE;
     -- Inputs
     opc_lit2_uxn_opcodes_h_l1005_c39_f328_stack_index <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_f328_stack_index;
     opc_lit2_uxn_opcodes_h_l1005_c39_f328_ins <= VAR_opc_lit2_uxn_opcodes_h_l1005_c39_f328_ins;
     -- Outputs
     VAR_opc_lit2_uxn_opcodes_h_l1005_c39_f328_return_output := opc_lit2_uxn_opcodes_h_l1005_c39_f328_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c7_73e5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c7_73e5_return_output;
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_18ec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1006_c1_fcd5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_9dda_iftrue := VAR_opc_lit2_uxn_opcodes_h_l1005_c39_f328_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1007_c1_bbc3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c7_0a41] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_return_output;

     -- opc_litr[uxn_opcodes_h_l1006_c39_18ec] LATENCY=0
     -- Clock enable
     opc_litr_uxn_opcodes_h_l1006_c39_18ec_CLOCK_ENABLE <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_18ec_CLOCK_ENABLE;
     -- Inputs
     opc_litr_uxn_opcodes_h_l1006_c39_18ec_stack_index <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_18ec_stack_index;
     opc_litr_uxn_opcodes_h_l1006_c39_18ec_ins <= VAR_opc_litr_uxn_opcodes_h_l1006_c39_18ec_ins;
     -- Outputs
     VAR_opc_litr_uxn_opcodes_h_l1006_c39_18ec_return_output := opc_litr_uxn_opcodes_h_l1006_c39_18ec_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c7_0a41_return_output;
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4869_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1007_c1_bbc3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_c47e_iftrue := VAR_opc_litr_uxn_opcodes_h_l1006_c39_18ec_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1008_c1_f73f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c7_91b4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_return_output;

     -- opc_lit2r[uxn_opcodes_h_l1007_c39_4869] LATENCY=0
     -- Clock enable
     opc_lit2r_uxn_opcodes_h_l1007_c39_4869_CLOCK_ENABLE <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4869_CLOCK_ENABLE;
     -- Inputs
     opc_lit2r_uxn_opcodes_h_l1007_c39_4869_stack_index <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4869_stack_index;
     opc_lit2r_uxn_opcodes_h_l1007_c39_4869_ins <= VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4869_ins;
     -- Outputs
     VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4869_return_output := opc_lit2r_uxn_opcodes_h_l1007_c39_4869_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c7_91b4_return_output;
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_4c07_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1008_c1_f73f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_73e5_iftrue := VAR_opc_lit2r_uxn_opcodes_h_l1007_c39_4869_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1009_c1_d9d2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_return_output;

     -- opc_inc[uxn_opcodes_h_l1008_c39_4c07] LATENCY=0
     -- Clock enable
     opc_inc_uxn_opcodes_h_l1008_c39_4c07_CLOCK_ENABLE <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_4c07_CLOCK_ENABLE;
     -- Inputs
     opc_inc_uxn_opcodes_h_l1008_c39_4c07_stack_index <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_4c07_stack_index;
     opc_inc_uxn_opcodes_h_l1008_c39_4c07_ins <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_4c07_ins;
     opc_inc_uxn_opcodes_h_l1008_c39_4c07_k <= VAR_opc_inc_uxn_opcodes_h_l1008_c39_4c07_k;
     -- Outputs
     VAR_opc_inc_uxn_opcodes_h_l1008_c39_4c07_return_output := opc_inc_uxn_opcodes_h_l1008_c39_4c07_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c7_696c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c7_696c_return_output;
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_60af_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1009_c1_d9d2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_0a41_iftrue := VAR_opc_inc_uxn_opcodes_h_l1008_c39_4c07_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1010_c1_4e47] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c7_fcac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_return_output;

     -- opc_inc2[uxn_opcodes_h_l1009_c39_60af] LATENCY=0
     -- Clock enable
     opc_inc2_uxn_opcodes_h_l1009_c39_60af_CLOCK_ENABLE <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_60af_CLOCK_ENABLE;
     -- Inputs
     opc_inc2_uxn_opcodes_h_l1009_c39_60af_stack_index <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_60af_stack_index;
     opc_inc2_uxn_opcodes_h_l1009_c39_60af_ins <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_60af_ins;
     opc_inc2_uxn_opcodes_h_l1009_c39_60af_k <= VAR_opc_inc2_uxn_opcodes_h_l1009_c39_60af_k;
     -- Outputs
     VAR_opc_inc2_uxn_opcodes_h_l1009_c39_60af_return_output := opc_inc2_uxn_opcodes_h_l1009_c39_60af_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c7_fcac_return_output;
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_3f3a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1010_c1_4e47_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_91b4_iftrue := VAR_opc_inc2_uxn_opcodes_h_l1009_c39_60af_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1011_c1_913a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c7_6cc4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_return_output;

     -- opc_pop[uxn_opcodes_h_l1010_c39_3f3a] LATENCY=0
     -- Clock enable
     opc_pop_uxn_opcodes_h_l1010_c39_3f3a_CLOCK_ENABLE <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_3f3a_CLOCK_ENABLE;
     -- Inputs
     opc_pop_uxn_opcodes_h_l1010_c39_3f3a_stack_index <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_3f3a_stack_index;
     opc_pop_uxn_opcodes_h_l1010_c39_3f3a_ins <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_3f3a_ins;
     opc_pop_uxn_opcodes_h_l1010_c39_3f3a_k <= VAR_opc_pop_uxn_opcodes_h_l1010_c39_3f3a_k;
     -- Outputs
     VAR_opc_pop_uxn_opcodes_h_l1010_c39_3f3a_return_output := opc_pop_uxn_opcodes_h_l1010_c39_3f3a_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c7_6cc4_return_output;
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8140_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1011_c1_913a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_696c_iftrue := VAR_opc_pop_uxn_opcodes_h_l1010_c39_3f3a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c7_c7d6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1012_c1_8e84] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_return_output;

     -- opc_pop2[uxn_opcodes_h_l1011_c39_8140] LATENCY=0
     -- Clock enable
     opc_pop2_uxn_opcodes_h_l1011_c39_8140_CLOCK_ENABLE <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8140_CLOCK_ENABLE;
     -- Inputs
     opc_pop2_uxn_opcodes_h_l1011_c39_8140_stack_index <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8140_stack_index;
     opc_pop2_uxn_opcodes_h_l1011_c39_8140_ins <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8140_ins;
     opc_pop2_uxn_opcodes_h_l1011_c39_8140_k <= VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8140_k;
     -- Outputs
     VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8140_return_output := opc_pop2_uxn_opcodes_h_l1011_c39_8140_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c7_c7d6_return_output;
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_7797_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1012_c1_8e84_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_fcac_iftrue := VAR_opc_pop2_uxn_opcodes_h_l1011_c39_8140_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c7_4fa7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1013_c1_5b60] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_return_output;

     -- opc_nip[uxn_opcodes_h_l1012_c39_7797] LATENCY=0
     -- Clock enable
     opc_nip_uxn_opcodes_h_l1012_c39_7797_CLOCK_ENABLE <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_7797_CLOCK_ENABLE;
     -- Inputs
     opc_nip_uxn_opcodes_h_l1012_c39_7797_stack_index <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_7797_stack_index;
     opc_nip_uxn_opcodes_h_l1012_c39_7797_ins <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_7797_ins;
     opc_nip_uxn_opcodes_h_l1012_c39_7797_k <= VAR_opc_nip_uxn_opcodes_h_l1012_c39_7797_k;
     -- Outputs
     VAR_opc_nip_uxn_opcodes_h_l1012_c39_7797_return_output := opc_nip_uxn_opcodes_h_l1012_c39_7797_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c7_4fa7_return_output;
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1013_c1_5b60_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_6cc4_iftrue := VAR_opc_nip_uxn_opcodes_h_l1012_c39_7797_return_output;
     -- opc_nip2[uxn_opcodes_h_l1013_c39_a8cd] LATENCY=0
     -- Clock enable
     opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_CLOCK_ENABLE <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_CLOCK_ENABLE;
     -- Inputs
     opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_stack_index <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_stack_index;
     opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_ins <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_ins;
     opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_k <= VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_k;
     -- Outputs
     VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_return_output := opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1014_c1_f132] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c7_ef87] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c7_ef87_return_output;
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_51e9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1014_c1_f132_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_c7d6_iftrue := VAR_opc_nip2_uxn_opcodes_h_l1013_c39_a8cd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1015_c1_f587] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_return_output;

     -- opc_swp[uxn_opcodes_h_l1014_c39_51e9] LATENCY=0
     -- Clock enable
     opc_swp_uxn_opcodes_h_l1014_c39_51e9_CLOCK_ENABLE <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_51e9_CLOCK_ENABLE;
     -- Inputs
     opc_swp_uxn_opcodes_h_l1014_c39_51e9_stack_index <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_51e9_stack_index;
     opc_swp_uxn_opcodes_h_l1014_c39_51e9_ins <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_51e9_ins;
     opc_swp_uxn_opcodes_h_l1014_c39_51e9_k <= VAR_opc_swp_uxn_opcodes_h_l1014_c39_51e9_k;
     -- Outputs
     VAR_opc_swp_uxn_opcodes_h_l1014_c39_51e9_return_output := opc_swp_uxn_opcodes_h_l1014_c39_51e9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c7_d7e0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c7_d7e0_return_output;
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_6315_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1015_c1_f587_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_4fa7_iftrue := VAR_opc_swp_uxn_opcodes_h_l1014_c39_51e9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c7_ea66] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1016_c1_bf8e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_return_output;

     -- opc_swp2[uxn_opcodes_h_l1015_c39_6315] LATENCY=0
     -- Clock enable
     opc_swp2_uxn_opcodes_h_l1015_c39_6315_CLOCK_ENABLE <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_6315_CLOCK_ENABLE;
     -- Inputs
     opc_swp2_uxn_opcodes_h_l1015_c39_6315_stack_index <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_6315_stack_index;
     opc_swp2_uxn_opcodes_h_l1015_c39_6315_ins <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_6315_ins;
     opc_swp2_uxn_opcodes_h_l1015_c39_6315_k <= VAR_opc_swp2_uxn_opcodes_h_l1015_c39_6315_k;
     -- Outputs
     VAR_opc_swp2_uxn_opcodes_h_l1015_c39_6315_return_output := opc_swp2_uxn_opcodes_h_l1015_c39_6315_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c7_ea66_return_output;
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_02bc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1016_c1_bf8e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_ef87_iftrue := VAR_opc_swp2_uxn_opcodes_h_l1015_c39_6315_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c7_bf6e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_return_output;

     -- opc_rot[uxn_opcodes_h_l1016_c39_02bc] LATENCY=0
     -- Clock enable
     opc_rot_uxn_opcodes_h_l1016_c39_02bc_CLOCK_ENABLE <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_02bc_CLOCK_ENABLE;
     -- Inputs
     opc_rot_uxn_opcodes_h_l1016_c39_02bc_stack_index <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_02bc_stack_index;
     opc_rot_uxn_opcodes_h_l1016_c39_02bc_ins <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_02bc_ins;
     opc_rot_uxn_opcodes_h_l1016_c39_02bc_k <= VAR_opc_rot_uxn_opcodes_h_l1016_c39_02bc_k;
     -- Outputs
     VAR_opc_rot_uxn_opcodes_h_l1016_c39_02bc_return_output := opc_rot_uxn_opcodes_h_l1016_c39_02bc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1017_c1_fec1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c7_bf6e_return_output;
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1017_c1_fec1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_d7e0_iftrue := VAR_opc_rot_uxn_opcodes_h_l1016_c39_02bc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c7_3cd7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_return_output;

     -- opc_rot2[uxn_opcodes_h_l1017_c39_1d9d] LATENCY=0
     -- Clock enable
     opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_CLOCK_ENABLE <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_CLOCK_ENABLE;
     -- Inputs
     opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_stack_index <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_stack_index;
     opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_ins <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_ins;
     opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_k <= VAR_opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_k;
     -- Outputs
     VAR_opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_return_output := opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1018_c1_b966] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c7_3cd7_return_output;
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_441c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1018_c1_b966_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_ea66_iftrue := VAR_opc_rot2_uxn_opcodes_h_l1017_c39_1d9d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c7_8298] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_return_output;

     -- opc_dup[uxn_opcodes_h_l1018_c39_441c] LATENCY=0
     -- Clock enable
     opc_dup_uxn_opcodes_h_l1018_c39_441c_CLOCK_ENABLE <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_441c_CLOCK_ENABLE;
     -- Inputs
     opc_dup_uxn_opcodes_h_l1018_c39_441c_stack_index <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_441c_stack_index;
     opc_dup_uxn_opcodes_h_l1018_c39_441c_ins <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_441c_ins;
     opc_dup_uxn_opcodes_h_l1018_c39_441c_k <= VAR_opc_dup_uxn_opcodes_h_l1018_c39_441c_k;
     -- Outputs
     VAR_opc_dup_uxn_opcodes_h_l1018_c39_441c_return_output := opc_dup_uxn_opcodes_h_l1018_c39_441c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1019_c1_80ba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c7_8298_return_output;
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_bab0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1019_c1_80ba_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_bf6e_iftrue := VAR_opc_dup_uxn_opcodes_h_l1018_c39_441c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c7_5295] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_return_output;

     -- opc_dup2[uxn_opcodes_h_l1019_c39_bab0] LATENCY=0
     -- Clock enable
     opc_dup2_uxn_opcodes_h_l1019_c39_bab0_CLOCK_ENABLE <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_bab0_CLOCK_ENABLE;
     -- Inputs
     opc_dup2_uxn_opcodes_h_l1019_c39_bab0_stack_index <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_bab0_stack_index;
     opc_dup2_uxn_opcodes_h_l1019_c39_bab0_ins <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_bab0_ins;
     opc_dup2_uxn_opcodes_h_l1019_c39_bab0_k <= VAR_opc_dup2_uxn_opcodes_h_l1019_c39_bab0_k;
     -- Outputs
     VAR_opc_dup2_uxn_opcodes_h_l1019_c39_bab0_return_output := opc_dup2_uxn_opcodes_h_l1019_c39_bab0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1020_c1_527f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c7_5295_return_output;
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_93cd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1020_c1_527f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_3cd7_iftrue := VAR_opc_dup2_uxn_opcodes_h_l1019_c39_bab0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c7_beb0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1021_c1_cb9e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_return_output;

     -- opc_ovr[uxn_opcodes_h_l1020_c39_93cd] LATENCY=0
     -- Clock enable
     opc_ovr_uxn_opcodes_h_l1020_c39_93cd_CLOCK_ENABLE <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_93cd_CLOCK_ENABLE;
     -- Inputs
     opc_ovr_uxn_opcodes_h_l1020_c39_93cd_stack_index <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_93cd_stack_index;
     opc_ovr_uxn_opcodes_h_l1020_c39_93cd_ins <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_93cd_ins;
     opc_ovr_uxn_opcodes_h_l1020_c39_93cd_k <= VAR_opc_ovr_uxn_opcodes_h_l1020_c39_93cd_k;
     -- Outputs
     VAR_opc_ovr_uxn_opcodes_h_l1020_c39_93cd_return_output := opc_ovr_uxn_opcodes_h_l1020_c39_93cd_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c7_beb0_return_output;
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1021_c1_cb9e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_8298_iftrue := VAR_opc_ovr_uxn_opcodes_h_l1020_c39_93cd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1022_c1_0806] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c7_0752] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_return_output;

     -- opc_ovr2[uxn_opcodes_h_l1021_c39_d0c0] LATENCY=0
     -- Clock enable
     opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_CLOCK_ENABLE <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_CLOCK_ENABLE;
     -- Inputs
     opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_stack_index <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_stack_index;
     opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_ins <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_ins;
     opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_k <= VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_k;
     -- Outputs
     VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_return_output := opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c7_0752_return_output;
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_8e37_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1022_c1_0806_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_5295_iftrue := VAR_opc_ovr2_uxn_opcodes_h_l1021_c39_d0c0_return_output;
     -- opc_equ[uxn_opcodes_h_l1022_c39_8e37] LATENCY=0
     -- Clock enable
     opc_equ_uxn_opcodes_h_l1022_c39_8e37_CLOCK_ENABLE <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_8e37_CLOCK_ENABLE;
     -- Inputs
     opc_equ_uxn_opcodes_h_l1022_c39_8e37_stack_index <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_8e37_stack_index;
     opc_equ_uxn_opcodes_h_l1022_c39_8e37_ins <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_8e37_ins;
     opc_equ_uxn_opcodes_h_l1022_c39_8e37_k <= VAR_opc_equ_uxn_opcodes_h_l1022_c39_8e37_k;
     -- Outputs
     VAR_opc_equ_uxn_opcodes_h_l1022_c39_8e37_return_output := opc_equ_uxn_opcodes_h_l1022_c39_8e37_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c7_64f0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1023_c1_46f8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c7_64f0_return_output;
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1023_c1_46f8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_beb0_iftrue := VAR_opc_equ_uxn_opcodes_h_l1022_c39_8e37_return_output;
     -- opc_equ2[uxn_opcodes_h_l1023_c39_cc9e] LATENCY=0
     -- Clock enable
     opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_CLOCK_ENABLE <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_CLOCK_ENABLE;
     -- Inputs
     opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_stack_index <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_stack_index;
     opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_ins <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_ins;
     opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_k <= VAR_opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_k;
     -- Outputs
     VAR_opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_return_output := opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c7_1a90] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1024_c1_8bfb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c7_1a90_return_output;
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_dce8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1024_c1_8bfb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_0752_iftrue := VAR_opc_equ2_uxn_opcodes_h_l1023_c39_cc9e_return_output;
     -- opc_neq[uxn_opcodes_h_l1024_c39_dce8] LATENCY=0
     -- Clock enable
     opc_neq_uxn_opcodes_h_l1024_c39_dce8_CLOCK_ENABLE <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_dce8_CLOCK_ENABLE;
     -- Inputs
     opc_neq_uxn_opcodes_h_l1024_c39_dce8_stack_index <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_dce8_stack_index;
     opc_neq_uxn_opcodes_h_l1024_c39_dce8_ins <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_dce8_ins;
     opc_neq_uxn_opcodes_h_l1024_c39_dce8_k <= VAR_opc_neq_uxn_opcodes_h_l1024_c39_dce8_k;
     -- Outputs
     VAR_opc_neq_uxn_opcodes_h_l1024_c39_dce8_return_output := opc_neq_uxn_opcodes_h_l1024_c39_dce8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1025_c1_1933] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c7_25c1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c7_25c1_return_output;
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_a776_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1025_c1_1933_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_64f0_iftrue := VAR_opc_neq_uxn_opcodes_h_l1024_c39_dce8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c7_b341] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1026_c1_ad0d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_return_output;

     -- opc_neq2[uxn_opcodes_h_l1025_c39_a776] LATENCY=0
     -- Clock enable
     opc_neq2_uxn_opcodes_h_l1025_c39_a776_CLOCK_ENABLE <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_a776_CLOCK_ENABLE;
     -- Inputs
     opc_neq2_uxn_opcodes_h_l1025_c39_a776_stack_index <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_a776_stack_index;
     opc_neq2_uxn_opcodes_h_l1025_c39_a776_ins <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_a776_ins;
     opc_neq2_uxn_opcodes_h_l1025_c39_a776_k <= VAR_opc_neq2_uxn_opcodes_h_l1025_c39_a776_k;
     -- Outputs
     VAR_opc_neq2_uxn_opcodes_h_l1025_c39_a776_return_output := opc_neq2_uxn_opcodes_h_l1025_c39_a776_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c7_b341_return_output;
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_64a6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1026_c1_ad0d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_1a90_iftrue := VAR_opc_neq2_uxn_opcodes_h_l1025_c39_a776_return_output;
     -- opc_gth[uxn_opcodes_h_l1026_c39_64a6] LATENCY=0
     -- Clock enable
     opc_gth_uxn_opcodes_h_l1026_c39_64a6_CLOCK_ENABLE <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_64a6_CLOCK_ENABLE;
     -- Inputs
     opc_gth_uxn_opcodes_h_l1026_c39_64a6_stack_index <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_64a6_stack_index;
     opc_gth_uxn_opcodes_h_l1026_c39_64a6_ins <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_64a6_ins;
     opc_gth_uxn_opcodes_h_l1026_c39_64a6_k <= VAR_opc_gth_uxn_opcodes_h_l1026_c39_64a6_k;
     -- Outputs
     VAR_opc_gth_uxn_opcodes_h_l1026_c39_64a6_return_output := opc_gth_uxn_opcodes_h_l1026_c39_64a6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c7_4a7c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1027_c1_6547] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c7_4a7c_return_output;
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_9c10_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1027_c1_6547_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_25c1_iftrue := VAR_opc_gth_uxn_opcodes_h_l1026_c39_64a6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1028_c1_7f3b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_return_output;

     -- opc_gth2[uxn_opcodes_h_l1027_c39_9c10] LATENCY=0
     -- Clock enable
     opc_gth2_uxn_opcodes_h_l1027_c39_9c10_CLOCK_ENABLE <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_9c10_CLOCK_ENABLE;
     -- Inputs
     opc_gth2_uxn_opcodes_h_l1027_c39_9c10_stack_index <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_9c10_stack_index;
     opc_gth2_uxn_opcodes_h_l1027_c39_9c10_ins <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_9c10_ins;
     opc_gth2_uxn_opcodes_h_l1027_c39_9c10_k <= VAR_opc_gth2_uxn_opcodes_h_l1027_c39_9c10_k;
     -- Outputs
     VAR_opc_gth2_uxn_opcodes_h_l1027_c39_9c10_return_output := opc_gth2_uxn_opcodes_h_l1027_c39_9c10_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c7_d249] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c7_d249_return_output;
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_4ca7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1028_c1_7f3b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_b341_iftrue := VAR_opc_gth2_uxn_opcodes_h_l1027_c39_9c10_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1029_c1_5b15] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c7_0216] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_return_output;

     -- opc_lth[uxn_opcodes_h_l1028_c39_4ca7] LATENCY=0
     -- Clock enable
     opc_lth_uxn_opcodes_h_l1028_c39_4ca7_CLOCK_ENABLE <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_4ca7_CLOCK_ENABLE;
     -- Inputs
     opc_lth_uxn_opcodes_h_l1028_c39_4ca7_stack_index <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_4ca7_stack_index;
     opc_lth_uxn_opcodes_h_l1028_c39_4ca7_ins <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_4ca7_ins;
     opc_lth_uxn_opcodes_h_l1028_c39_4ca7_k <= VAR_opc_lth_uxn_opcodes_h_l1028_c39_4ca7_k;
     -- Outputs
     VAR_opc_lth_uxn_opcodes_h_l1028_c39_4ca7_return_output := opc_lth_uxn_opcodes_h_l1028_c39_4ca7_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c7_0216_return_output;
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_fe53_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1029_c1_5b15_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_4a7c_iftrue := VAR_opc_lth_uxn_opcodes_h_l1028_c39_4ca7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c7_d19b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_return_output;

     -- opc_lth2[uxn_opcodes_h_l1029_c39_fe53] LATENCY=0
     -- Clock enable
     opc_lth2_uxn_opcodes_h_l1029_c39_fe53_CLOCK_ENABLE <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_fe53_CLOCK_ENABLE;
     -- Inputs
     opc_lth2_uxn_opcodes_h_l1029_c39_fe53_stack_index <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_fe53_stack_index;
     opc_lth2_uxn_opcodes_h_l1029_c39_fe53_ins <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_fe53_ins;
     opc_lth2_uxn_opcodes_h_l1029_c39_fe53_k <= VAR_opc_lth2_uxn_opcodes_h_l1029_c39_fe53_k;
     -- Outputs
     VAR_opc_lth2_uxn_opcodes_h_l1029_c39_fe53_return_output := opc_lth2_uxn_opcodes_h_l1029_c39_fe53_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1030_c1_e405] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c7_d19b_return_output;
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_67d3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1030_c1_e405_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_d249_iftrue := VAR_opc_lth2_uxn_opcodes_h_l1029_c39_fe53_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c7_7153] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_return_output;

     -- opc_jmp[uxn_opcodes_h_l1030_c39_67d3] LATENCY=0
     -- Clock enable
     opc_jmp_uxn_opcodes_h_l1030_c39_67d3_CLOCK_ENABLE <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_67d3_CLOCK_ENABLE;
     -- Inputs
     opc_jmp_uxn_opcodes_h_l1030_c39_67d3_stack_index <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_67d3_stack_index;
     opc_jmp_uxn_opcodes_h_l1030_c39_67d3_ins <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_67d3_ins;
     opc_jmp_uxn_opcodes_h_l1030_c39_67d3_k <= VAR_opc_jmp_uxn_opcodes_h_l1030_c39_67d3_k;
     -- Outputs
     VAR_opc_jmp_uxn_opcodes_h_l1030_c39_67d3_return_output := opc_jmp_uxn_opcodes_h_l1030_c39_67d3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1031_c1_0e69] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c7_7153_return_output;
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1031_c1_0e69_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_0216_iftrue := VAR_opc_jmp_uxn_opcodes_h_l1030_c39_67d3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_7014] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c7_4c65] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_return_output;

     -- opc_jmp2[uxn_opcodes_h_l1031_c39_2abe] LATENCY=0
     -- Clock enable
     opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_CLOCK_ENABLE <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_CLOCK_ENABLE;
     -- Inputs
     opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_stack_index <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_stack_index;
     opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_ins <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_ins;
     opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_k <= VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_k;
     -- Outputs
     VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_return_output := opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c7_4c65_return_output;
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_faf8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_7014_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_d19b_iftrue := VAR_opc_jmp2_uxn_opcodes_h_l1031_c39_2abe_return_output;
     -- opc_jcn[uxn_opcodes_h_l1032_c39_faf8] LATENCY=0
     -- Clock enable
     opc_jcn_uxn_opcodes_h_l1032_c39_faf8_CLOCK_ENABLE <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_faf8_CLOCK_ENABLE;
     -- Inputs
     opc_jcn_uxn_opcodes_h_l1032_c39_faf8_stack_index <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_faf8_stack_index;
     opc_jcn_uxn_opcodes_h_l1032_c39_faf8_ins <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_faf8_ins;
     opc_jcn_uxn_opcodes_h_l1032_c39_faf8_k <= VAR_opc_jcn_uxn_opcodes_h_l1032_c39_faf8_k;
     -- Outputs
     VAR_opc_jcn_uxn_opcodes_h_l1032_c39_faf8_return_output := opc_jcn_uxn_opcodes_h_l1032_c39_faf8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c7_5ca3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1033_c1_99e0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c7_5ca3_return_output;
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4666_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1033_c1_99e0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_7153_iftrue := VAR_opc_jcn_uxn_opcodes_h_l1032_c39_faf8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c7_b08c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_efac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_return_output;

     -- opc_jcn2[uxn_opcodes_h_l1033_c39_4666] LATENCY=0
     -- Clock enable
     opc_jcn2_uxn_opcodes_h_l1033_c39_4666_CLOCK_ENABLE <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4666_CLOCK_ENABLE;
     -- Inputs
     opc_jcn2_uxn_opcodes_h_l1033_c39_4666_stack_index <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4666_stack_index;
     opc_jcn2_uxn_opcodes_h_l1033_c39_4666_ins <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4666_ins;
     opc_jcn2_uxn_opcodes_h_l1033_c39_4666_k <= VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4666_k;
     -- Outputs
     VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4666_return_output := opc_jcn2_uxn_opcodes_h_l1033_c39_4666_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c7_b08c_return_output;
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4d03_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_efac_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_4c65_iftrue := VAR_opc_jcn2_uxn_opcodes_h_l1033_c39_4666_return_output;
     -- opc_jsr[uxn_opcodes_h_l1034_c39_4d03] LATENCY=0
     -- Clock enable
     opc_jsr_uxn_opcodes_h_l1034_c39_4d03_CLOCK_ENABLE <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4d03_CLOCK_ENABLE;
     -- Inputs
     opc_jsr_uxn_opcodes_h_l1034_c39_4d03_stack_index <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4d03_stack_index;
     opc_jsr_uxn_opcodes_h_l1034_c39_4d03_ins <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4d03_ins;
     opc_jsr_uxn_opcodes_h_l1034_c39_4d03_k <= VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4d03_k;
     -- Outputs
     VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4d03_return_output := opc_jsr_uxn_opcodes_h_l1034_c39_4d03_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1035_c1_87b3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c7_86f7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c7_86f7_return_output;
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1035_c1_87b3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_5ca3_iftrue := VAR_opc_jsr_uxn_opcodes_h_l1034_c39_4d03_return_output;
     -- opc_jsr2[uxn_opcodes_h_l1035_c39_1c11] LATENCY=0
     -- Clock enable
     opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_CLOCK_ENABLE <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_CLOCK_ENABLE;
     -- Inputs
     opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_stack_index <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_stack_index;
     opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_ins <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_ins;
     opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_k <= VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_k;
     -- Outputs
     VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_return_output := opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c7_8e53] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1036_c1_24cd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c7_8e53_return_output;
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_8e27_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1036_c1_24cd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_b08c_iftrue := VAR_opc_jsr2_uxn_opcodes_h_l1035_c39_1c11_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c7_0b30] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_return_output;

     -- opc_sth[uxn_opcodes_h_l1036_c39_8e27] LATENCY=0
     -- Clock enable
     opc_sth_uxn_opcodes_h_l1036_c39_8e27_CLOCK_ENABLE <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_8e27_CLOCK_ENABLE;
     -- Inputs
     opc_sth_uxn_opcodes_h_l1036_c39_8e27_stack_index <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_8e27_stack_index;
     opc_sth_uxn_opcodes_h_l1036_c39_8e27_ins <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_8e27_ins;
     opc_sth_uxn_opcodes_h_l1036_c39_8e27_k <= VAR_opc_sth_uxn_opcodes_h_l1036_c39_8e27_k;
     -- Outputs
     VAR_opc_sth_uxn_opcodes_h_l1036_c39_8e27_return_output := opc_sth_uxn_opcodes_h_l1036_c39_8e27_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1037_c1_6c4a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c7_0b30_return_output;
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1037_c1_6c4a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_86f7_iftrue := VAR_opc_sth_uxn_opcodes_h_l1036_c39_8e27_return_output;
     -- opc_sth2[uxn_opcodes_h_l1037_c39_3a9f] LATENCY=0
     -- Clock enable
     opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_CLOCK_ENABLE <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_CLOCK_ENABLE;
     -- Inputs
     opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_stack_index <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_stack_index;
     opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_ins <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_ins;
     opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_k <= VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_k;
     -- Outputs
     VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_return_output := opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1038_c1_7c10] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c7_65ef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c7_65ef_return_output;
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_09a7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1038_c1_7c10_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_8e53_iftrue := VAR_opc_sth2_uxn_opcodes_h_l1037_c39_3a9f_return_output;
     -- opc_ldz[uxn_opcodes_h_l1038_c39_09a7] LATENCY=0
     -- Clock enable
     opc_ldz_uxn_opcodes_h_l1038_c39_09a7_CLOCK_ENABLE <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_09a7_CLOCK_ENABLE;
     -- Inputs
     opc_ldz_uxn_opcodes_h_l1038_c39_09a7_stack_index <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_09a7_stack_index;
     opc_ldz_uxn_opcodes_h_l1038_c39_09a7_ins <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_09a7_ins;
     opc_ldz_uxn_opcodes_h_l1038_c39_09a7_k <= VAR_opc_ldz_uxn_opcodes_h_l1038_c39_09a7_k;
     -- Outputs
     VAR_opc_ldz_uxn_opcodes_h_l1038_c39_09a7_return_output := opc_ldz_uxn_opcodes_h_l1038_c39_09a7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c7_48b9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1039_c1_eaf5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c7_48b9_return_output;
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_665b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1039_c1_eaf5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_0b30_iftrue := VAR_opc_ldz_uxn_opcodes_h_l1038_c39_09a7_return_output;
     -- opc_ldz2[uxn_opcodes_h_l1039_c39_665b] LATENCY=0
     -- Clock enable
     opc_ldz2_uxn_opcodes_h_l1039_c39_665b_CLOCK_ENABLE <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_665b_CLOCK_ENABLE;
     -- Inputs
     opc_ldz2_uxn_opcodes_h_l1039_c39_665b_stack_index <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_665b_stack_index;
     opc_ldz2_uxn_opcodes_h_l1039_c39_665b_ins <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_665b_ins;
     opc_ldz2_uxn_opcodes_h_l1039_c39_665b_k <= VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_665b_k;
     -- Outputs
     VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_665b_return_output := opc_ldz2_uxn_opcodes_h_l1039_c39_665b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c7_bc80] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1040_c1_2956] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c7_bc80_return_output;
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_b81a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1040_c1_2956_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_65ef_iftrue := VAR_opc_ldz2_uxn_opcodes_h_l1039_c39_665b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1041_c1_65c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_return_output;

     -- opc_stz[uxn_opcodes_h_l1040_c39_b81a] LATENCY=0
     -- Clock enable
     opc_stz_uxn_opcodes_h_l1040_c39_b81a_CLOCK_ENABLE <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_b81a_CLOCK_ENABLE;
     -- Inputs
     opc_stz_uxn_opcodes_h_l1040_c39_b81a_stack_index <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_b81a_stack_index;
     opc_stz_uxn_opcodes_h_l1040_c39_b81a_ins <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_b81a_ins;
     opc_stz_uxn_opcodes_h_l1040_c39_b81a_k <= VAR_opc_stz_uxn_opcodes_h_l1040_c39_b81a_k;
     -- Outputs
     VAR_opc_stz_uxn_opcodes_h_l1040_c39_b81a_return_output := opc_stz_uxn_opcodes_h_l1040_c39_b81a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c7_02cd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c7_02cd_return_output;
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_0297_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1041_c1_65c8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_48b9_iftrue := VAR_opc_stz_uxn_opcodes_h_l1040_c39_b81a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c7_4389] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_return_output;

     -- opc_stz2[uxn_opcodes_h_l1041_c39_0297] LATENCY=0
     -- Clock enable
     opc_stz2_uxn_opcodes_h_l1041_c39_0297_CLOCK_ENABLE <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_0297_CLOCK_ENABLE;
     -- Inputs
     opc_stz2_uxn_opcodes_h_l1041_c39_0297_stack_index <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_0297_stack_index;
     opc_stz2_uxn_opcodes_h_l1041_c39_0297_ins <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_0297_ins;
     opc_stz2_uxn_opcodes_h_l1041_c39_0297_k <= VAR_opc_stz2_uxn_opcodes_h_l1041_c39_0297_k;
     -- Outputs
     VAR_opc_stz2_uxn_opcodes_h_l1041_c39_0297_return_output := opc_stz2_uxn_opcodes_h_l1041_c39_0297_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1042_c1_ad3e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c7_4389_return_output;
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1042_c1_ad3e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_bc80_iftrue := VAR_opc_stz2_uxn_opcodes_h_l1041_c39_0297_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c7_a467] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1043_c1_64fd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_return_output;

     -- opc_ldr[uxn_opcodes_h_l1042_c39_fe4a] LATENCY=0
     -- Clock enable
     opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_CLOCK_ENABLE <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_CLOCK_ENABLE;
     -- Inputs
     opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_stack_index <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_stack_index;
     opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_ins <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_ins;
     opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_k <= VAR_opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_k;
     -- Outputs
     VAR_opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_return_output := opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c7_a467_return_output;
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1043_c1_64fd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_02cd_iftrue := VAR_opc_ldr_uxn_opcodes_h_l1042_c39_fe4a_return_output;
     -- opc_ldr2[uxn_opcodes_h_l1043_c39_a66a] LATENCY=0
     -- Clock enable
     opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_CLOCK_ENABLE <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_CLOCK_ENABLE;
     -- Inputs
     opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_stack_index <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_stack_index;
     opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_ins <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_ins;
     opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_k <= VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_k;
     -- Outputs
     VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_return_output := opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1044_c1_c42b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c7_995e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c7_995e_return_output;
     VAR_opc_str_uxn_opcodes_h_l1044_c39_8183_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1044_c1_c42b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_4389_iftrue := VAR_opc_ldr2_uxn_opcodes_h_l1043_c39_a66a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1045_c1_e5c0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_return_output;

     -- opc_str[uxn_opcodes_h_l1044_c39_8183] LATENCY=0
     -- Clock enable
     opc_str_uxn_opcodes_h_l1044_c39_8183_CLOCK_ENABLE <= VAR_opc_str_uxn_opcodes_h_l1044_c39_8183_CLOCK_ENABLE;
     -- Inputs
     opc_str_uxn_opcodes_h_l1044_c39_8183_stack_index <= VAR_opc_str_uxn_opcodes_h_l1044_c39_8183_stack_index;
     opc_str_uxn_opcodes_h_l1044_c39_8183_ins <= VAR_opc_str_uxn_opcodes_h_l1044_c39_8183_ins;
     opc_str_uxn_opcodes_h_l1044_c39_8183_k <= VAR_opc_str_uxn_opcodes_h_l1044_c39_8183_k;
     -- Outputs
     VAR_opc_str_uxn_opcodes_h_l1044_c39_8183_return_output := opc_str_uxn_opcodes_h_l1044_c39_8183_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c7_93a6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c7_93a6_return_output;
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_ed64_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1045_c1_e5c0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_a467_iftrue := VAR_opc_str_uxn_opcodes_h_l1044_c39_8183_return_output;
     -- opc_str2[uxn_opcodes_h_l1045_c39_ed64] LATENCY=0
     -- Clock enable
     opc_str2_uxn_opcodes_h_l1045_c39_ed64_CLOCK_ENABLE <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_ed64_CLOCK_ENABLE;
     -- Inputs
     opc_str2_uxn_opcodes_h_l1045_c39_ed64_stack_index <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_ed64_stack_index;
     opc_str2_uxn_opcodes_h_l1045_c39_ed64_ins <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_ed64_ins;
     opc_str2_uxn_opcodes_h_l1045_c39_ed64_k <= VAR_opc_str2_uxn_opcodes_h_l1045_c39_ed64_k;
     -- Outputs
     VAR_opc_str2_uxn_opcodes_h_l1045_c39_ed64_return_output := opc_str2_uxn_opcodes_h_l1045_c39_ed64_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c7_aa2a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1046_c1_95f0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c7_aa2a_return_output;
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_452f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1046_c1_95f0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_995e_iftrue := VAR_opc_str2_uxn_opcodes_h_l1045_c39_ed64_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c7_c21d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_return_output;

     -- opc_lda[uxn_opcodes_h_l1046_c39_452f] LATENCY=0
     -- Clock enable
     opc_lda_uxn_opcodes_h_l1046_c39_452f_CLOCK_ENABLE <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_452f_CLOCK_ENABLE;
     -- Inputs
     opc_lda_uxn_opcodes_h_l1046_c39_452f_stack_index <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_452f_stack_index;
     opc_lda_uxn_opcodes_h_l1046_c39_452f_ins <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_452f_ins;
     opc_lda_uxn_opcodes_h_l1046_c39_452f_k <= VAR_opc_lda_uxn_opcodes_h_l1046_c39_452f_k;
     -- Outputs
     VAR_opc_lda_uxn_opcodes_h_l1046_c39_452f_return_output := opc_lda_uxn_opcodes_h_l1046_c39_452f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1047_c1_b057] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c7_c21d_return_output;
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_822f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1047_c1_b057_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_93a6_iftrue := VAR_opc_lda_uxn_opcodes_h_l1046_c39_452f_return_output;
     -- opc_lda2[uxn_opcodes_h_l1047_c39_822f] LATENCY=0
     -- Clock enable
     opc_lda2_uxn_opcodes_h_l1047_c39_822f_CLOCK_ENABLE <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_822f_CLOCK_ENABLE;
     -- Inputs
     opc_lda2_uxn_opcodes_h_l1047_c39_822f_stack_index <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_822f_stack_index;
     opc_lda2_uxn_opcodes_h_l1047_c39_822f_ins <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_822f_ins;
     opc_lda2_uxn_opcodes_h_l1047_c39_822f_k <= VAR_opc_lda2_uxn_opcodes_h_l1047_c39_822f_k;
     -- Outputs
     VAR_opc_lda2_uxn_opcodes_h_l1047_c39_822f_return_output := opc_lda2_uxn_opcodes_h_l1047_c39_822f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c7_0b4b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1048_c1_85eb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c7_0b4b_return_output;
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_6e12_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1048_c1_85eb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_aa2a_iftrue := VAR_opc_lda2_uxn_opcodes_h_l1047_c39_822f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1049_c1_b110] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c7_8923] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_return_output;

     -- opc_sta[uxn_opcodes_h_l1048_c39_6e12] LATENCY=0
     -- Clock enable
     opc_sta_uxn_opcodes_h_l1048_c39_6e12_CLOCK_ENABLE <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_6e12_CLOCK_ENABLE;
     -- Inputs
     opc_sta_uxn_opcodes_h_l1048_c39_6e12_stack_index <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_6e12_stack_index;
     opc_sta_uxn_opcodes_h_l1048_c39_6e12_ins <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_6e12_ins;
     opc_sta_uxn_opcodes_h_l1048_c39_6e12_k <= VAR_opc_sta_uxn_opcodes_h_l1048_c39_6e12_k;
     -- Outputs
     VAR_opc_sta_uxn_opcodes_h_l1048_c39_6e12_return_output := opc_sta_uxn_opcodes_h_l1048_c39_6e12_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c7_8923_return_output;
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c880_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1049_c1_b110_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_c21d_iftrue := VAR_opc_sta_uxn_opcodes_h_l1048_c39_6e12_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1050_c1_295b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_return_output;

     -- opc_sta2[uxn_opcodes_h_l1049_c39_c880] LATENCY=0
     -- Clock enable
     opc_sta2_uxn_opcodes_h_l1049_c39_c880_CLOCK_ENABLE <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c880_CLOCK_ENABLE;
     -- Inputs
     opc_sta2_uxn_opcodes_h_l1049_c39_c880_stack_index <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c880_stack_index;
     opc_sta2_uxn_opcodes_h_l1049_c39_c880_ins <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c880_ins;
     opc_sta2_uxn_opcodes_h_l1049_c39_c880_k <= VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c880_k;
     -- Outputs
     VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c880_return_output := opc_sta2_uxn_opcodes_h_l1049_c39_c880_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c7_be74] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c7_be74_return_output;
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_5bc3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1050_c1_295b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_0b4b_iftrue := VAR_opc_sta2_uxn_opcodes_h_l1049_c39_c880_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1051_c1_a3b5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c7_6093] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_return_output;

     -- opc_dei[uxn_opcodes_h_l1050_c39_5bc3] LATENCY=0
     -- Clock enable
     opc_dei_uxn_opcodes_h_l1050_c39_5bc3_CLOCK_ENABLE <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_5bc3_CLOCK_ENABLE;
     -- Inputs
     opc_dei_uxn_opcodes_h_l1050_c39_5bc3_stack_index <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_5bc3_stack_index;
     opc_dei_uxn_opcodes_h_l1050_c39_5bc3_ins <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_5bc3_ins;
     opc_dei_uxn_opcodes_h_l1050_c39_5bc3_k <= VAR_opc_dei_uxn_opcodes_h_l1050_c39_5bc3_k;
     -- Outputs
     VAR_opc_dei_uxn_opcodes_h_l1050_c39_5bc3_return_output := opc_dei_uxn_opcodes_h_l1050_c39_5bc3_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c7_6093_return_output;
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_1396_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1051_c1_a3b5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_8923_iftrue := VAR_opc_dei_uxn_opcodes_h_l1050_c39_5bc3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1052_c1_a9ab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c7_6eeb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_return_output;

     -- opc_dei2[uxn_opcodes_h_l1051_c39_1396] LATENCY=0
     -- Clock enable
     opc_dei2_uxn_opcodes_h_l1051_c39_1396_CLOCK_ENABLE <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_1396_CLOCK_ENABLE;
     -- Inputs
     opc_dei2_uxn_opcodes_h_l1051_c39_1396_stack_index <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_1396_stack_index;
     opc_dei2_uxn_opcodes_h_l1051_c39_1396_ins <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_1396_ins;
     opc_dei2_uxn_opcodes_h_l1051_c39_1396_k <= VAR_opc_dei2_uxn_opcodes_h_l1051_c39_1396_k;
     -- Outputs
     VAR_opc_dei2_uxn_opcodes_h_l1051_c39_1396_return_output := opc_dei2_uxn_opcodes_h_l1051_c39_1396_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c7_6eeb_return_output;
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_7c09_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1052_c1_a9ab_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_be74_iftrue := VAR_opc_dei2_uxn_opcodes_h_l1051_c39_1396_return_output;
     -- opc_deo[uxn_opcodes_h_l1052_c39_7c09] LATENCY=0
     -- Clock enable
     opc_deo_uxn_opcodes_h_l1052_c39_7c09_CLOCK_ENABLE <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_7c09_CLOCK_ENABLE;
     -- Inputs
     opc_deo_uxn_opcodes_h_l1052_c39_7c09_stack_index <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_7c09_stack_index;
     opc_deo_uxn_opcodes_h_l1052_c39_7c09_ins <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_7c09_ins;
     opc_deo_uxn_opcodes_h_l1052_c39_7c09_k <= VAR_opc_deo_uxn_opcodes_h_l1052_c39_7c09_k;
     -- Outputs
     VAR_opc_deo_uxn_opcodes_h_l1052_c39_7c09_return_output := opc_deo_uxn_opcodes_h_l1052_c39_7c09_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c7_1711] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1053_c1_b939] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c7_1711_return_output;
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d550_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1053_c1_b939_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_6093_iftrue := VAR_opc_deo_uxn_opcodes_h_l1052_c39_7c09_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c7_2713] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1054_c1_5536] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_return_output;

     -- opc_deo2[uxn_opcodes_h_l1053_c39_d550] LATENCY=0
     -- Clock enable
     opc_deo2_uxn_opcodes_h_l1053_c39_d550_CLOCK_ENABLE <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d550_CLOCK_ENABLE;
     -- Inputs
     opc_deo2_uxn_opcodes_h_l1053_c39_d550_stack_index <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d550_stack_index;
     opc_deo2_uxn_opcodes_h_l1053_c39_d550_ins <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d550_ins;
     opc_deo2_uxn_opcodes_h_l1053_c39_d550_k <= VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d550_k;
     -- Outputs
     VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d550_return_output := opc_deo2_uxn_opcodes_h_l1053_c39_d550_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c7_2713_return_output;
     VAR_opc_add_uxn_opcodes_h_l1054_c39_13bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1054_c1_5536_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_6eeb_iftrue := VAR_opc_deo2_uxn_opcodes_h_l1053_c39_d550_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_b812] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_return_output;

     -- opc_add[uxn_opcodes_h_l1054_c39_13bf] LATENCY=0
     -- Clock enable
     opc_add_uxn_opcodes_h_l1054_c39_13bf_CLOCK_ENABLE <= VAR_opc_add_uxn_opcodes_h_l1054_c39_13bf_CLOCK_ENABLE;
     -- Inputs
     opc_add_uxn_opcodes_h_l1054_c39_13bf_stack_index <= VAR_opc_add_uxn_opcodes_h_l1054_c39_13bf_stack_index;
     opc_add_uxn_opcodes_h_l1054_c39_13bf_ins <= VAR_opc_add_uxn_opcodes_h_l1054_c39_13bf_ins;
     opc_add_uxn_opcodes_h_l1054_c39_13bf_k <= VAR_opc_add_uxn_opcodes_h_l1054_c39_13bf_k;
     -- Outputs
     VAR_opc_add_uxn_opcodes_h_l1054_c39_13bf_return_output := opc_add_uxn_opcodes_h_l1054_c39_13bf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c7_2b10] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c7_2b10_return_output;
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_ed35_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_b812_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_1711_iftrue := VAR_opc_add_uxn_opcodes_h_l1054_c39_13bf_return_output;
     -- opc_add2[uxn_opcodes_h_l1055_c39_ed35] LATENCY=0
     -- Clock enable
     opc_add2_uxn_opcodes_h_l1055_c39_ed35_CLOCK_ENABLE <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_ed35_CLOCK_ENABLE;
     -- Inputs
     opc_add2_uxn_opcodes_h_l1055_c39_ed35_stack_index <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_ed35_stack_index;
     opc_add2_uxn_opcodes_h_l1055_c39_ed35_ins <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_ed35_ins;
     opc_add2_uxn_opcodes_h_l1055_c39_ed35_k <= VAR_opc_add2_uxn_opcodes_h_l1055_c39_ed35_k;
     -- Outputs
     VAR_opc_add2_uxn_opcodes_h_l1055_c39_ed35_return_output := opc_add2_uxn_opcodes_h_l1055_c39_ed35_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c7_fb69] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1056_c1_2807] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c7_fb69_return_output;
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_0fdc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1056_c1_2807_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_2713_iftrue := VAR_opc_add2_uxn_opcodes_h_l1055_c39_ed35_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1057_c1_3c34] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c7_13da] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_return_output;

     -- opc_sub[uxn_opcodes_h_l1056_c39_0fdc] LATENCY=0
     -- Clock enable
     opc_sub_uxn_opcodes_h_l1056_c39_0fdc_CLOCK_ENABLE <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_0fdc_CLOCK_ENABLE;
     -- Inputs
     opc_sub_uxn_opcodes_h_l1056_c39_0fdc_stack_index <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_0fdc_stack_index;
     opc_sub_uxn_opcodes_h_l1056_c39_0fdc_ins <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_0fdc_ins;
     opc_sub_uxn_opcodes_h_l1056_c39_0fdc_k <= VAR_opc_sub_uxn_opcodes_h_l1056_c39_0fdc_k;
     -- Outputs
     VAR_opc_sub_uxn_opcodes_h_l1056_c39_0fdc_return_output := opc_sub_uxn_opcodes_h_l1056_c39_0fdc_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c7_13da_return_output;
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_343c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1057_c1_3c34_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_2b10_iftrue := VAR_opc_sub_uxn_opcodes_h_l1056_c39_0fdc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1058_c1_4598] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c7_217b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_return_output;

     -- opc_sub2[uxn_opcodes_h_l1057_c39_343c] LATENCY=0
     -- Clock enable
     opc_sub2_uxn_opcodes_h_l1057_c39_343c_CLOCK_ENABLE <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_343c_CLOCK_ENABLE;
     -- Inputs
     opc_sub2_uxn_opcodes_h_l1057_c39_343c_stack_index <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_343c_stack_index;
     opc_sub2_uxn_opcodes_h_l1057_c39_343c_ins <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_343c_ins;
     opc_sub2_uxn_opcodes_h_l1057_c39_343c_k <= VAR_opc_sub2_uxn_opcodes_h_l1057_c39_343c_k;
     -- Outputs
     VAR_opc_sub2_uxn_opcodes_h_l1057_c39_343c_return_output := opc_sub2_uxn_opcodes_h_l1057_c39_343c_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c7_217b_return_output;
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_1069_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1058_c1_4598_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_fb69_iftrue := VAR_opc_sub2_uxn_opcodes_h_l1057_c39_343c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_c359] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c7_e8ea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_return_output;

     -- opc_mul[uxn_opcodes_h_l1058_c39_1069] LATENCY=0
     -- Clock enable
     opc_mul_uxn_opcodes_h_l1058_c39_1069_CLOCK_ENABLE <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_1069_CLOCK_ENABLE;
     -- Inputs
     opc_mul_uxn_opcodes_h_l1058_c39_1069_stack_index <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_1069_stack_index;
     opc_mul_uxn_opcodes_h_l1058_c39_1069_ins <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_1069_ins;
     opc_mul_uxn_opcodes_h_l1058_c39_1069_k <= VAR_opc_mul_uxn_opcodes_h_l1058_c39_1069_k;
     -- Outputs
     VAR_opc_mul_uxn_opcodes_h_l1058_c39_1069_return_output := opc_mul_uxn_opcodes_h_l1058_c39_1069_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c7_e8ea_return_output;
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_c359_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_13da_iftrue := VAR_opc_mul_uxn_opcodes_h_l1058_c39_1069_return_output;
     -- opc_mul2[uxn_opcodes_h_l1059_c39_f5d8] LATENCY=0
     -- Clock enable
     opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_CLOCK_ENABLE <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_CLOCK_ENABLE;
     -- Inputs
     opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_stack_index <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_stack_index;
     opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_ins <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_ins;
     opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_k <= VAR_opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_k;
     -- Outputs
     VAR_opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_return_output := opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1060_c1_40b5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c7_7d68] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c7_7d68_return_output;
     VAR_opc_div_uxn_opcodes_h_l1060_c39_c275_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1060_c1_40b5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_217b_iftrue := VAR_opc_mul2_uxn_opcodes_h_l1059_c39_f5d8_return_output;
     -- opc_div[uxn_opcodes_h_l1060_c39_c275] LATENCY=0
     -- Clock enable
     opc_div_uxn_opcodes_h_l1060_c39_c275_CLOCK_ENABLE <= VAR_opc_div_uxn_opcodes_h_l1060_c39_c275_CLOCK_ENABLE;
     -- Inputs
     opc_div_uxn_opcodes_h_l1060_c39_c275_stack_index <= VAR_opc_div_uxn_opcodes_h_l1060_c39_c275_stack_index;
     opc_div_uxn_opcodes_h_l1060_c39_c275_ins <= VAR_opc_div_uxn_opcodes_h_l1060_c39_c275_ins;
     opc_div_uxn_opcodes_h_l1060_c39_c275_k <= VAR_opc_div_uxn_opcodes_h_l1060_c39_c275_k;
     -- Outputs
     VAR_opc_div_uxn_opcodes_h_l1060_c39_c275_return_output := opc_div_uxn_opcodes_h_l1060_c39_c275_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1061_c1_dc35] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c7_014d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c7_014d_return_output;
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_fc84_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1061_c1_dc35_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_e8ea_iftrue := VAR_opc_div_uxn_opcodes_h_l1060_c39_c275_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c7_6031] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1062_c1_6e0a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_return_output;

     -- opc_div2[uxn_opcodes_h_l1061_c39_fc84] LATENCY=0
     -- Clock enable
     opc_div2_uxn_opcodes_h_l1061_c39_fc84_CLOCK_ENABLE <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_fc84_CLOCK_ENABLE;
     -- Inputs
     opc_div2_uxn_opcodes_h_l1061_c39_fc84_stack_index <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_fc84_stack_index;
     opc_div2_uxn_opcodes_h_l1061_c39_fc84_ins <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_fc84_ins;
     opc_div2_uxn_opcodes_h_l1061_c39_fc84_k <= VAR_opc_div2_uxn_opcodes_h_l1061_c39_fc84_k;
     -- Outputs
     VAR_opc_div2_uxn_opcodes_h_l1061_c39_fc84_return_output := opc_div2_uxn_opcodes_h_l1061_c39_fc84_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c7_6031_return_output;
     VAR_opc_and_uxn_opcodes_h_l1062_c39_5672_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1062_c1_6e0a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_7d68_iftrue := VAR_opc_div2_uxn_opcodes_h_l1061_c39_fc84_return_output;
     -- opc_and[uxn_opcodes_h_l1062_c39_5672] LATENCY=0
     -- Clock enable
     opc_and_uxn_opcodes_h_l1062_c39_5672_CLOCK_ENABLE <= VAR_opc_and_uxn_opcodes_h_l1062_c39_5672_CLOCK_ENABLE;
     -- Inputs
     opc_and_uxn_opcodes_h_l1062_c39_5672_stack_index <= VAR_opc_and_uxn_opcodes_h_l1062_c39_5672_stack_index;
     opc_and_uxn_opcodes_h_l1062_c39_5672_ins <= VAR_opc_and_uxn_opcodes_h_l1062_c39_5672_ins;
     opc_and_uxn_opcodes_h_l1062_c39_5672_k <= VAR_opc_and_uxn_opcodes_h_l1062_c39_5672_k;
     -- Outputs
     VAR_opc_and_uxn_opcodes_h_l1062_c39_5672_return_output := opc_and_uxn_opcodes_h_l1062_c39_5672_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c7_8a1f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1063_c1_c2ff] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c7_8a1f_return_output;
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_af79_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1063_c1_c2ff_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_014d_iftrue := VAR_opc_and_uxn_opcodes_h_l1062_c39_5672_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c7_8781] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_return_output;

     -- opc_and2[uxn_opcodes_h_l1063_c39_af79] LATENCY=0
     -- Clock enable
     opc_and2_uxn_opcodes_h_l1063_c39_af79_CLOCK_ENABLE <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_af79_CLOCK_ENABLE;
     -- Inputs
     opc_and2_uxn_opcodes_h_l1063_c39_af79_stack_index <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_af79_stack_index;
     opc_and2_uxn_opcodes_h_l1063_c39_af79_ins <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_af79_ins;
     opc_and2_uxn_opcodes_h_l1063_c39_af79_k <= VAR_opc_and2_uxn_opcodes_h_l1063_c39_af79_k;
     -- Outputs
     VAR_opc_and2_uxn_opcodes_h_l1063_c39_af79_return_output := opc_and2_uxn_opcodes_h_l1063_c39_af79_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1064_c1_09c9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c7_8781_return_output;
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_35e4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1064_c1_09c9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_6031_iftrue := VAR_opc_and2_uxn_opcodes_h_l1063_c39_af79_return_output;
     -- opc_ora[uxn_opcodes_h_l1064_c39_35e4] LATENCY=0
     -- Clock enable
     opc_ora_uxn_opcodes_h_l1064_c39_35e4_CLOCK_ENABLE <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_35e4_CLOCK_ENABLE;
     -- Inputs
     opc_ora_uxn_opcodes_h_l1064_c39_35e4_stack_index <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_35e4_stack_index;
     opc_ora_uxn_opcodes_h_l1064_c39_35e4_ins <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_35e4_ins;
     opc_ora_uxn_opcodes_h_l1064_c39_35e4_k <= VAR_opc_ora_uxn_opcodes_h_l1064_c39_35e4_k;
     -- Outputs
     VAR_opc_ora_uxn_opcodes_h_l1064_c39_35e4_return_output := opc_ora_uxn_opcodes_h_l1064_c39_35e4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c7_fd47] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1065_c1_8baf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c7_fd47_return_output;
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1065_c1_8baf_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_8a1f_iftrue := VAR_opc_ora_uxn_opcodes_h_l1064_c39_35e4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c7_44a7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1066_c1_ee57] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_return_output;

     -- opc_ora2[uxn_opcodes_h_l1065_c39_2dd8] LATENCY=0
     -- Clock enable
     opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_CLOCK_ENABLE <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_CLOCK_ENABLE;
     -- Inputs
     opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_stack_index <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_stack_index;
     opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_ins <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_ins;
     opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_k <= VAR_opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_k;
     -- Outputs
     VAR_opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_return_output := opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c7_44a7_return_output;
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_7c54_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1066_c1_ee57_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_8781_iftrue := VAR_opc_ora2_uxn_opcodes_h_l1065_c39_2dd8_return_output;
     -- opc_eor[uxn_opcodes_h_l1066_c39_7c54] LATENCY=0
     -- Clock enable
     opc_eor_uxn_opcodes_h_l1066_c39_7c54_CLOCK_ENABLE <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_7c54_CLOCK_ENABLE;
     -- Inputs
     opc_eor_uxn_opcodes_h_l1066_c39_7c54_stack_index <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_7c54_stack_index;
     opc_eor_uxn_opcodes_h_l1066_c39_7c54_ins <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_7c54_ins;
     opc_eor_uxn_opcodes_h_l1066_c39_7c54_k <= VAR_opc_eor_uxn_opcodes_h_l1066_c39_7c54_k;
     -- Outputs
     VAR_opc_eor_uxn_opcodes_h_l1066_c39_7c54_return_output := opc_eor_uxn_opcodes_h_l1066_c39_7c54_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_0bf1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c7_c06f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c7_c06f_return_output;
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9be1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_0bf1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_fd47_iftrue := VAR_opc_eor_uxn_opcodes_h_l1066_c39_7c54_return_output;
     -- opc_eor2[uxn_opcodes_h_l1067_c39_9be1] LATENCY=0
     -- Clock enable
     opc_eor2_uxn_opcodes_h_l1067_c39_9be1_CLOCK_ENABLE <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9be1_CLOCK_ENABLE;
     -- Inputs
     opc_eor2_uxn_opcodes_h_l1067_c39_9be1_stack_index <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9be1_stack_index;
     opc_eor2_uxn_opcodes_h_l1067_c39_9be1_ins <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9be1_ins;
     opc_eor2_uxn_opcodes_h_l1067_c39_9be1_k <= VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9be1_k;
     -- Outputs
     VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9be1_return_output := opc_eor2_uxn_opcodes_h_l1067_c39_9be1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1068_c1_d9b5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c7_07ce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_return_output;

     -- Submodule level 70
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c7_07ce_return_output;
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_1754_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1068_c1_d9b5_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_44a7_iftrue := VAR_opc_eor2_uxn_opcodes_h_l1067_c39_9be1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1069_c1_5e72] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_return_output;

     -- opc_sft[uxn_opcodes_h_l1068_c39_1754] LATENCY=0
     -- Clock enable
     opc_sft_uxn_opcodes_h_l1068_c39_1754_CLOCK_ENABLE <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_1754_CLOCK_ENABLE;
     -- Inputs
     opc_sft_uxn_opcodes_h_l1068_c39_1754_stack_index <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_1754_stack_index;
     opc_sft_uxn_opcodes_h_l1068_c39_1754_ins <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_1754_ins;
     opc_sft_uxn_opcodes_h_l1068_c39_1754_k <= VAR_opc_sft_uxn_opcodes_h_l1068_c39_1754_k;
     -- Outputs
     VAR_opc_sft_uxn_opcodes_h_l1068_c39_1754_return_output := opc_sft_uxn_opcodes_h_l1068_c39_1754_return_output;

     -- Submodule level 71
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_fea1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1069_c1_5e72_return_output;
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_c06f_iftrue := VAR_opc_sft_uxn_opcodes_h_l1068_c39_1754_return_output;
     -- opc_sft2[uxn_opcodes_h_l1069_c39_fea1] LATENCY=0
     -- Clock enable
     opc_sft2_uxn_opcodes_h_l1069_c39_fea1_CLOCK_ENABLE <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_fea1_CLOCK_ENABLE;
     -- Inputs
     opc_sft2_uxn_opcodes_h_l1069_c39_fea1_stack_index <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_fea1_stack_index;
     opc_sft2_uxn_opcodes_h_l1069_c39_fea1_ins <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_fea1_ins;
     opc_sft2_uxn_opcodes_h_l1069_c39_fea1_k <= VAR_opc_sft2_uxn_opcodes_h_l1069_c39_fea1_k;
     -- Outputs
     VAR_opc_sft2_uxn_opcodes_h_l1069_c39_fea1_return_output := opc_sft2_uxn_opcodes_h_l1069_c39_fea1_return_output;

     -- Submodule level 72
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_07ce_iftrue := VAR_opc_sft2_uxn_opcodes_h_l1069_c39_fea1_return_output;
     -- result_MUX[uxn_opcodes_h_l1069_c7_07ce] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1069_c7_07ce_cond <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_07ce_cond;
     result_MUX_uxn_opcodes_h_l1069_c7_07ce_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_07ce_iftrue;
     result_MUX_uxn_opcodes_h_l1069_c7_07ce_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1069_c7_07ce_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1069_c7_07ce_return_output := result_MUX_uxn_opcodes_h_l1069_c7_07ce_return_output;

     -- Submodule level 73
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_c06f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1069_c7_07ce_return_output;
     -- result_MUX[uxn_opcodes_h_l1068_c7_c06f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1068_c7_c06f_cond <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_c06f_cond;
     result_MUX_uxn_opcodes_h_l1068_c7_c06f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_c06f_iftrue;
     result_MUX_uxn_opcodes_h_l1068_c7_c06f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1068_c7_c06f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1068_c7_c06f_return_output := result_MUX_uxn_opcodes_h_l1068_c7_c06f_return_output;

     -- Submodule level 74
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_44a7_iffalse := VAR_result_MUX_uxn_opcodes_h_l1068_c7_c06f_return_output;
     -- result_MUX[uxn_opcodes_h_l1067_c7_44a7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1067_c7_44a7_cond <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_44a7_cond;
     result_MUX_uxn_opcodes_h_l1067_c7_44a7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_44a7_iftrue;
     result_MUX_uxn_opcodes_h_l1067_c7_44a7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1067_c7_44a7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1067_c7_44a7_return_output := result_MUX_uxn_opcodes_h_l1067_c7_44a7_return_output;

     -- Submodule level 75
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_fd47_iffalse := VAR_result_MUX_uxn_opcodes_h_l1067_c7_44a7_return_output;
     -- result_MUX[uxn_opcodes_h_l1066_c7_fd47] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1066_c7_fd47_cond <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_fd47_cond;
     result_MUX_uxn_opcodes_h_l1066_c7_fd47_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_fd47_iftrue;
     result_MUX_uxn_opcodes_h_l1066_c7_fd47_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1066_c7_fd47_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1066_c7_fd47_return_output := result_MUX_uxn_opcodes_h_l1066_c7_fd47_return_output;

     -- Submodule level 76
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_8781_iffalse := VAR_result_MUX_uxn_opcodes_h_l1066_c7_fd47_return_output;
     -- result_MUX[uxn_opcodes_h_l1065_c7_8781] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1065_c7_8781_cond <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_8781_cond;
     result_MUX_uxn_opcodes_h_l1065_c7_8781_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_8781_iftrue;
     result_MUX_uxn_opcodes_h_l1065_c7_8781_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1065_c7_8781_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1065_c7_8781_return_output := result_MUX_uxn_opcodes_h_l1065_c7_8781_return_output;

     -- Submodule level 77
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_8a1f_iffalse := VAR_result_MUX_uxn_opcodes_h_l1065_c7_8781_return_output;
     -- result_MUX[uxn_opcodes_h_l1064_c7_8a1f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1064_c7_8a1f_cond <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_8a1f_cond;
     result_MUX_uxn_opcodes_h_l1064_c7_8a1f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_8a1f_iftrue;
     result_MUX_uxn_opcodes_h_l1064_c7_8a1f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1064_c7_8a1f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1064_c7_8a1f_return_output := result_MUX_uxn_opcodes_h_l1064_c7_8a1f_return_output;

     -- Submodule level 78
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_6031_iffalse := VAR_result_MUX_uxn_opcodes_h_l1064_c7_8a1f_return_output;
     -- result_MUX[uxn_opcodes_h_l1063_c7_6031] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1063_c7_6031_cond <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_6031_cond;
     result_MUX_uxn_opcodes_h_l1063_c7_6031_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_6031_iftrue;
     result_MUX_uxn_opcodes_h_l1063_c7_6031_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1063_c7_6031_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1063_c7_6031_return_output := result_MUX_uxn_opcodes_h_l1063_c7_6031_return_output;

     -- Submodule level 79
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_014d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1063_c7_6031_return_output;
     -- result_MUX[uxn_opcodes_h_l1062_c7_014d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1062_c7_014d_cond <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_014d_cond;
     result_MUX_uxn_opcodes_h_l1062_c7_014d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_014d_iftrue;
     result_MUX_uxn_opcodes_h_l1062_c7_014d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1062_c7_014d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1062_c7_014d_return_output := result_MUX_uxn_opcodes_h_l1062_c7_014d_return_output;

     -- Submodule level 80
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_7d68_iffalse := VAR_result_MUX_uxn_opcodes_h_l1062_c7_014d_return_output;
     -- result_MUX[uxn_opcodes_h_l1061_c7_7d68] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1061_c7_7d68_cond <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_7d68_cond;
     result_MUX_uxn_opcodes_h_l1061_c7_7d68_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_7d68_iftrue;
     result_MUX_uxn_opcodes_h_l1061_c7_7d68_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1061_c7_7d68_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1061_c7_7d68_return_output := result_MUX_uxn_opcodes_h_l1061_c7_7d68_return_output;

     -- Submodule level 81
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_e8ea_iffalse := VAR_result_MUX_uxn_opcodes_h_l1061_c7_7d68_return_output;
     -- result_MUX[uxn_opcodes_h_l1060_c7_e8ea] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1060_c7_e8ea_cond <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_e8ea_cond;
     result_MUX_uxn_opcodes_h_l1060_c7_e8ea_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_e8ea_iftrue;
     result_MUX_uxn_opcodes_h_l1060_c7_e8ea_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1060_c7_e8ea_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1060_c7_e8ea_return_output := result_MUX_uxn_opcodes_h_l1060_c7_e8ea_return_output;

     -- Submodule level 82
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_217b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1060_c7_e8ea_return_output;
     -- result_MUX[uxn_opcodes_h_l1059_c7_217b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1059_c7_217b_cond <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_217b_cond;
     result_MUX_uxn_opcodes_h_l1059_c7_217b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_217b_iftrue;
     result_MUX_uxn_opcodes_h_l1059_c7_217b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1059_c7_217b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1059_c7_217b_return_output := result_MUX_uxn_opcodes_h_l1059_c7_217b_return_output;

     -- Submodule level 83
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_13da_iffalse := VAR_result_MUX_uxn_opcodes_h_l1059_c7_217b_return_output;
     -- result_MUX[uxn_opcodes_h_l1058_c7_13da] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1058_c7_13da_cond <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_13da_cond;
     result_MUX_uxn_opcodes_h_l1058_c7_13da_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_13da_iftrue;
     result_MUX_uxn_opcodes_h_l1058_c7_13da_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1058_c7_13da_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1058_c7_13da_return_output := result_MUX_uxn_opcodes_h_l1058_c7_13da_return_output;

     -- Submodule level 84
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_fb69_iffalse := VAR_result_MUX_uxn_opcodes_h_l1058_c7_13da_return_output;
     -- result_MUX[uxn_opcodes_h_l1057_c7_fb69] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1057_c7_fb69_cond <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_fb69_cond;
     result_MUX_uxn_opcodes_h_l1057_c7_fb69_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_fb69_iftrue;
     result_MUX_uxn_opcodes_h_l1057_c7_fb69_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1057_c7_fb69_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1057_c7_fb69_return_output := result_MUX_uxn_opcodes_h_l1057_c7_fb69_return_output;

     -- Submodule level 85
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_2b10_iffalse := VAR_result_MUX_uxn_opcodes_h_l1057_c7_fb69_return_output;
     -- result_MUX[uxn_opcodes_h_l1056_c7_2b10] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1056_c7_2b10_cond <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_2b10_cond;
     result_MUX_uxn_opcodes_h_l1056_c7_2b10_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_2b10_iftrue;
     result_MUX_uxn_opcodes_h_l1056_c7_2b10_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1056_c7_2b10_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1056_c7_2b10_return_output := result_MUX_uxn_opcodes_h_l1056_c7_2b10_return_output;

     -- Submodule level 86
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_2713_iffalse := VAR_result_MUX_uxn_opcodes_h_l1056_c7_2b10_return_output;
     -- result_MUX[uxn_opcodes_h_l1055_c7_2713] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1055_c7_2713_cond <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_2713_cond;
     result_MUX_uxn_opcodes_h_l1055_c7_2713_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_2713_iftrue;
     result_MUX_uxn_opcodes_h_l1055_c7_2713_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1055_c7_2713_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1055_c7_2713_return_output := result_MUX_uxn_opcodes_h_l1055_c7_2713_return_output;

     -- Submodule level 87
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_1711_iffalse := VAR_result_MUX_uxn_opcodes_h_l1055_c7_2713_return_output;
     -- result_MUX[uxn_opcodes_h_l1054_c7_1711] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1054_c7_1711_cond <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_1711_cond;
     result_MUX_uxn_opcodes_h_l1054_c7_1711_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_1711_iftrue;
     result_MUX_uxn_opcodes_h_l1054_c7_1711_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1054_c7_1711_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1054_c7_1711_return_output := result_MUX_uxn_opcodes_h_l1054_c7_1711_return_output;

     -- Submodule level 88
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_6eeb_iffalse := VAR_result_MUX_uxn_opcodes_h_l1054_c7_1711_return_output;
     -- result_MUX[uxn_opcodes_h_l1053_c7_6eeb] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1053_c7_6eeb_cond <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_6eeb_cond;
     result_MUX_uxn_opcodes_h_l1053_c7_6eeb_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_6eeb_iftrue;
     result_MUX_uxn_opcodes_h_l1053_c7_6eeb_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1053_c7_6eeb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1053_c7_6eeb_return_output := result_MUX_uxn_opcodes_h_l1053_c7_6eeb_return_output;

     -- Submodule level 89
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_6093_iffalse := VAR_result_MUX_uxn_opcodes_h_l1053_c7_6eeb_return_output;
     -- result_MUX[uxn_opcodes_h_l1052_c7_6093] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1052_c7_6093_cond <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_6093_cond;
     result_MUX_uxn_opcodes_h_l1052_c7_6093_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_6093_iftrue;
     result_MUX_uxn_opcodes_h_l1052_c7_6093_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1052_c7_6093_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1052_c7_6093_return_output := result_MUX_uxn_opcodes_h_l1052_c7_6093_return_output;

     -- Submodule level 90
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_be74_iffalse := VAR_result_MUX_uxn_opcodes_h_l1052_c7_6093_return_output;
     -- result_MUX[uxn_opcodes_h_l1051_c7_be74] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1051_c7_be74_cond <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_be74_cond;
     result_MUX_uxn_opcodes_h_l1051_c7_be74_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_be74_iftrue;
     result_MUX_uxn_opcodes_h_l1051_c7_be74_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1051_c7_be74_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1051_c7_be74_return_output := result_MUX_uxn_opcodes_h_l1051_c7_be74_return_output;

     -- Submodule level 91
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_8923_iffalse := VAR_result_MUX_uxn_opcodes_h_l1051_c7_be74_return_output;
     -- result_MUX[uxn_opcodes_h_l1050_c7_8923] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1050_c7_8923_cond <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_8923_cond;
     result_MUX_uxn_opcodes_h_l1050_c7_8923_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_8923_iftrue;
     result_MUX_uxn_opcodes_h_l1050_c7_8923_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1050_c7_8923_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1050_c7_8923_return_output := result_MUX_uxn_opcodes_h_l1050_c7_8923_return_output;

     -- Submodule level 92
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_0b4b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1050_c7_8923_return_output;
     -- result_MUX[uxn_opcodes_h_l1049_c7_0b4b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1049_c7_0b4b_cond <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_0b4b_cond;
     result_MUX_uxn_opcodes_h_l1049_c7_0b4b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_0b4b_iftrue;
     result_MUX_uxn_opcodes_h_l1049_c7_0b4b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1049_c7_0b4b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1049_c7_0b4b_return_output := result_MUX_uxn_opcodes_h_l1049_c7_0b4b_return_output;

     -- Submodule level 93
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_c21d_iffalse := VAR_result_MUX_uxn_opcodes_h_l1049_c7_0b4b_return_output;
     -- result_MUX[uxn_opcodes_h_l1048_c7_c21d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1048_c7_c21d_cond <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_c21d_cond;
     result_MUX_uxn_opcodes_h_l1048_c7_c21d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_c21d_iftrue;
     result_MUX_uxn_opcodes_h_l1048_c7_c21d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1048_c7_c21d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1048_c7_c21d_return_output := result_MUX_uxn_opcodes_h_l1048_c7_c21d_return_output;

     -- Submodule level 94
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_aa2a_iffalse := VAR_result_MUX_uxn_opcodes_h_l1048_c7_c21d_return_output;
     -- result_MUX[uxn_opcodes_h_l1047_c7_aa2a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1047_c7_aa2a_cond <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_aa2a_cond;
     result_MUX_uxn_opcodes_h_l1047_c7_aa2a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_aa2a_iftrue;
     result_MUX_uxn_opcodes_h_l1047_c7_aa2a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1047_c7_aa2a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1047_c7_aa2a_return_output := result_MUX_uxn_opcodes_h_l1047_c7_aa2a_return_output;

     -- Submodule level 95
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_93a6_iffalse := VAR_result_MUX_uxn_opcodes_h_l1047_c7_aa2a_return_output;
     -- result_MUX[uxn_opcodes_h_l1046_c7_93a6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1046_c7_93a6_cond <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_93a6_cond;
     result_MUX_uxn_opcodes_h_l1046_c7_93a6_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_93a6_iftrue;
     result_MUX_uxn_opcodes_h_l1046_c7_93a6_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1046_c7_93a6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1046_c7_93a6_return_output := result_MUX_uxn_opcodes_h_l1046_c7_93a6_return_output;

     -- Submodule level 96
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_995e_iffalse := VAR_result_MUX_uxn_opcodes_h_l1046_c7_93a6_return_output;
     -- result_MUX[uxn_opcodes_h_l1045_c7_995e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1045_c7_995e_cond <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_995e_cond;
     result_MUX_uxn_opcodes_h_l1045_c7_995e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_995e_iftrue;
     result_MUX_uxn_opcodes_h_l1045_c7_995e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1045_c7_995e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1045_c7_995e_return_output := result_MUX_uxn_opcodes_h_l1045_c7_995e_return_output;

     -- Submodule level 97
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_a467_iffalse := VAR_result_MUX_uxn_opcodes_h_l1045_c7_995e_return_output;
     -- result_MUX[uxn_opcodes_h_l1044_c7_a467] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1044_c7_a467_cond <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_a467_cond;
     result_MUX_uxn_opcodes_h_l1044_c7_a467_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_a467_iftrue;
     result_MUX_uxn_opcodes_h_l1044_c7_a467_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1044_c7_a467_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1044_c7_a467_return_output := result_MUX_uxn_opcodes_h_l1044_c7_a467_return_output;

     -- Submodule level 98
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_4389_iffalse := VAR_result_MUX_uxn_opcodes_h_l1044_c7_a467_return_output;
     -- result_MUX[uxn_opcodes_h_l1043_c7_4389] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1043_c7_4389_cond <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_4389_cond;
     result_MUX_uxn_opcodes_h_l1043_c7_4389_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_4389_iftrue;
     result_MUX_uxn_opcodes_h_l1043_c7_4389_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1043_c7_4389_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1043_c7_4389_return_output := result_MUX_uxn_opcodes_h_l1043_c7_4389_return_output;

     -- Submodule level 99
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_02cd_iffalse := VAR_result_MUX_uxn_opcodes_h_l1043_c7_4389_return_output;
     -- result_MUX[uxn_opcodes_h_l1042_c7_02cd] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1042_c7_02cd_cond <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_02cd_cond;
     result_MUX_uxn_opcodes_h_l1042_c7_02cd_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_02cd_iftrue;
     result_MUX_uxn_opcodes_h_l1042_c7_02cd_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1042_c7_02cd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1042_c7_02cd_return_output := result_MUX_uxn_opcodes_h_l1042_c7_02cd_return_output;

     -- Submodule level 100
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_bc80_iffalse := VAR_result_MUX_uxn_opcodes_h_l1042_c7_02cd_return_output;
     -- result_MUX[uxn_opcodes_h_l1041_c7_bc80] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1041_c7_bc80_cond <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_bc80_cond;
     result_MUX_uxn_opcodes_h_l1041_c7_bc80_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_bc80_iftrue;
     result_MUX_uxn_opcodes_h_l1041_c7_bc80_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1041_c7_bc80_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1041_c7_bc80_return_output := result_MUX_uxn_opcodes_h_l1041_c7_bc80_return_output;

     -- Submodule level 101
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_48b9_iffalse := VAR_result_MUX_uxn_opcodes_h_l1041_c7_bc80_return_output;
     -- result_MUX[uxn_opcodes_h_l1040_c7_48b9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1040_c7_48b9_cond <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_48b9_cond;
     result_MUX_uxn_opcodes_h_l1040_c7_48b9_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_48b9_iftrue;
     result_MUX_uxn_opcodes_h_l1040_c7_48b9_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1040_c7_48b9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1040_c7_48b9_return_output := result_MUX_uxn_opcodes_h_l1040_c7_48b9_return_output;

     -- Submodule level 102
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_65ef_iffalse := VAR_result_MUX_uxn_opcodes_h_l1040_c7_48b9_return_output;
     -- result_MUX[uxn_opcodes_h_l1039_c7_65ef] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1039_c7_65ef_cond <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_65ef_cond;
     result_MUX_uxn_opcodes_h_l1039_c7_65ef_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_65ef_iftrue;
     result_MUX_uxn_opcodes_h_l1039_c7_65ef_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1039_c7_65ef_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1039_c7_65ef_return_output := result_MUX_uxn_opcodes_h_l1039_c7_65ef_return_output;

     -- Submodule level 103
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_0b30_iffalse := VAR_result_MUX_uxn_opcodes_h_l1039_c7_65ef_return_output;
     -- result_MUX[uxn_opcodes_h_l1038_c7_0b30] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1038_c7_0b30_cond <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_0b30_cond;
     result_MUX_uxn_opcodes_h_l1038_c7_0b30_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_0b30_iftrue;
     result_MUX_uxn_opcodes_h_l1038_c7_0b30_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1038_c7_0b30_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1038_c7_0b30_return_output := result_MUX_uxn_opcodes_h_l1038_c7_0b30_return_output;

     -- Submodule level 104
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_8e53_iffalse := VAR_result_MUX_uxn_opcodes_h_l1038_c7_0b30_return_output;
     -- result_MUX[uxn_opcodes_h_l1037_c7_8e53] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1037_c7_8e53_cond <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_8e53_cond;
     result_MUX_uxn_opcodes_h_l1037_c7_8e53_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_8e53_iftrue;
     result_MUX_uxn_opcodes_h_l1037_c7_8e53_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1037_c7_8e53_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1037_c7_8e53_return_output := result_MUX_uxn_opcodes_h_l1037_c7_8e53_return_output;

     -- Submodule level 105
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_86f7_iffalse := VAR_result_MUX_uxn_opcodes_h_l1037_c7_8e53_return_output;
     -- result_MUX[uxn_opcodes_h_l1036_c7_86f7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1036_c7_86f7_cond <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_86f7_cond;
     result_MUX_uxn_opcodes_h_l1036_c7_86f7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_86f7_iftrue;
     result_MUX_uxn_opcodes_h_l1036_c7_86f7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1036_c7_86f7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1036_c7_86f7_return_output := result_MUX_uxn_opcodes_h_l1036_c7_86f7_return_output;

     -- Submodule level 106
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_b08c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1036_c7_86f7_return_output;
     -- result_MUX[uxn_opcodes_h_l1035_c7_b08c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1035_c7_b08c_cond <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_b08c_cond;
     result_MUX_uxn_opcodes_h_l1035_c7_b08c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_b08c_iftrue;
     result_MUX_uxn_opcodes_h_l1035_c7_b08c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1035_c7_b08c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1035_c7_b08c_return_output := result_MUX_uxn_opcodes_h_l1035_c7_b08c_return_output;

     -- Submodule level 107
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_5ca3_iffalse := VAR_result_MUX_uxn_opcodes_h_l1035_c7_b08c_return_output;
     -- result_MUX[uxn_opcodes_h_l1034_c7_5ca3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1034_c7_5ca3_cond <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_5ca3_cond;
     result_MUX_uxn_opcodes_h_l1034_c7_5ca3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_5ca3_iftrue;
     result_MUX_uxn_opcodes_h_l1034_c7_5ca3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1034_c7_5ca3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1034_c7_5ca3_return_output := result_MUX_uxn_opcodes_h_l1034_c7_5ca3_return_output;

     -- Submodule level 108
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_4c65_iffalse := VAR_result_MUX_uxn_opcodes_h_l1034_c7_5ca3_return_output;
     -- result_MUX[uxn_opcodes_h_l1033_c7_4c65] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1033_c7_4c65_cond <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_4c65_cond;
     result_MUX_uxn_opcodes_h_l1033_c7_4c65_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_4c65_iftrue;
     result_MUX_uxn_opcodes_h_l1033_c7_4c65_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1033_c7_4c65_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1033_c7_4c65_return_output := result_MUX_uxn_opcodes_h_l1033_c7_4c65_return_output;

     -- Submodule level 109
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_7153_iffalse := VAR_result_MUX_uxn_opcodes_h_l1033_c7_4c65_return_output;
     -- result_MUX[uxn_opcodes_h_l1032_c7_7153] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1032_c7_7153_cond <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_7153_cond;
     result_MUX_uxn_opcodes_h_l1032_c7_7153_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_7153_iftrue;
     result_MUX_uxn_opcodes_h_l1032_c7_7153_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1032_c7_7153_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1032_c7_7153_return_output := result_MUX_uxn_opcodes_h_l1032_c7_7153_return_output;

     -- Submodule level 110
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_d19b_iffalse := VAR_result_MUX_uxn_opcodes_h_l1032_c7_7153_return_output;
     -- result_MUX[uxn_opcodes_h_l1031_c7_d19b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1031_c7_d19b_cond <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_d19b_cond;
     result_MUX_uxn_opcodes_h_l1031_c7_d19b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_d19b_iftrue;
     result_MUX_uxn_opcodes_h_l1031_c7_d19b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1031_c7_d19b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1031_c7_d19b_return_output := result_MUX_uxn_opcodes_h_l1031_c7_d19b_return_output;

     -- Submodule level 111
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_0216_iffalse := VAR_result_MUX_uxn_opcodes_h_l1031_c7_d19b_return_output;
     -- result_MUX[uxn_opcodes_h_l1030_c7_0216] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1030_c7_0216_cond <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_0216_cond;
     result_MUX_uxn_opcodes_h_l1030_c7_0216_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_0216_iftrue;
     result_MUX_uxn_opcodes_h_l1030_c7_0216_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1030_c7_0216_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1030_c7_0216_return_output := result_MUX_uxn_opcodes_h_l1030_c7_0216_return_output;

     -- Submodule level 112
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_d249_iffalse := VAR_result_MUX_uxn_opcodes_h_l1030_c7_0216_return_output;
     -- result_MUX[uxn_opcodes_h_l1029_c7_d249] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1029_c7_d249_cond <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_d249_cond;
     result_MUX_uxn_opcodes_h_l1029_c7_d249_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_d249_iftrue;
     result_MUX_uxn_opcodes_h_l1029_c7_d249_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1029_c7_d249_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1029_c7_d249_return_output := result_MUX_uxn_opcodes_h_l1029_c7_d249_return_output;

     -- Submodule level 113
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_4a7c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1029_c7_d249_return_output;
     -- result_MUX[uxn_opcodes_h_l1028_c7_4a7c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1028_c7_4a7c_cond <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_4a7c_cond;
     result_MUX_uxn_opcodes_h_l1028_c7_4a7c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_4a7c_iftrue;
     result_MUX_uxn_opcodes_h_l1028_c7_4a7c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1028_c7_4a7c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1028_c7_4a7c_return_output := result_MUX_uxn_opcodes_h_l1028_c7_4a7c_return_output;

     -- Submodule level 114
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_b341_iffalse := VAR_result_MUX_uxn_opcodes_h_l1028_c7_4a7c_return_output;
     -- result_MUX[uxn_opcodes_h_l1027_c7_b341] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1027_c7_b341_cond <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_b341_cond;
     result_MUX_uxn_opcodes_h_l1027_c7_b341_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_b341_iftrue;
     result_MUX_uxn_opcodes_h_l1027_c7_b341_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1027_c7_b341_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1027_c7_b341_return_output := result_MUX_uxn_opcodes_h_l1027_c7_b341_return_output;

     -- Submodule level 115
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_25c1_iffalse := VAR_result_MUX_uxn_opcodes_h_l1027_c7_b341_return_output;
     -- result_MUX[uxn_opcodes_h_l1026_c7_25c1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1026_c7_25c1_cond <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_25c1_cond;
     result_MUX_uxn_opcodes_h_l1026_c7_25c1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_25c1_iftrue;
     result_MUX_uxn_opcodes_h_l1026_c7_25c1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1026_c7_25c1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1026_c7_25c1_return_output := result_MUX_uxn_opcodes_h_l1026_c7_25c1_return_output;

     -- Submodule level 116
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_1a90_iffalse := VAR_result_MUX_uxn_opcodes_h_l1026_c7_25c1_return_output;
     -- result_MUX[uxn_opcodes_h_l1025_c7_1a90] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1025_c7_1a90_cond <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_1a90_cond;
     result_MUX_uxn_opcodes_h_l1025_c7_1a90_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_1a90_iftrue;
     result_MUX_uxn_opcodes_h_l1025_c7_1a90_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1025_c7_1a90_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1025_c7_1a90_return_output := result_MUX_uxn_opcodes_h_l1025_c7_1a90_return_output;

     -- Submodule level 117
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_64f0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1025_c7_1a90_return_output;
     -- result_MUX[uxn_opcodes_h_l1024_c7_64f0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1024_c7_64f0_cond <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_64f0_cond;
     result_MUX_uxn_opcodes_h_l1024_c7_64f0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_64f0_iftrue;
     result_MUX_uxn_opcodes_h_l1024_c7_64f0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1024_c7_64f0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1024_c7_64f0_return_output := result_MUX_uxn_opcodes_h_l1024_c7_64f0_return_output;

     -- Submodule level 118
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_0752_iffalse := VAR_result_MUX_uxn_opcodes_h_l1024_c7_64f0_return_output;
     -- result_MUX[uxn_opcodes_h_l1023_c7_0752] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1023_c7_0752_cond <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_0752_cond;
     result_MUX_uxn_opcodes_h_l1023_c7_0752_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_0752_iftrue;
     result_MUX_uxn_opcodes_h_l1023_c7_0752_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1023_c7_0752_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1023_c7_0752_return_output := result_MUX_uxn_opcodes_h_l1023_c7_0752_return_output;

     -- Submodule level 119
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_beb0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1023_c7_0752_return_output;
     -- result_MUX[uxn_opcodes_h_l1022_c7_beb0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1022_c7_beb0_cond <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_beb0_cond;
     result_MUX_uxn_opcodes_h_l1022_c7_beb0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_beb0_iftrue;
     result_MUX_uxn_opcodes_h_l1022_c7_beb0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1022_c7_beb0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1022_c7_beb0_return_output := result_MUX_uxn_opcodes_h_l1022_c7_beb0_return_output;

     -- Submodule level 120
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_5295_iffalse := VAR_result_MUX_uxn_opcodes_h_l1022_c7_beb0_return_output;
     -- result_MUX[uxn_opcodes_h_l1021_c7_5295] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1021_c7_5295_cond <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_5295_cond;
     result_MUX_uxn_opcodes_h_l1021_c7_5295_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_5295_iftrue;
     result_MUX_uxn_opcodes_h_l1021_c7_5295_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1021_c7_5295_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1021_c7_5295_return_output := result_MUX_uxn_opcodes_h_l1021_c7_5295_return_output;

     -- Submodule level 121
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_8298_iffalse := VAR_result_MUX_uxn_opcodes_h_l1021_c7_5295_return_output;
     -- result_MUX[uxn_opcodes_h_l1020_c7_8298] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1020_c7_8298_cond <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_8298_cond;
     result_MUX_uxn_opcodes_h_l1020_c7_8298_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_8298_iftrue;
     result_MUX_uxn_opcodes_h_l1020_c7_8298_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1020_c7_8298_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1020_c7_8298_return_output := result_MUX_uxn_opcodes_h_l1020_c7_8298_return_output;

     -- Submodule level 122
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_3cd7_iffalse := VAR_result_MUX_uxn_opcodes_h_l1020_c7_8298_return_output;
     -- result_MUX[uxn_opcodes_h_l1019_c7_3cd7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1019_c7_3cd7_cond <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_3cd7_cond;
     result_MUX_uxn_opcodes_h_l1019_c7_3cd7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_3cd7_iftrue;
     result_MUX_uxn_opcodes_h_l1019_c7_3cd7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1019_c7_3cd7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1019_c7_3cd7_return_output := result_MUX_uxn_opcodes_h_l1019_c7_3cd7_return_output;

     -- Submodule level 123
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_bf6e_iffalse := VAR_result_MUX_uxn_opcodes_h_l1019_c7_3cd7_return_output;
     -- result_MUX[uxn_opcodes_h_l1018_c7_bf6e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1018_c7_bf6e_cond <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_bf6e_cond;
     result_MUX_uxn_opcodes_h_l1018_c7_bf6e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_bf6e_iftrue;
     result_MUX_uxn_opcodes_h_l1018_c7_bf6e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1018_c7_bf6e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1018_c7_bf6e_return_output := result_MUX_uxn_opcodes_h_l1018_c7_bf6e_return_output;

     -- Submodule level 124
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_ea66_iffalse := VAR_result_MUX_uxn_opcodes_h_l1018_c7_bf6e_return_output;
     -- result_MUX[uxn_opcodes_h_l1017_c7_ea66] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1017_c7_ea66_cond <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_ea66_cond;
     result_MUX_uxn_opcodes_h_l1017_c7_ea66_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_ea66_iftrue;
     result_MUX_uxn_opcodes_h_l1017_c7_ea66_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1017_c7_ea66_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1017_c7_ea66_return_output := result_MUX_uxn_opcodes_h_l1017_c7_ea66_return_output;

     -- Submodule level 125
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_d7e0_iffalse := VAR_result_MUX_uxn_opcodes_h_l1017_c7_ea66_return_output;
     -- result_MUX[uxn_opcodes_h_l1016_c7_d7e0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1016_c7_d7e0_cond <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_d7e0_cond;
     result_MUX_uxn_opcodes_h_l1016_c7_d7e0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_d7e0_iftrue;
     result_MUX_uxn_opcodes_h_l1016_c7_d7e0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1016_c7_d7e0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1016_c7_d7e0_return_output := result_MUX_uxn_opcodes_h_l1016_c7_d7e0_return_output;

     -- Submodule level 126
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_ef87_iffalse := VAR_result_MUX_uxn_opcodes_h_l1016_c7_d7e0_return_output;
     -- result_MUX[uxn_opcodes_h_l1015_c7_ef87] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1015_c7_ef87_cond <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_ef87_cond;
     result_MUX_uxn_opcodes_h_l1015_c7_ef87_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_ef87_iftrue;
     result_MUX_uxn_opcodes_h_l1015_c7_ef87_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1015_c7_ef87_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1015_c7_ef87_return_output := result_MUX_uxn_opcodes_h_l1015_c7_ef87_return_output;

     -- Submodule level 127
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_4fa7_iffalse := VAR_result_MUX_uxn_opcodes_h_l1015_c7_ef87_return_output;
     -- result_MUX[uxn_opcodes_h_l1014_c7_4fa7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1014_c7_4fa7_cond <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_4fa7_cond;
     result_MUX_uxn_opcodes_h_l1014_c7_4fa7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_4fa7_iftrue;
     result_MUX_uxn_opcodes_h_l1014_c7_4fa7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1014_c7_4fa7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1014_c7_4fa7_return_output := result_MUX_uxn_opcodes_h_l1014_c7_4fa7_return_output;

     -- Submodule level 128
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_c7d6_iffalse := VAR_result_MUX_uxn_opcodes_h_l1014_c7_4fa7_return_output;
     -- result_MUX[uxn_opcodes_h_l1013_c7_c7d6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1013_c7_c7d6_cond <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_c7d6_cond;
     result_MUX_uxn_opcodes_h_l1013_c7_c7d6_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_c7d6_iftrue;
     result_MUX_uxn_opcodes_h_l1013_c7_c7d6_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1013_c7_c7d6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1013_c7_c7d6_return_output := result_MUX_uxn_opcodes_h_l1013_c7_c7d6_return_output;

     -- Submodule level 129
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_6cc4_iffalse := VAR_result_MUX_uxn_opcodes_h_l1013_c7_c7d6_return_output;
     -- result_MUX[uxn_opcodes_h_l1012_c7_6cc4] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1012_c7_6cc4_cond <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_6cc4_cond;
     result_MUX_uxn_opcodes_h_l1012_c7_6cc4_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_6cc4_iftrue;
     result_MUX_uxn_opcodes_h_l1012_c7_6cc4_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1012_c7_6cc4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1012_c7_6cc4_return_output := result_MUX_uxn_opcodes_h_l1012_c7_6cc4_return_output;

     -- Submodule level 130
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_fcac_iffalse := VAR_result_MUX_uxn_opcodes_h_l1012_c7_6cc4_return_output;
     -- result_MUX[uxn_opcodes_h_l1011_c7_fcac] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1011_c7_fcac_cond <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_fcac_cond;
     result_MUX_uxn_opcodes_h_l1011_c7_fcac_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_fcac_iftrue;
     result_MUX_uxn_opcodes_h_l1011_c7_fcac_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1011_c7_fcac_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1011_c7_fcac_return_output := result_MUX_uxn_opcodes_h_l1011_c7_fcac_return_output;

     -- Submodule level 131
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_696c_iffalse := VAR_result_MUX_uxn_opcodes_h_l1011_c7_fcac_return_output;
     -- result_MUX[uxn_opcodes_h_l1010_c7_696c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1010_c7_696c_cond <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_696c_cond;
     result_MUX_uxn_opcodes_h_l1010_c7_696c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_696c_iftrue;
     result_MUX_uxn_opcodes_h_l1010_c7_696c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1010_c7_696c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1010_c7_696c_return_output := result_MUX_uxn_opcodes_h_l1010_c7_696c_return_output;

     -- Submodule level 132
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_91b4_iffalse := VAR_result_MUX_uxn_opcodes_h_l1010_c7_696c_return_output;
     -- result_MUX[uxn_opcodes_h_l1009_c7_91b4] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1009_c7_91b4_cond <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_91b4_cond;
     result_MUX_uxn_opcodes_h_l1009_c7_91b4_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_91b4_iftrue;
     result_MUX_uxn_opcodes_h_l1009_c7_91b4_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1009_c7_91b4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1009_c7_91b4_return_output := result_MUX_uxn_opcodes_h_l1009_c7_91b4_return_output;

     -- Submodule level 133
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_0a41_iffalse := VAR_result_MUX_uxn_opcodes_h_l1009_c7_91b4_return_output;
     -- result_MUX[uxn_opcodes_h_l1008_c7_0a41] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1008_c7_0a41_cond <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_0a41_cond;
     result_MUX_uxn_opcodes_h_l1008_c7_0a41_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_0a41_iftrue;
     result_MUX_uxn_opcodes_h_l1008_c7_0a41_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1008_c7_0a41_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1008_c7_0a41_return_output := result_MUX_uxn_opcodes_h_l1008_c7_0a41_return_output;

     -- Submodule level 134
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_73e5_iffalse := VAR_result_MUX_uxn_opcodes_h_l1008_c7_0a41_return_output;
     -- result_MUX[uxn_opcodes_h_l1007_c7_73e5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1007_c7_73e5_cond <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_73e5_cond;
     result_MUX_uxn_opcodes_h_l1007_c7_73e5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_73e5_iftrue;
     result_MUX_uxn_opcodes_h_l1007_c7_73e5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1007_c7_73e5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1007_c7_73e5_return_output := result_MUX_uxn_opcodes_h_l1007_c7_73e5_return_output;

     -- Submodule level 135
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_c47e_iffalse := VAR_result_MUX_uxn_opcodes_h_l1007_c7_73e5_return_output;
     -- result_MUX[uxn_opcodes_h_l1006_c7_c47e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1006_c7_c47e_cond <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_c47e_cond;
     result_MUX_uxn_opcodes_h_l1006_c7_c47e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_c47e_iftrue;
     result_MUX_uxn_opcodes_h_l1006_c7_c47e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1006_c7_c47e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1006_c7_c47e_return_output := result_MUX_uxn_opcodes_h_l1006_c7_c47e_return_output;

     -- Submodule level 136
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_9dda_iffalse := VAR_result_MUX_uxn_opcodes_h_l1006_c7_c47e_return_output;
     -- result_MUX[uxn_opcodes_h_l1005_c7_9dda] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1005_c7_9dda_cond <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_9dda_cond;
     result_MUX_uxn_opcodes_h_l1005_c7_9dda_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_9dda_iftrue;
     result_MUX_uxn_opcodes_h_l1005_c7_9dda_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1005_c7_9dda_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1005_c7_9dda_return_output := result_MUX_uxn_opcodes_h_l1005_c7_9dda_return_output;

     -- Submodule level 137
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_2cf7_iffalse := VAR_result_MUX_uxn_opcodes_h_l1005_c7_9dda_return_output;
     -- result_MUX[uxn_opcodes_h_l1004_c7_2cf7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1004_c7_2cf7_cond <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_2cf7_cond;
     result_MUX_uxn_opcodes_h_l1004_c7_2cf7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_2cf7_iftrue;
     result_MUX_uxn_opcodes_h_l1004_c7_2cf7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1004_c7_2cf7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1004_c7_2cf7_return_output := result_MUX_uxn_opcodes_h_l1004_c7_2cf7_return_output;

     -- Submodule level 138
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_eca6_iffalse := VAR_result_MUX_uxn_opcodes_h_l1004_c7_2cf7_return_output;
     -- result_MUX[uxn_opcodes_h_l1003_c7_eca6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1003_c7_eca6_cond <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_eca6_cond;
     result_MUX_uxn_opcodes_h_l1003_c7_eca6_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_eca6_iftrue;
     result_MUX_uxn_opcodes_h_l1003_c7_eca6_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1003_c7_eca6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1003_c7_eca6_return_output := result_MUX_uxn_opcodes_h_l1003_c7_eca6_return_output;

     -- Submodule level 139
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_be83_iffalse := VAR_result_MUX_uxn_opcodes_h_l1003_c7_eca6_return_output;
     -- result_MUX[uxn_opcodes_h_l1002_c7_be83] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1002_c7_be83_cond <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_be83_cond;
     result_MUX_uxn_opcodes_h_l1002_c7_be83_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_be83_iftrue;
     result_MUX_uxn_opcodes_h_l1002_c7_be83_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1002_c7_be83_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1002_c7_be83_return_output := result_MUX_uxn_opcodes_h_l1002_c7_be83_return_output;

     -- Submodule level 140
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_1885_iffalse := VAR_result_MUX_uxn_opcodes_h_l1002_c7_be83_return_output;
     -- result_MUX[uxn_opcodes_h_l1001_c7_1885] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1001_c7_1885_cond <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_1885_cond;
     result_MUX_uxn_opcodes_h_l1001_c7_1885_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_1885_iftrue;
     result_MUX_uxn_opcodes_h_l1001_c7_1885_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1001_c7_1885_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1001_c7_1885_return_output := result_MUX_uxn_opcodes_h_l1001_c7_1885_return_output;

     -- Submodule level 141
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_8540_iffalse := VAR_result_MUX_uxn_opcodes_h_l1001_c7_1885_return_output;
     -- result_MUX[uxn_opcodes_h_l1000_c2_8540] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l1000_c2_8540_cond <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_8540_cond;
     result_MUX_uxn_opcodes_h_l1000_c2_8540_iftrue <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_8540_iftrue;
     result_MUX_uxn_opcodes_h_l1000_c2_8540_iffalse <= VAR_result_MUX_uxn_opcodes_h_l1000_c2_8540_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l1000_c2_8540_return_output := result_MUX_uxn_opcodes_h_l1000_c2_8540_return_output;

     -- Submodule level 142
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l1000_c2_8540_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l1000_c2_8540_return_output;
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
