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
-- Submodules: 49
entity jmi_0CLK_d14e7b0e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmi_0CLK_d14e7b0e;
architecture arch of jmi_0CLK_d14e7b0e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l133_c6_4a2b]
signal BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l133_c1_f279]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l133_c2_86bb]
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l133_c2_86bb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l133_c2_86bb]
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l133_c2_86bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l133_c2_86bb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l133_c2_86bb]
signal result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l133_c2_86bb]
signal tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l134_c3_b77b[uxn_opcodes_h_l134_c3_b77b]
signal printf_uxn_opcodes_h_l134_c3_b77b_uxn_opcodes_h_l134_c3_b77b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l140_c11_b273]
signal BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l140_c7_1ace]
signal result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l140_c7_1ace]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l140_c7_1ace]
signal result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l140_c7_1ace]
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l140_c7_1ace]
signal result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l140_c7_1ace]
signal tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l144_c11_364b]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l144_c7_6a09]
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c7_6a09]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l144_c7_6a09]
signal result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c7_6a09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l144_c7_6a09]
signal result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c7_6a09]
signal tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l146_c3_7bb1]
signal CONST_SL_8_uxn_opcodes_h_l146_c3_7bb1_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l146_c3_7bb1_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c21_cb84]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l150_c11_9d63]
signal BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l150_c7_c113]
signal result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l150_c7_c113]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l150_c7_c113]
signal result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l150_c7_c113]
signal result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l150_c7_c113]
signal result_pc_MUX_uxn_opcodes_h_l150_c7_c113_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l150_c7_c113_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l150_c7_c113_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l150_c7_c113_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l150_c7_c113]
signal tmp16_MUX_uxn_opcodes_h_l150_c7_c113_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l150_c7_c113_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l150_c7_c113_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l150_c7_c113_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l152_c21_61c6]
signal BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l154_c11_0ac8]
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l154_c7_923e]
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c7_923e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l154_c7_923e]
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l154_c7_923e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l154_c7_923e]
signal result_pc_MUX_uxn_opcodes_h_l154_c7_923e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c7_923e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c7_923e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c7_923e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l154_c7_923e]
signal tmp16_MUX_uxn_opcodes_h_l154_c7_923e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_923e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_923e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_923e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l155_c3_2842]
signal BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l159_c16_159b]
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l159_c16_01d7]
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l161_c11_5861]
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l161_c7_f3e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l161_c7_f3e8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_ead2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_ram_read := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.pc := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b
BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_left,
BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_right,
BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb
result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb
result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb
result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_return_output);

-- result_pc_MUX_uxn_opcodes_h_l133_c2_86bb
result_pc_MUX_uxn_opcodes_h_l133_c2_86bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_cond,
result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue,
result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse,
result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l133_c2_86bb
tmp16_MUX_uxn_opcodes_h_l133_c2_86bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_cond,
tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue,
tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse,
tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_return_output);

-- printf_uxn_opcodes_h_l134_c3_b77b_uxn_opcodes_h_l134_c3_b77b
printf_uxn_opcodes_h_l134_c3_b77b_uxn_opcodes_h_l134_c3_b77b : entity work.printf_uxn_opcodes_h_l134_c3_b77b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l134_c3_b77b_uxn_opcodes_h_l134_c3_b77b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273
BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_left,
BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_right,
BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace
result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_cond,
result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace
result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_return_output);

-- result_pc_MUX_uxn_opcodes_h_l140_c7_1ace
result_pc_MUX_uxn_opcodes_h_l140_c7_1ace : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_cond,
result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue,
result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse,
result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_return_output);

-- tmp16_MUX_uxn_opcodes_h_l140_c7_1ace
tmp16_MUX_uxn_opcodes_h_l140_c7_1ace : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_cond,
tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue,
tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse,
tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b
BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09
result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_cond,
result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09
result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09
result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_return_output);

-- result_pc_MUX_uxn_opcodes_h_l144_c7_6a09
result_pc_MUX_uxn_opcodes_h_l144_c7_6a09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_cond,
result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue,
result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse,
result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c7_6a09
tmp16_MUX_uxn_opcodes_h_l144_c7_6a09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_cond,
tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_return_output);

-- CONST_SL_8_uxn_opcodes_h_l146_c3_7bb1
CONST_SL_8_uxn_opcodes_h_l146_c3_7bb1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l146_c3_7bb1_x,
CONST_SL_8_uxn_opcodes_h_l146_c3_7bb1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84
BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63
BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_left,
BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_right,
BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113
result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_cond,
result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113
result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113
result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113
result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_return_output);

-- result_pc_MUX_uxn_opcodes_h_l150_c7_c113
result_pc_MUX_uxn_opcodes_h_l150_c7_c113 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l150_c7_c113_cond,
result_pc_MUX_uxn_opcodes_h_l150_c7_c113_iftrue,
result_pc_MUX_uxn_opcodes_h_l150_c7_c113_iffalse,
result_pc_MUX_uxn_opcodes_h_l150_c7_c113_return_output);

-- tmp16_MUX_uxn_opcodes_h_l150_c7_c113
tmp16_MUX_uxn_opcodes_h_l150_c7_c113 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l150_c7_c113_cond,
tmp16_MUX_uxn_opcodes_h_l150_c7_c113_iftrue,
tmp16_MUX_uxn_opcodes_h_l150_c7_c113_iffalse,
tmp16_MUX_uxn_opcodes_h_l150_c7_c113_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6
BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_left,
BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_right,
BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8
BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_left,
BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_right,
BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e
result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e
result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l154_c7_923e
result_pc_MUX_uxn_opcodes_h_l154_c7_923e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l154_c7_923e_cond,
result_pc_MUX_uxn_opcodes_h_l154_c7_923e_iftrue,
result_pc_MUX_uxn_opcodes_h_l154_c7_923e_iffalse,
result_pc_MUX_uxn_opcodes_h_l154_c7_923e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l154_c7_923e
tmp16_MUX_uxn_opcodes_h_l154_c7_923e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l154_c7_923e_cond,
tmp16_MUX_uxn_opcodes_h_l154_c7_923e_iftrue,
tmp16_MUX_uxn_opcodes_h_l154_c7_923e_iffalse,
tmp16_MUX_uxn_opcodes_h_l154_c7_923e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l155_c3_2842
BIN_OP_OR_uxn_opcodes_h_l155_c3_2842 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_left,
BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_right,
BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_left,
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_right,
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_left,
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_right,
BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861
BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_left,
BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_right,
BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_return_output,
 result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_return_output,
 tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_return_output,
 result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_return_output,
 tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_return_output,
 result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_return_output,
 CONST_SL_8_uxn_opcodes_h_l146_c3_7bb1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_return_output,
 result_pc_MUX_uxn_opcodes_h_l150_c7_c113_return_output,
 tmp16_MUX_uxn_opcodes_h_l150_c7_c113_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_return_output,
 result_pc_MUX_uxn_opcodes_h_l154_c7_923e_return_output,
 tmp16_MUX_uxn_opcodes_h_l154_c7_923e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_iffalse : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l133_c2_86bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l134_c3_b77b_uxn_opcodes_h_l134_c3_b77b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l148_c3_d6f1 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_c113_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_c113_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_7bb1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_7bb1_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l152_c3_2738 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_c113_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_c113_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_923e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_c113_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_c113_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_c113_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_923e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_c113_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l157_c3_3f4c : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l154_c7_923e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l154_c7_923e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_923e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l159_c3_42e8 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_923e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_923e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_923e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_923e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_923e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l133_l161_l150_l144_DUPLICATE_3030_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l140_l133_l154_l150_l144_DUPLICATE_59e2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l140_l161_l154_l150_l144_DUPLICATE_30ef_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l155_l145_DUPLICATE_fc60_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ead2_uxn_opcodes_h_l166_l129_DUPLICATE_ad86_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_right := to_unsigned(0, 1);
     VAR_result_ram_addr_uxn_opcodes_h_l157_c3_3f4c := resize(to_unsigned(0, 1), 16);
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l157_c3_3f4c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_iffalse := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_right := to_unsigned(2, 2);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_c113_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_923e_iffalse := tmp16;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l133_c2_86bb] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l133_c2_86bb_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l161_c11_5861] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_left;
     BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_return_output := BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l133_l161_l150_l144_DUPLICATE_3030 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l133_l161_l150_l144_DUPLICATE_3030_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l155_l145_DUPLICATE_fc60 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l155_l145_DUPLICATE_fc60_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l150_c11_9d63] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_left;
     BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_return_output := BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l152_c21_61c6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l154_c11_0ac8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_left;
     BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_return_output := BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l140_l161_l154_l150_l144_DUPLICATE_30ef LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l140_l161_l154_l150_l144_DUPLICATE_30ef_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c11_364b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_return_output;

     -- result_is_ram_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d[uxn_opcodes_h_l154_c7_923e] LATENCY=0
     VAR_result_is_ram_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l154_c7_923e_return_output := result.is_ram_read;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l154_c7_923e] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l154_c7_923e_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l133_c6_4a2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l140_c11_b273] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_left;
     BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_return_output := BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c21_cb84] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l140_l133_l154_l150_l144_DUPLICATE_59e2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l140_l133_l154_l150_l144_DUPLICATE_59e2_return_output := result.pc;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c6_4a2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_b273_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c11_364b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_c113_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_c113_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l150_c11_9d63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_923e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_923e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_0ac8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_5861_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l148_c3_d6f1 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c21_cb84_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l152_c3_2738 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l152_c21_61c6_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l155_l145_DUPLICATE_fc60_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_7bb1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l155_l145_DUPLICATE_fc60_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l140_l133_l154_l150_l144_DUPLICATE_59e2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l140_l133_l154_l150_l144_DUPLICATE_59e2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l140_l133_l154_l150_l144_DUPLICATE_59e2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_c113_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l140_l133_l154_l150_l144_DUPLICATE_59e2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_923e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l140_l133_l154_l150_l144_DUPLICATE_59e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l140_l161_l154_l150_l144_DUPLICATE_30ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l140_l161_l154_l150_l144_DUPLICATE_30ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l140_l161_l154_l150_l144_DUPLICATE_30ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l140_l161_l154_l150_l144_DUPLICATE_30ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l140_l161_l154_l150_l144_DUPLICATE_30ef_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l133_l161_l150_l144_DUPLICATE_3030_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l133_l161_l150_l144_DUPLICATE_3030_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l133_l161_l150_l144_DUPLICATE_3030_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l133_l161_l150_l144_DUPLICATE_3030_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l133_l161_l150_l144_DUPLICATE_3030_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_iffalse := VAR_result_is_ram_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l154_c7_923e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l133_c2_86bb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l154_c7_923e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l148_c3_d6f1;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l152_c3_2738;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l133_c1_f279] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l146_c3_7bb1] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l146_c3_7bb1_x <= VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_7bb1_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_7bb1_return_output := CONST_SL_8_uxn_opcodes_h_l146_c3_7bb1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l154_c7_923e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l154_c7_923e] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l155_c3_2842] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_left;
     BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_return_output := BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l133_c2_86bb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l161_c7_f3e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l161_c7_f3e8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_right := VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_923e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l155_c3_2842_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l146_c3_7bb1_return_output;
     VAR_printf_uxn_opcodes_h_l134_c3_b77b_uxn_opcodes_h_l134_c3_b77b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l133_c1_f279_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_f3e8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_f3e8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c7_923e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c7_923e_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l159_c16_159b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l154_c7_923e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l150_c7_c113] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_return_output := result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l150_c7_c113] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_return_output;

     -- printf_uxn_opcodes_h_l134_c3_b77b[uxn_opcodes_h_l134_c3_b77b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l134_c3_b77b_uxn_opcodes_h_l134_c3_b77b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l134_c3_b77b_uxn_opcodes_h_l134_c3_b77b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l154_c7_923e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l154_c7_923e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_923e_cond;
     tmp16_MUX_uxn_opcodes_h_l154_c7_923e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_923e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l154_c7_923e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_923e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_923e_return_output := tmp16_MUX_uxn_opcodes_h_l154_c7_923e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c7_923e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_159b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_923e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_923e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l150_c7_c113_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l150_c7_c113_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_c113_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_923e_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l150_c7_c113] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l159_c16_01d7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l150_c7_c113] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l150_c7_c113_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_c113_cond;
     tmp16_MUX_uxn_opcodes_h_l150_c7_c113_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_c113_iftrue;
     tmp16_MUX_uxn_opcodes_h_l150_c7_c113_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_c113_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_c113_return_output := tmp16_MUX_uxn_opcodes_h_l150_c7_c113_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l144_c7_6a09] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l144_c7_6a09] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_return_output := result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l150_c7_c113] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l159_c3_42e8 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l159_c16_01d7_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l150_c7_c113_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l150_c7_c113_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l144_c7_6a09_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l144_c7_6a09_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l150_c7_c113_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_923e_iftrue := VAR_result_pc_uxn_opcodes_h_l159_c3_42e8;
     -- tmp16_MUX[uxn_opcodes_h_l144_c7_6a09] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_return_output := tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l154_c7_923e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l154_c7_923e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_923e_cond;
     result_pc_MUX_uxn_opcodes_h_l154_c7_923e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_923e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l154_c7_923e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_923e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_923e_return_output := result_pc_MUX_uxn_opcodes_h_l154_c7_923e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c7_6a09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l140_c7_1ace] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_return_output := result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l140_c7_1ace] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c7_6a09] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c7_6a09_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c7_6a09_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l140_c7_1ace_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_c113_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l154_c7_923e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l140_c7_1ace_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l144_c7_6a09_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l140_c7_1ace] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_cond;
     tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue;
     tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_return_output := tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l133_c2_86bb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l140_c7_1ace] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l140_c7_1ace] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l150_c7_c113] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l150_c7_c113_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_c113_cond;
     result_pc_MUX_uxn_opcodes_h_l150_c7_c113_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_c113_iftrue;
     result_pc_MUX_uxn_opcodes_h_l150_c7_c113_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_c113_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_c113_return_output := result_pc_MUX_uxn_opcodes_h_l150_c7_c113_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l133_c2_86bb] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_1ace_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_1ace_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l150_c7_c113_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l140_c7_1ace_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l133_c2_86bb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l133_c2_86bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l133_c2_86bb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_cond;
     tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_return_output := tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l144_c7_6a09] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_cond;
     result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_iftrue;
     result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_return_output := result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_return_output;

     -- Submodule level 7
     VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l144_c7_6a09_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l133_c2_86bb_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l140_c7_1ace] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_cond;
     result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_iftrue;
     result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_return_output := result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_return_output;

     -- Submodule level 8
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l140_c7_1ace_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l133_c2_86bb] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_cond;
     result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_iftrue;
     result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_return_output := result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ead2_uxn_opcodes_h_l166_l129_DUPLICATE_ad86 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ead2_uxn_opcodes_h_l166_l129_DUPLICATE_ad86_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ead2(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c2_86bb_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c2_86bb_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c2_86bb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c2_86bb_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l133_c2_86bb_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c2_86bb_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ead2_uxn_opcodes_h_l166_l129_DUPLICATE_ad86_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ead2_uxn_opcodes_h_l166_l129_DUPLICATE_ad86_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
