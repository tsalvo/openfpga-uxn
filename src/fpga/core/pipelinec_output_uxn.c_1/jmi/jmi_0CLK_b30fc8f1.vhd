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
-- BIN_OP_EQ[uxn_opcodes_h_l117_c6_6db9]
signal BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l117_c1_14d7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l117_c2_71f2]
signal result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l117_c2_71f2]
signal result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l117_c2_71f2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l117_c2_71f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l117_c2_71f2]
signal result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l117_c2_71f2]
signal tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l118_c3_ab9b[uxn_opcodes_h_l118_c3_ab9b]
signal printf_uxn_opcodes_h_l118_c3_ab9b_uxn_opcodes_h_l118_c3_ab9b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l123_c11_b7b2]
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l123_c7_896d]
signal result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l123_c7_896d]
signal result_pc_MUX_uxn_opcodes_h_l123_c7_896d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l123_c7_896d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l123_c7_896d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l123_c7_896d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_896d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_896d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l123_c7_896d]
signal result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l123_c7_896d]
signal tmp16_MUX_uxn_opcodes_h_l123_c7_896d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_896d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_896d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l123_c7_896d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l126_c11_eb33]
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l126_c7_70d9]
signal result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l126_c7_70d9]
signal result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_70d9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_70d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l126_c7_70d9]
signal result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l126_c7_70d9]
signal tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l128_c3_e2de]
signal CONST_SL_8_uxn_opcodes_h_l128_c3_e2de_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l128_c3_e2de_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l129_c21_5174]
signal BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l131_c11_274d]
signal BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l131_c7_cb48]
signal result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l131_c7_cb48]
signal result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l131_c7_cb48]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l131_c7_cb48]
signal result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l131_c7_cb48]
signal result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l131_c7_cb48]
signal tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l132_c21_0dd6]
signal BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l134_c11_94e7]
signal BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l134_c7_af1a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l134_c7_af1a]
signal result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l134_c7_af1a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l134_c7_af1a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l134_c7_af1a]
signal tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l135_c3_cace]
signal BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l138_c16_b457]
signal BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l138_c16_91f6]
signal BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l140_c11_fd2b]
signal BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l140_c7_f2de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l140_c7_f2de]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_7387( ref_toks_0 : opcode_result_t;
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
      base.pc := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.ram_addr := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9
BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_left,
BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_right,
BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2
result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l117_c2_71f2
result_pc_MUX_uxn_opcodes_h_l117_c2_71f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_cond,
result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue,
result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse,
result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2
result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2
result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2
result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l117_c2_71f2
tmp16_MUX_uxn_opcodes_h_l117_c2_71f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_cond,
tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue,
tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse,
tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_return_output);

-- printf_uxn_opcodes_h_l118_c3_ab9b_uxn_opcodes_h_l118_c3_ab9b
printf_uxn_opcodes_h_l118_c3_ab9b_uxn_opcodes_h_l118_c3_ab9b : entity work.printf_uxn_opcodes_h_l118_c3_ab9b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l118_c3_ab9b_uxn_opcodes_h_l118_c3_ab9b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2
BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_left,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_right,
BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d
result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l123_c7_896d
result_pc_MUX_uxn_opcodes_h_l123_c7_896d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l123_c7_896d_cond,
result_pc_MUX_uxn_opcodes_h_l123_c7_896d_iftrue,
result_pc_MUX_uxn_opcodes_h_l123_c7_896d_iffalse,
result_pc_MUX_uxn_opcodes_h_l123_c7_896d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d
result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l123_c7_896d
tmp16_MUX_uxn_opcodes_h_l123_c7_896d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l123_c7_896d_cond,
tmp16_MUX_uxn_opcodes_h_l123_c7_896d_iftrue,
tmp16_MUX_uxn_opcodes_h_l123_c7_896d_iffalse,
tmp16_MUX_uxn_opcodes_h_l123_c7_896d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33
BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_left,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_right,
BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9
result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_return_output);

-- result_pc_MUX_uxn_opcodes_h_l126_c7_70d9
result_pc_MUX_uxn_opcodes_h_l126_c7_70d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_cond,
result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue,
result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse,
result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9
result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l126_c7_70d9
tmp16_MUX_uxn_opcodes_h_l126_c7_70d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_cond,
tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue,
tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse,
tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_return_output);

-- CONST_SL_8_uxn_opcodes_h_l128_c3_e2de
CONST_SL_8_uxn_opcodes_h_l128_c3_e2de : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l128_c3_e2de_x,
CONST_SL_8_uxn_opcodes_h_l128_c3_e2de_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174
BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_left,
BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_right,
BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d
BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_left,
BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_right,
BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48
result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_return_output);

-- result_pc_MUX_uxn_opcodes_h_l131_c7_cb48
result_pc_MUX_uxn_opcodes_h_l131_c7_cb48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_cond,
result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue,
result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse,
result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48
result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48
result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48
result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_cond,
result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_return_output);

-- tmp16_MUX_uxn_opcodes_h_l131_c7_cb48
tmp16_MUX_uxn_opcodes_h_l131_c7_cb48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_cond,
tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue,
tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse,
tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6
BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_left,
BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_right,
BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7
BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_left,
BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_right,
BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a
result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l134_c7_af1a
result_pc_MUX_uxn_opcodes_h_l134_c7_af1a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_cond,
result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue,
result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse,
result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a
result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a
result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l134_c7_af1a
tmp16_MUX_uxn_opcodes_h_l134_c7_af1a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_cond,
tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue,
tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse,
tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l135_c3_cace
BIN_OP_OR_uxn_opcodes_h_l135_c3_cace : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_left,
BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_right,
BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457
BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_left,
BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_right,
BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6
BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_left,
BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_right,
BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b
BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_left,
BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_right,
BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_return_output,
 result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_return_output,
 tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_return_output,
 result_pc_MUX_uxn_opcodes_h_l123_c7_896d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_return_output,
 tmp16_MUX_uxn_opcodes_h_l123_c7_896d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_return_output,
 result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_return_output,
 tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_return_output,
 CONST_SL_8_uxn_opcodes_h_l128_c3_e2de_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_return_output,
 result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_return_output,
 tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_return_output,
 result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_return_output,
 tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l123_c7_896d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_896d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l118_c3_ab9b_uxn_opcodes_h_l118_c3_ab9b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l123_c7_896d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l123_c7_896d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l123_c7_896d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_896d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_896d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_896d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l129_c3_90f5 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_e2de_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_e2de_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l132_c3_5446 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l131_c7_cb48_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l138_c3_5f68 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l123_l126_l134_l131_l117_DUPLICATE_de63_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l140_l126_l131_l117_DUPLICATE_57c4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l123_l134_l131_l126_DUPLICATE_4aec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l140_l126_l134_l131_DUPLICATE_0695_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l135_DUPLICATE_635b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7387_uxn_opcodes_h_l145_l113_DUPLICATE_1eb1_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_right := to_unsigned(4, 3);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_right := to_unsigned(2, 2);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_896d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l123_l134_l131_l126_DUPLICATE_4aec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l123_l134_l131_l126_DUPLICATE_4aec_return_output := result.is_ram_read;

     -- BIN_OP_PLUS[uxn_opcodes_h_l132_c21_0dd6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l131_c11_274d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_left;
     BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_return_output := BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l123_l126_l134_l131_l117_DUPLICATE_de63 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l123_l126_l134_l131_l117_DUPLICATE_de63_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l123_c11_b7b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l117_c6_6db9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_left;
     BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_return_output := BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l126_c11_eb33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_left;
     BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_return_output := BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l134_c11_94e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l140_l126_l134_l131_DUPLICATE_0695 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l140_l126_l134_l131_DUPLICATE_0695_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l129_c21_5174] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_left;
     BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_return_output := BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_return_output;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l131_c7_cb48] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l131_c7_cb48_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l140_l126_l131_l117_DUPLICATE_57c4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l140_l126_l131_l117_DUPLICATE_57c4_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l140_c11_fd2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l135_DUPLICATE_635b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l135_DUPLICATE_635b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l117_c6_6db9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l123_c7_896d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_896d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l123_c11_b7b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l126_c11_eb33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l131_c11_274d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l134_c11_94e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c11_fd2b_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l129_c3_90f5 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l129_c21_5174_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l132_c3_5446 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l132_c21_0dd6_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l135_DUPLICATE_635b_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_e2de_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l127_l135_DUPLICATE_635b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l123_l126_l134_l131_l117_DUPLICATE_de63_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l123_c7_896d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l123_l126_l134_l131_l117_DUPLICATE_de63_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l123_l126_l134_l131_l117_DUPLICATE_de63_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l123_l126_l134_l131_l117_DUPLICATE_de63_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l123_l126_l134_l131_l117_DUPLICATE_de63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l140_l126_l134_l131_DUPLICATE_0695_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l140_l126_l134_l131_DUPLICATE_0695_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l140_l126_l134_l131_DUPLICATE_0695_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l140_l126_l134_l131_DUPLICATE_0695_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l123_l140_l126_l134_l131_DUPLICATE_0695_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l140_l126_l131_l117_DUPLICATE_57c4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l140_l126_l131_l117_DUPLICATE_57c4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l140_l126_l131_l117_DUPLICATE_57c4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l140_l126_l131_l117_DUPLICATE_57c4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l123_l140_l126_l131_l117_DUPLICATE_57c4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l123_l134_l131_l126_DUPLICATE_4aec_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l123_l134_l131_l126_DUPLICATE_4aec_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l123_l134_l131_l126_DUPLICATE_4aec_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l123_l134_l131_l126_DUPLICATE_4aec_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l131_c7_cb48_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l129_c3_90f5;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l132_c3_5446;
     -- BIN_OP_OR[uxn_opcodes_h_l135_c3_cace] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_left;
     BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_return_output := BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l140_c7_f2de] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l117_c1_14d7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l134_c7_af1a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l140_c7_f2de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l128_c3_e2de] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l128_c3_e2de_x <= VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_e2de_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_e2de_return_output := CONST_SL_8_uxn_opcodes_h_l128_c3_e2de_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l131_c7_cb48] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_return_output := result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_right := VAR_BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l135_c3_cace_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l128_c3_e2de_return_output;
     VAR_printf_uxn_opcodes_h_l118_c3_ab9b_uxn_opcodes_h_l118_c3_ab9b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l117_c1_14d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c7_f2de_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c7_f2de_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l134_c7_af1a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l131_c7_cb48_return_output;
     -- printf_uxn_opcodes_h_l118_c3_ab9b[uxn_opcodes_h_l118_c3_ab9b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l118_c3_ab9b_uxn_opcodes_h_l118_c3_ab9b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l118_c3_ab9b_uxn_opcodes_h_l118_c3_ab9b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l134_c7_af1a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l134_c7_af1a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l131_c7_cb48] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l126_c7_70d9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l138_c16_b457] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_left;
     BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_return_output := BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l134_c7_af1a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_cond;
     tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_return_output := tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_b457_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l134_c7_af1a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l134_c7_af1a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l131_c7_cb48_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l126_c7_70d9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l134_c7_af1a_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l131_c7_cb48] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l126_c7_70d9] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l138_c16_91f6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l123_c7_896d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l131_c7_cb48] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l131_c7_cb48] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_cond;
     tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue;
     tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_return_output := tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l138_c3_5f68 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l138_c16_91f6_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l131_c7_cb48_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l131_c7_cb48_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l126_c7_70d9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l123_c7_896d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l131_c7_cb48_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue := VAR_result_pc_uxn_opcodes_h_l138_c3_5f68;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l126_c7_70d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l126_c7_70d9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l123_c7_896d] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l126_c7_70d9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_cond;
     tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_return_output := tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l117_c2_71f2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l134_c7_af1a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_cond;
     result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_return_output := result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l126_c7_70d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l126_c7_70d9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l123_c7_896d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l134_c7_af1a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_896d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l126_c7_70d9_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l117_c2_71f2] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l123_c7_896d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l123_c7_896d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_896d_cond;
     tmp16_MUX_uxn_opcodes_h_l123_c7_896d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_896d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l123_c7_896d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_896d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_896d_return_output := tmp16_MUX_uxn_opcodes_h_l123_c7_896d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l123_c7_896d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l123_c7_896d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l131_c7_cb48] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_cond;
     result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_iftrue;
     result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_return_output := result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l123_c7_896d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l123_c7_896d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l131_c7_cb48_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l123_c7_896d_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l117_c2_71f2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l117_c2_71f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l126_c7_70d9] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_cond;
     result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_iftrue;
     result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_return_output := result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l117_c2_71f2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_cond;
     tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_return_output := tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_return_output;

     -- Submodule level 7
     VAR_result_pc_MUX_uxn_opcodes_h_l123_c7_896d_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l126_c7_70d9_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l117_c2_71f2_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l123_c7_896d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l123_c7_896d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l123_c7_896d_cond;
     result_pc_MUX_uxn_opcodes_h_l123_c7_896d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l123_c7_896d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l123_c7_896d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l123_c7_896d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l123_c7_896d_return_output := result_pc_MUX_uxn_opcodes_h_l123_c7_896d_return_output;

     -- Submodule level 8
     VAR_result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l123_c7_896d_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l117_c2_71f2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_cond;
     result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_return_output := result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7387_uxn_opcodes_h_l145_l113_DUPLICATE_1eb1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7387_uxn_opcodes_h_l145_l113_DUPLICATE_1eb1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7387(
     result,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l117_c2_71f2_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l117_c2_71f2_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l117_c2_71f2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l117_c2_71f2_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l117_c2_71f2_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7387_uxn_opcodes_h_l145_l113_DUPLICATE_1eb1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7387_uxn_opcodes_h_l145_l113_DUPLICATE_1eb1_return_output;
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
