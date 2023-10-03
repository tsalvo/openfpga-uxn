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
 previous_stack_read : in unsigned(7 downto 0);
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
-- BIN_OP_EQ[uxn_opcodes_h_l119_c6_452c]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l119_c1_8b8f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l119_c2_2884]
signal tmp16_MUX_uxn_opcodes_h_l119_c2_2884_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c2_2884_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c2_2884_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c2_2884_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c2_2884]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l119_c2_2884]
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l119_c2_2884]
signal result_pc_MUX_uxn_opcodes_h_l119_c2_2884_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c2_2884_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c2_2884_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c2_2884_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l119_c2_2884]
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l119_c2_2884]
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l120_c3_4a88[uxn_opcodes_h_l120_c3_4a88]
signal printf_uxn_opcodes_h_l120_c3_4a88_uxn_opcodes_h_l120_c3_4a88_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l125_c11_0054]
signal BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l125_c7_403d]
signal tmp16_MUX_uxn_opcodes_h_l125_c7_403d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l125_c7_403d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l125_c7_403d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l125_c7_403d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l125_c7_403d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l125_c7_403d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l125_c7_403d]
signal result_pc_MUX_uxn_opcodes_h_l125_c7_403d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l125_c7_403d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l125_c7_403d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l125_c7_403d_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l125_c7_403d]
signal result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l125_c7_403d]
signal result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l128_c11_6789]
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l128_c7_b57b]
signal tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l128_c7_b57b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l128_c7_b57b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l128_c7_b57b]
signal result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l128_c7_b57b]
signal result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l128_c7_b57b]
signal result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l130_c3_222d]
signal CONST_SL_8_uxn_opcodes_h_l130_c3_222d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l130_c3_222d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l131_c21_c859]
signal BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l133_c11_75a4]
signal BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l133_c7_942a]
signal tmp16_MUX_uxn_opcodes_h_l133_c7_942a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c7_942a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c7_942a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c7_942a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l133_c7_942a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l133_c7_942a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l133_c7_942a]
signal result_pc_MUX_uxn_opcodes_h_l133_c7_942a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c7_942a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c7_942a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c7_942a_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l133_c7_942a]
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l133_c7_942a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l134_c21_b47f]
signal BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l136_c11_325c]
signal BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l136_c7_efb4]
signal tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l136_c7_efb4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l136_c7_efb4]
signal result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l136_c7_efb4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l136_c7_efb4]
signal result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l137_c3_37b7]
signal BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l140_c16_6a92]
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l140_c16_ff56]
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l142_c11_1174]
signal BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l142_c7_d053]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l142_c7_d053]
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_27da( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.pc := ref_toks_3;
      base.ram_addr := ref_toks_4;
      base.is_ram_read := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c
BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l119_c2_2884
tmp16_MUX_uxn_opcodes_h_l119_c2_2884 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l119_c2_2884_cond,
tmp16_MUX_uxn_opcodes_h_l119_c2_2884_iftrue,
tmp16_MUX_uxn_opcodes_h_l119_c2_2884_iffalse,
tmp16_MUX_uxn_opcodes_h_l119_c2_2884_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_return_output);

-- result_pc_MUX_uxn_opcodes_h_l119_c2_2884
result_pc_MUX_uxn_opcodes_h_l119_c2_2884 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l119_c2_2884_cond,
result_pc_MUX_uxn_opcodes_h_l119_c2_2884_iftrue,
result_pc_MUX_uxn_opcodes_h_l119_c2_2884_iffalse,
result_pc_MUX_uxn_opcodes_h_l119_c2_2884_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_cond,
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_return_output);

-- printf_uxn_opcodes_h_l120_c3_4a88_uxn_opcodes_h_l120_c3_4a88
printf_uxn_opcodes_h_l120_c3_4a88_uxn_opcodes_h_l120_c3_4a88 : entity work.printf_uxn_opcodes_h_l120_c3_4a88_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l120_c3_4a88_uxn_opcodes_h_l120_c3_4a88_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054
BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_left,
BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_right,
BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_return_output);

-- tmp16_MUX_uxn_opcodes_h_l125_c7_403d
tmp16_MUX_uxn_opcodes_h_l125_c7_403d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l125_c7_403d_cond,
tmp16_MUX_uxn_opcodes_h_l125_c7_403d_iftrue,
tmp16_MUX_uxn_opcodes_h_l125_c7_403d_iffalse,
tmp16_MUX_uxn_opcodes_h_l125_c7_403d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l125_c7_403d
result_pc_MUX_uxn_opcodes_h_l125_c7_403d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l125_c7_403d_cond,
result_pc_MUX_uxn_opcodes_h_l125_c7_403d_iftrue,
result_pc_MUX_uxn_opcodes_h_l125_c7_403d_iffalse,
result_pc_MUX_uxn_opcodes_h_l125_c7_403d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789
BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_left,
BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_right,
BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_return_output);

-- tmp16_MUX_uxn_opcodes_h_l128_c7_b57b
tmp16_MUX_uxn_opcodes_h_l128_c7_b57b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_cond,
tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue,
tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse,
tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l128_c7_b57b
result_pc_MUX_uxn_opcodes_h_l128_c7_b57b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_cond,
result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue,
result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse,
result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l130_c3_222d
CONST_SL_8_uxn_opcodes_h_l130_c3_222d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l130_c3_222d_x,
CONST_SL_8_uxn_opcodes_h_l130_c3_222d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859
BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_left,
BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_right,
BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4
BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_left,
BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_right,
BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l133_c7_942a
tmp16_MUX_uxn_opcodes_h_l133_c7_942a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l133_c7_942a_cond,
tmp16_MUX_uxn_opcodes_h_l133_c7_942a_iftrue,
tmp16_MUX_uxn_opcodes_h_l133_c7_942a_iffalse,
tmp16_MUX_uxn_opcodes_h_l133_c7_942a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l133_c7_942a
result_pc_MUX_uxn_opcodes_h_l133_c7_942a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l133_c7_942a_cond,
result_pc_MUX_uxn_opcodes_h_l133_c7_942a_iftrue,
result_pc_MUX_uxn_opcodes_h_l133_c7_942a_iffalse,
result_pc_MUX_uxn_opcodes_h_l133_c7_942a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f
BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_left,
BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_right,
BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c
BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_left,
BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_right,
BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l136_c7_efb4
tmp16_MUX_uxn_opcodes_h_l136_c7_efb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_cond,
tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue,
tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse,
tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l136_c7_efb4
result_pc_MUX_uxn_opcodes_h_l136_c7_efb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_cond,
result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue,
result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse,
result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7
BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_left,
BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_right,
BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_left,
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_right,
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_left,
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_right,
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174
BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_left,
BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_right,
BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_return_output,
 tmp16_MUX_uxn_opcodes_h_l119_c2_2884_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_return_output,
 result_pc_MUX_uxn_opcodes_h_l119_c2_2884_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_return_output,
 tmp16_MUX_uxn_opcodes_h_l125_c7_403d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_return_output,
 result_pc_MUX_uxn_opcodes_h_l125_c7_403d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_return_output,
 tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_return_output,
 result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_return_output,
 CONST_SL_8_uxn_opcodes_h_l130_c3_222d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_return_output,
 tmp16_MUX_uxn_opcodes_h_l133_c7_942a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_return_output,
 result_pc_MUX_uxn_opcodes_h_l133_c7_942a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_return_output,
 tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_return_output,
 result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_2884_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_2884_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_403d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_2884_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_2884_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_2884_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_2884_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_403d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_2884_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_2884_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l120_c3_4a88_uxn_opcodes_h_l120_c3_4a88_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_403d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_403d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_403d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_403d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_403d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_403d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_942a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_942a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l131_c3_6656 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_222d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_222d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_942a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_942a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_942a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_942a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_942a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_942a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l134_c3_0ecb : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l133_c7_942a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l140_c3_8846 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l125_l119_l142_l133_l128_DUPLICATE_b10a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l125_l119_l136_l133_l128_DUPLICATE_aa46_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l125_l142_l136_l133_l128_DUPLICATE_0922_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l133_l125_l136_l128_DUPLICATE_b222_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l129_l137_DUPLICATE_52ea_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_27da_uxn_opcodes_h_l147_l115_DUPLICATE_4246_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_iffalse := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_2884_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_403d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_942a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse := tmp16;
     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l125_l119_l136_l133_l128_DUPLICATE_aa46 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l125_l119_l136_l133_l128_DUPLICATE_aa46_return_output := result.pc;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l133_c7_942a] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l133_c7_942a_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l142_c11_1174] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_left;
     BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_return_output := BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l133_l125_l136_l128_DUPLICATE_b222 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l133_l125_l136_l128_DUPLICATE_b222_return_output := result.is_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l125_l119_l142_l133_l128_DUPLICATE_b10a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l125_l119_l142_l133_l128_DUPLICATE_b10a_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l125_l142_l136_l133_l128_DUPLICATE_0922 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l125_l142_l136_l133_l128_DUPLICATE_0922_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l131_c21_c859] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_left;
     BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_return_output := BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l128_c11_6789] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_left;
     BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_return_output := BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l134_c21_b47f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l129_l137_DUPLICATE_52ea LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l129_l137_DUPLICATE_52ea_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l125_c11_0054] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_left;
     BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_return_output := BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l119_c6_452c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l133_c11_75a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l136_c11_325c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_left;
     BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_return_output := BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_2884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_2884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_452c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_403d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_403d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_0054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_6789_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_942a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_942a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_75a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_325c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1174_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l131_c3_6656 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_c859_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l134_c3_0ecb := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_b47f_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l129_l137_DUPLICATE_52ea_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_222d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l129_l137_DUPLICATE_52ea_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_2884_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l125_l119_l136_l133_l128_DUPLICATE_aa46_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_403d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l125_l119_l136_l133_l128_DUPLICATE_aa46_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l125_l119_l136_l133_l128_DUPLICATE_aa46_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_942a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l125_l119_l136_l133_l128_DUPLICATE_aa46_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l125_l119_l136_l133_l128_DUPLICATE_aa46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l125_l142_l136_l133_l128_DUPLICATE_0922_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l125_l142_l136_l133_l128_DUPLICATE_0922_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l125_l142_l136_l133_l128_DUPLICATE_0922_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l125_l142_l136_l133_l128_DUPLICATE_0922_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l125_l142_l136_l133_l128_DUPLICATE_0922_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l125_l119_l142_l133_l128_DUPLICATE_b10a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l125_l119_l142_l133_l128_DUPLICATE_b10a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l125_l119_l142_l133_l128_DUPLICATE_b10a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l125_l119_l142_l133_l128_DUPLICATE_b10a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l125_l119_l142_l133_l128_DUPLICATE_b10a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l133_l125_l136_l128_DUPLICATE_b222_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l133_l125_l136_l128_DUPLICATE_b222_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l133_l125_l136_l128_DUPLICATE_b222_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l133_l125_l136_l128_DUPLICATE_b222_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l133_c7_942a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l131_c3_6656;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l134_c3_0ecb;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l136_c7_efb4] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l137_c3_37b7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_left;
     BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_return_output := BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l142_c7_d053] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l142_c7_d053] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l130_c3_222d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l130_c3_222d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_222d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_222d_return_output := CONST_SL_8_uxn_opcodes_h_l130_c3_222d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l133_c7_942a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l119_c1_8b8f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_right := VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_37b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_222d_return_output;
     VAR_printf_uxn_opcodes_h_l120_c3_4a88_uxn_opcodes_h_l120_c3_4a88_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_8b8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_d053_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_d053_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_efb4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_942a_return_output;
     -- printf_uxn_opcodes_h_l120_c3_4a88[uxn_opcodes_h_l120_c3_4a88] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l120_c3_4a88_uxn_opcodes_h_l120_c3_4a88_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l120_c3_4a88_uxn_opcodes_h_l120_c3_4a88_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l136_c7_efb4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l128_c7_b57b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l133_c7_942a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l136_c7_efb4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l136_c7_efb4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_cond;
     tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_return_output := tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l140_c16_6a92] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_left;
     BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_return_output := BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_6a92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_efb4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_efb4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_942a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_b57b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_942a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_efb4_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l133_c7_942a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l133_c7_942a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l133_c7_942a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l133_c7_942a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_942a_cond;
     tmp16_MUX_uxn_opcodes_h_l133_c7_942a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_942a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l133_c7_942a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_942a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_942a_return_output := tmp16_MUX_uxn_opcodes_h_l133_c7_942a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l125_c7_403d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l140_c16_ff56] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_left;
     BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_return_output := BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l128_c7_b57b] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l140_c3_8846 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_ff56_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_942a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_942a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_b57b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_403d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_942a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue := VAR_result_pc_uxn_opcodes_h_l140_c3_8846;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l125_c7_403d] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l128_c7_b57b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_cond;
     tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_return_output := tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l128_c7_b57b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l119_c2_2884] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_return_output := result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l128_c7_b57b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l136_c7_efb4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_cond;
     result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_return_output := result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_b57b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_b57b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_403d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_942a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_efb4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_403d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_b57b_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l125_c7_403d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l133_c7_942a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l133_c7_942a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_942a_cond;
     result_pc_MUX_uxn_opcodes_h_l133_c7_942a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_942a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l133_c7_942a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_942a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_942a_return_output := result_pc_MUX_uxn_opcodes_h_l133_c7_942a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l125_c7_403d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l125_c7_403d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l125_c7_403d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_403d_cond;
     tmp16_MUX_uxn_opcodes_h_l125_c7_403d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_403d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l125_c7_403d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_403d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_403d_return_output := tmp16_MUX_uxn_opcodes_h_l125_c7_403d_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l119_c2_2884] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_403d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_403d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_942a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_2884_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_403d_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c2_2884] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l128_c7_b57b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_cond;
     result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_return_output := result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l119_c2_2884] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l119_c2_2884] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l119_c2_2884_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_2884_cond;
     tmp16_MUX_uxn_opcodes_h_l119_c2_2884_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_2884_iftrue;
     tmp16_MUX_uxn_opcodes_h_l119_c2_2884_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_2884_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_2884_return_output := tmp16_MUX_uxn_opcodes_h_l119_c2_2884_return_output;

     -- Submodule level 7
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_403d_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_b57b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_2884_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l125_c7_403d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l125_c7_403d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_403d_cond;
     result_pc_MUX_uxn_opcodes_h_l125_c7_403d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_403d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l125_c7_403d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_403d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_403d_return_output := result_pc_MUX_uxn_opcodes_h_l125_c7_403d_return_output;

     -- Submodule level 8
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_2884_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_403d_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l119_c2_2884] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l119_c2_2884_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_2884_cond;
     result_pc_MUX_uxn_opcodes_h_l119_c2_2884_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_2884_iftrue;
     result_pc_MUX_uxn_opcodes_h_l119_c2_2884_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_2884_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_2884_return_output := result_pc_MUX_uxn_opcodes_h_l119_c2_2884_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_27da_uxn_opcodes_h_l147_l115_DUPLICATE_4246 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_27da_uxn_opcodes_h_l147_l115_DUPLICATE_4246_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_27da(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_2884_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_2884_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_2884_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_2884_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_2884_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_27da_uxn_opcodes_h_l147_l115_DUPLICATE_4246_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_27da_uxn_opcodes_h_l147_l115_DUPLICATE_4246_return_output;
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
