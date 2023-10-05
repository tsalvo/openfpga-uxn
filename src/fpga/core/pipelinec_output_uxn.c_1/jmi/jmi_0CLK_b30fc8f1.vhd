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
-- Submodules: 47
entity jmi_0CLK_b30fc8f1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmi_0CLK_b30fc8f1;
architecture arch of jmi_0CLK_b30fc8f1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l119_c6_5adc]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l119_c1_a23c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l119_c2_1407]
signal tmp16_MUX_uxn_opcodes_h_l119_c2_1407_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c2_1407_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c2_1407_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c2_1407_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l119_c2_1407]
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c2_1407]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l119_c2_1407]
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l119_c2_1407]
signal result_pc_MUX_uxn_opcodes_h_l119_c2_1407_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c2_1407_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c2_1407_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c2_1407_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l119_c2_1407]
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l120_c3_33d5[uxn_opcodes_h_l120_c3_33d5]
signal printf_uxn_opcodes_h_l120_c3_33d5_uxn_opcodes_h_l120_c3_33d5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l125_c11_ea03]
signal BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l125_c7_cf78]
signal tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l125_c7_cf78]
signal result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l125_c7_cf78]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l125_c7_cf78]
signal result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l125_c7_cf78]
signal result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l125_c7_cf78]
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l128_c11_bfd0]
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l128_c7_cec0]
signal tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l128_c7_cec0]
signal result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l128_c7_cec0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l128_c7_cec0]
signal result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l128_c7_cec0]
signal result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l128_c7_cec0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l130_c3_a97b]
signal CONST_SL_8_uxn_opcodes_h_l130_c3_a97b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l130_c3_a97b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l131_c21_1bee]
signal BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l133_c11_4b29]
signal BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l133_c7_9c57]
signal tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l133_c7_9c57]
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l133_c7_9c57]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l133_c7_9c57]
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l133_c7_9c57]
signal result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l133_c7_9c57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l134_c21_1ca7]
signal BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l136_c11_97da]
signal BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l136_c7_d7b9]
signal tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l136_c7_d7b9]
signal result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l136_c7_d7b9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l136_c7_d7b9]
signal result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l136_c7_d7b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l137_c3_d288]
signal BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l140_c16_b853]
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l140_c16_c508]
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l142_c11_c6c2]
signal BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l142_c7_2112]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l142_c7_2112]
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3c71( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_read := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.ram_addr := ref_toks_3;
      base.pc := ref_toks_4;
      base.is_opc_done := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc
BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l119_c2_1407
tmp16_MUX_uxn_opcodes_h_l119_c2_1407 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l119_c2_1407_cond,
tmp16_MUX_uxn_opcodes_h_l119_c2_1407_iftrue,
tmp16_MUX_uxn_opcodes_h_l119_c2_1407_iffalse,
tmp16_MUX_uxn_opcodes_h_l119_c2_1407_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_cond,
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_return_output);

-- result_pc_MUX_uxn_opcodes_h_l119_c2_1407
result_pc_MUX_uxn_opcodes_h_l119_c2_1407 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l119_c2_1407_cond,
result_pc_MUX_uxn_opcodes_h_l119_c2_1407_iftrue,
result_pc_MUX_uxn_opcodes_h_l119_c2_1407_iffalse,
result_pc_MUX_uxn_opcodes_h_l119_c2_1407_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_return_output);

-- printf_uxn_opcodes_h_l120_c3_33d5_uxn_opcodes_h_l120_c3_33d5
printf_uxn_opcodes_h_l120_c3_33d5_uxn_opcodes_h_l120_c3_33d5 : entity work.printf_uxn_opcodes_h_l120_c3_33d5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l120_c3_33d5_uxn_opcodes_h_l120_c3_33d5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03
BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_left,
BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_right,
BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_return_output);

-- tmp16_MUX_uxn_opcodes_h_l125_c7_cf78
tmp16_MUX_uxn_opcodes_h_l125_c7_cf78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_cond,
tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue,
tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse,
tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_cond,
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_return_output);

-- result_pc_MUX_uxn_opcodes_h_l125_c7_cf78
result_pc_MUX_uxn_opcodes_h_l125_c7_cf78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_cond,
result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue,
result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse,
result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0
BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_left,
BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_right,
BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l128_c7_cec0
tmp16_MUX_uxn_opcodes_h_l128_c7_cec0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_cond,
tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue,
tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse,
tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_return_output);

-- result_pc_MUX_uxn_opcodes_h_l128_c7_cec0
result_pc_MUX_uxn_opcodes_h_l128_c7_cec0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_cond,
result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue,
result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse,
result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_return_output);

-- CONST_SL_8_uxn_opcodes_h_l130_c3_a97b
CONST_SL_8_uxn_opcodes_h_l130_c3_a97b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l130_c3_a97b_x,
CONST_SL_8_uxn_opcodes_h_l130_c3_a97b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee
BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_left,
BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_right,
BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29
BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_left,
BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_right,
BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_return_output);

-- tmp16_MUX_uxn_opcodes_h_l133_c7_9c57
tmp16_MUX_uxn_opcodes_h_l133_c7_9c57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_cond,
tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue,
tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse,
tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_cond,
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_return_output);

-- result_pc_MUX_uxn_opcodes_h_l133_c7_9c57
result_pc_MUX_uxn_opcodes_h_l133_c7_9c57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_cond,
result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue,
result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse,
result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7
BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_left,
BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_right,
BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da
BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_left,
BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_right,
BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_return_output);

-- tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9
tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_cond,
tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue,
tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse,
tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output);

-- result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9
result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_cond,
result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue,
result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse,
result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l137_c3_d288
BIN_OP_OR_uxn_opcodes_h_l137_c3_d288 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_left,
BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_right,
BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_left,
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_right,
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_left,
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_right,
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2
BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_left,
BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_right,
BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_return_output,
 tmp16_MUX_uxn_opcodes_h_l119_c2_1407_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_return_output,
 result_pc_MUX_uxn_opcodes_h_l119_c2_1407_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_return_output,
 tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_return_output,
 result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_return_output,
 tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_return_output,
 result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_return_output,
 CONST_SL_8_uxn_opcodes_h_l130_c3_a97b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_return_output,
 tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_return_output,
 result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_return_output,
 tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output,
 result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_1407_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_1407_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_1407_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_1407_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_1407_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_1407_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_1407_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_1407_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l120_c3_33d5_uxn_opcodes_h_l120_c3_33d5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l131_c3_3084 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_a97b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_a97b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l134_c3_3b29 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l133_c7_9c57_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l140_c3_6bfd : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l142_l133_l128_l125_DUPLICATE_e441_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l119_l136_l133_l128_l125_DUPLICATE_47ed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l128_l133_l125_l136_DUPLICATE_d46e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l142_l136_l133_l128_l125_DUPLICATE_6f00_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l129_l137_DUPLICATE_9516_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3c71_uxn_opcodes_h_l147_l115_DUPLICATE_bb39_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_iffalse := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_1407_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l131_c21_1bee] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_left;
     BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_return_output := BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_return_output;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l133_c7_9c57] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l133_c7_9c57_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l119_c6_5adc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l133_c11_4b29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_left;
     BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_return_output := BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l134_c21_1ca7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l125_c11_ea03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_left;
     BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_return_output := BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l142_l133_l128_l125_DUPLICATE_e441 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l142_l133_l128_l125_DUPLICATE_e441_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l119_l136_l133_l128_l125_DUPLICATE_47ed LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l119_l136_l133_l128_l125_DUPLICATE_47ed_return_output := result.pc;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l129_l137_DUPLICATE_9516 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l129_l137_DUPLICATE_9516_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l136_c11_97da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_left;
     BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_return_output := BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l128_c11_bfd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_left;
     BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_return_output := BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l128_l133_l125_l136_DUPLICATE_d46e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l128_l133_l125_l136_DUPLICATE_d46e_return_output := result.is_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l142_l136_l133_l128_l125_DUPLICATE_6f00 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l142_l136_l133_l128_l125_DUPLICATE_6f00_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l142_c11_c6c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_1407_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_1407_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_5adc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_ea03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_bfd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_4b29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_97da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_c6c2_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l131_c3_3084 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_1bee_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l134_c3_3b29 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_1ca7_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l129_l137_DUPLICATE_9516_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_a97b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l129_l137_DUPLICATE_9516_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_1407_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l119_l136_l133_l128_l125_DUPLICATE_47ed_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l119_l136_l133_l128_l125_DUPLICATE_47ed_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l119_l136_l133_l128_l125_DUPLICATE_47ed_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l119_l136_l133_l128_l125_DUPLICATE_47ed_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l119_l136_l133_l128_l125_DUPLICATE_47ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l142_l136_l133_l128_l125_DUPLICATE_6f00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l142_l136_l133_l128_l125_DUPLICATE_6f00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l142_l136_l133_l128_l125_DUPLICATE_6f00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l142_l136_l133_l128_l125_DUPLICATE_6f00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l142_l136_l133_l128_l125_DUPLICATE_6f00_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l142_l133_l128_l125_DUPLICATE_e441_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l142_l133_l128_l125_DUPLICATE_e441_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l142_l133_l128_l125_DUPLICATE_e441_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l142_l133_l128_l125_DUPLICATE_e441_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l119_l142_l133_l128_l125_DUPLICATE_e441_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l128_l133_l125_l136_DUPLICATE_d46e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l128_l133_l125_l136_DUPLICATE_d46e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l128_l133_l125_l136_DUPLICATE_d46e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l128_l133_l125_l136_DUPLICATE_d46e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l133_c7_9c57_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l131_c3_3084;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l134_c3_3b29;
     -- CONST_SL_8[uxn_opcodes_h_l130_c3_a97b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l130_c3_a97b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_a97b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_a97b_return_output := CONST_SL_8_uxn_opcodes_h_l130_c3_a97b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l119_c1_a23c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l142_c7_2112] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l133_c7_9c57] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_return_output := result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l142_c7_2112] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l137_c3_d288] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_left;
     BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_return_output := BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l136_c7_d7b9] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_right := VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_d288_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_a97b_return_output;
     VAR_printf_uxn_opcodes_h_l120_c3_33d5_uxn_opcodes_h_l120_c3_33d5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_a23c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2112_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2112_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_9c57_return_output;
     -- printf_uxn_opcodes_h_l120_c3_33d5[uxn_opcodes_h_l120_c3_33d5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l120_c3_33d5_uxn_opcodes_h_l120_c3_33d5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l120_c3_33d5_uxn_opcodes_h_l120_c3_33d5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l136_c7_d7b9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_cond;
     tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output := tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l140_c16_b853] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_left;
     BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_return_output := BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l136_c7_d7b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l133_c7_9c57] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l136_c7_d7b9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l128_c7_cec0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_b853_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_9c57_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_cec0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l133_c7_9c57] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_cond;
     tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue;
     tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_return_output := tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l128_c7_cec0] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l125_c7_cf78] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_return_output := result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l133_c7_9c57] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l140_c16_c508] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_left;
     BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_return_output := BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l133_c7_9c57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l140_c3_6bfd := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c508_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_9c57_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_9c57_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_cec0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_cf78_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_9c57_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue := VAR_result_pc_uxn_opcodes_h_l140_c3_6bfd;
     -- tmp16_MUX[uxn_opcodes_h_l128_c7_cec0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_cond;
     tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_return_output := tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l136_c7_d7b9] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_cond;
     result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_iftrue;
     result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output := result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l125_c7_cf78] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l119_c2_1407] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_return_output := result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l128_c7_cec0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l128_c7_cec0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_cec0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_cec0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_cf78_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_d7b9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_cec0_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l133_c7_9c57] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_cond;
     result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_iftrue;
     result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_return_output := result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l125_c7_cf78] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l119_c2_1407] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l125_c7_cf78] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l125_c7_cf78] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_cond;
     tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue;
     tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_return_output := tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_cf78_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_cf78_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_9c57_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_1407_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_cf78_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l128_c7_cec0] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_cond;
     result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_iftrue;
     result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_return_output := result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l119_c2_1407] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l119_c2_1407_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_1407_cond;
     tmp16_MUX_uxn_opcodes_h_l119_c2_1407_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_1407_iftrue;
     tmp16_MUX_uxn_opcodes_h_l119_c2_1407_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_1407_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_1407_return_output := tmp16_MUX_uxn_opcodes_h_l119_c2_1407_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c2_1407] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l119_c2_1407] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_return_output;

     -- Submodule level 7
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_cec0_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_1407_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l125_c7_cf78] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_cond;
     result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_iftrue;
     result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_return_output := result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_return_output;

     -- Submodule level 8
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_1407_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_cf78_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l119_c2_1407] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l119_c2_1407_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_1407_cond;
     result_pc_MUX_uxn_opcodes_h_l119_c2_1407_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_1407_iftrue;
     result_pc_MUX_uxn_opcodes_h_l119_c2_1407_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_1407_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_1407_return_output := result_pc_MUX_uxn_opcodes_h_l119_c2_1407_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3c71_uxn_opcodes_h_l147_l115_DUPLICATE_bb39 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3c71_uxn_opcodes_h_l147_l115_DUPLICATE_bb39_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3c71(
     result,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_1407_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_1407_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_1407_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_1407_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_1407_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3c71_uxn_opcodes_h_l147_l115_DUPLICATE_bb39_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3c71_uxn_opcodes_h_l147_l115_DUPLICATE_bb39_return_output;
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
