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
-- BIN_OP_EQ[uxn_opcodes_h_l119_c6_1522]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l119_c1_4d62]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l119_c2_c9b7]
signal tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l119_c2_c9b7]
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l119_c2_c9b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c2_c9b7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l119_c2_c9b7]
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l119_c2_c9b7]
signal result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l120_c3_bd0f[uxn_opcodes_h_l120_c3_bd0f]
signal printf_uxn_opcodes_h_l120_c3_bd0f_uxn_opcodes_h_l120_c3_bd0f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l125_c11_2d8a]
signal BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l125_c7_0877]
signal tmp16_MUX_uxn_opcodes_h_l125_c7_0877_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l125_c7_0877_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l125_c7_0877_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l125_c7_0877_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l125_c7_0877]
signal result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l125_c7_0877]
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l125_c7_0877]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l125_c7_0877]
signal result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l125_c7_0877]
signal result_pc_MUX_uxn_opcodes_h_l125_c7_0877_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l125_c7_0877_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l125_c7_0877_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l125_c7_0877_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l128_c11_5107]
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l128_c7_27f6]
signal tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l128_c7_27f6]
signal result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l128_c7_27f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l128_c7_27f6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l128_c7_27f6]
signal result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l128_c7_27f6]
signal result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l130_c3_e77f]
signal CONST_SL_8_uxn_opcodes_h_l130_c3_e77f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l130_c3_e77f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l131_c21_a7a5]
signal BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l133_c11_8940]
signal BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l133_c7_3423]
signal tmp16_MUX_uxn_opcodes_h_l133_c7_3423_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c7_3423_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c7_3423_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c7_3423_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l133_c7_3423]
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l133_c7_3423]
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l133_c7_3423]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l133_c7_3423]
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l133_c7_3423]
signal result_pc_MUX_uxn_opcodes_h_l133_c7_3423_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c7_3423_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c7_3423_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c7_3423_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l134_c21_2c7c]
signal BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l136_c11_faeb]
signal BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l136_c7_3a6c]
signal tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l136_c7_3a6c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l136_c7_3a6c]
signal result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l136_c7_3a6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l136_c7_3a6c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l137_c3_7f2e]
signal BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l140_c16_c2dd]
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l140_c16_e936]
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l142_c11_f453]
signal BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l142_c7_2723]
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l142_c7_2723]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e2cf( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_ram_read := ref_toks_4;
      base.pc := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522
BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_return_output);

-- tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7
tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_cond,
tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue,
tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse,
tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output);

-- result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7
result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_cond,
result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue,
result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse,
result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output);

-- printf_uxn_opcodes_h_l120_c3_bd0f_uxn_opcodes_h_l120_c3_bd0f
printf_uxn_opcodes_h_l120_c3_bd0f_uxn_opcodes_h_l120_c3_bd0f : entity work.printf_uxn_opcodes_h_l120_c3_bd0f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l120_c3_bd0f_uxn_opcodes_h_l120_c3_bd0f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a
BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_left,
BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_right,
BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l125_c7_0877
tmp16_MUX_uxn_opcodes_h_l125_c7_0877 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l125_c7_0877_cond,
tmp16_MUX_uxn_opcodes_h_l125_c7_0877_iftrue,
tmp16_MUX_uxn_opcodes_h_l125_c7_0877_iffalse,
tmp16_MUX_uxn_opcodes_h_l125_c7_0877_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_cond,
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_return_output);

-- result_pc_MUX_uxn_opcodes_h_l125_c7_0877
result_pc_MUX_uxn_opcodes_h_l125_c7_0877 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l125_c7_0877_cond,
result_pc_MUX_uxn_opcodes_h_l125_c7_0877_iftrue,
result_pc_MUX_uxn_opcodes_h_l125_c7_0877_iffalse,
result_pc_MUX_uxn_opcodes_h_l125_c7_0877_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107
BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_left,
BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_right,
BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_return_output);

-- tmp16_MUX_uxn_opcodes_h_l128_c7_27f6
tmp16_MUX_uxn_opcodes_h_l128_c7_27f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_cond,
tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue,
tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse,
tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_return_output);

-- result_pc_MUX_uxn_opcodes_h_l128_c7_27f6
result_pc_MUX_uxn_opcodes_h_l128_c7_27f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_cond,
result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue,
result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse,
result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l130_c3_e77f
CONST_SL_8_uxn_opcodes_h_l130_c3_e77f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l130_c3_e77f_x,
CONST_SL_8_uxn_opcodes_h_l130_c3_e77f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5
BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_left,
BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_right,
BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940
BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_left,
BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_right,
BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_return_output);

-- tmp16_MUX_uxn_opcodes_h_l133_c7_3423
tmp16_MUX_uxn_opcodes_h_l133_c7_3423 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l133_c7_3423_cond,
tmp16_MUX_uxn_opcodes_h_l133_c7_3423_iftrue,
tmp16_MUX_uxn_opcodes_h_l133_c7_3423_iffalse,
tmp16_MUX_uxn_opcodes_h_l133_c7_3423_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_cond,
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_return_output);

-- result_pc_MUX_uxn_opcodes_h_l133_c7_3423
result_pc_MUX_uxn_opcodes_h_l133_c7_3423 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l133_c7_3423_cond,
result_pc_MUX_uxn_opcodes_h_l133_c7_3423_iftrue,
result_pc_MUX_uxn_opcodes_h_l133_c7_3423_iffalse,
result_pc_MUX_uxn_opcodes_h_l133_c7_3423_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c
BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_left,
BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_right,
BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb
BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_left,
BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_right,
BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c
tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_cond,
tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue,
tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse,
tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c
result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_cond,
result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue,
result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse,
result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e
BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_left,
BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_right,
BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_left,
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_right,
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_left,
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_right,
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453
BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_left,
BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_right,
BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_return_output,
 tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output,
 result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_return_output,
 tmp16_MUX_uxn_opcodes_h_l125_c7_0877_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_return_output,
 result_pc_MUX_uxn_opcodes_h_l125_c7_0877_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_return_output,
 tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_return_output,
 result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_return_output,
 CONST_SL_8_uxn_opcodes_h_l130_c3_e77f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_return_output,
 tmp16_MUX_uxn_opcodes_h_l133_c7_3423_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_return_output,
 result_pc_MUX_uxn_opcodes_h_l133_c7_3423_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_return_output,
 tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output,
 result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_0877_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_0877_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l120_c3_bd0f_uxn_opcodes_h_l120_c3_bd0f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_0877_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_0877_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_0877_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_0877_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_0877_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_0877_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_3423_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l131_c3_96dc : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_3423_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_e77f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_e77f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_3423_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_3423_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_3423_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l134_c3_9dca : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l133_c7_3423_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_3423_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_3423_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_3423_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l140_c3_e935 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l125_l119_l142_l133_DUPLICATE_1bf5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l128_l125_l119_l136_l133_DUPLICATE_1d85_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l125_l142_l136_l133_DUPLICATE_87ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l125_l136_l128_l133_DUPLICATE_0a32_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l129_l137_DUPLICATE_bdd2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e2cf_uxn_opcodes_h_l147_l115_DUPLICATE_dc78_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_right := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_0877_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_3423_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse := tmp16;
     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l133_c7_3423] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l133_c7_3423_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l128_c11_5107] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_left;
     BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_return_output := BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l136_c11_faeb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_left;
     BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_return_output := BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l131_c21_a7a5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l129_l137_DUPLICATE_bdd2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l129_l137_DUPLICATE_bdd2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l125_c11_2d8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l125_l142_l136_l133_DUPLICATE_87ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l125_l142_l136_l133_DUPLICATE_87ff_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l142_c11_f453] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_left;
     BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_return_output := BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l128_l125_l119_l136_l133_DUPLICATE_1d85 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l128_l125_l119_l136_l133_DUPLICATE_1d85_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l125_l136_l128_l133_DUPLICATE_0a32 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l125_l136_l128_l133_DUPLICATE_0a32_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l133_c11_8940] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_left;
     BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_return_output := BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l125_l119_l142_l133_DUPLICATE_1bf5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l125_l119_l142_l133_DUPLICATE_1bf5_return_output := result.is_pc_updated;

     -- BIN_OP_PLUS[uxn_opcodes_h_l134_c21_2c7c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l119_c6_1522] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_1522_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_0877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_0877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_2d8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_5107_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_3423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_3423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_8940_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_faeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_f453_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l131_c3_96dc := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_a7a5_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l134_c3_9dca := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_2c7c_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l129_l137_DUPLICATE_bdd2_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_e77f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l129_l137_DUPLICATE_bdd2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l128_l125_l119_l136_l133_DUPLICATE_1d85_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_0877_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l128_l125_l119_l136_l133_DUPLICATE_1d85_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l128_l125_l119_l136_l133_DUPLICATE_1d85_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_3423_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l128_l125_l119_l136_l133_DUPLICATE_1d85_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l128_l125_l119_l136_l133_DUPLICATE_1d85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l125_l142_l136_l133_DUPLICATE_87ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l125_l142_l136_l133_DUPLICATE_87ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l125_l142_l136_l133_DUPLICATE_87ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l125_l142_l136_l133_DUPLICATE_87ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l128_l125_l142_l136_l133_DUPLICATE_87ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l125_l119_l142_l133_DUPLICATE_1bf5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l125_l119_l142_l133_DUPLICATE_1bf5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l125_l119_l142_l133_DUPLICATE_1bf5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l125_l119_l142_l133_DUPLICATE_1bf5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l128_l125_l119_l142_l133_DUPLICATE_1bf5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l125_l136_l128_l133_DUPLICATE_0a32_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l125_l136_l128_l133_DUPLICATE_0a32_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l125_l136_l128_l133_DUPLICATE_0a32_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l125_l136_l128_l133_DUPLICATE_0a32_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l133_c7_3423_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l131_c3_96dc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l134_c3_9dca;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l142_c7_2723] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l137_c3_7f2e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_left;
     BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_return_output := BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l133_c7_3423] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_return_output := result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l136_c7_3a6c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l130_c3_e77f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l130_c3_e77f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_e77f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_e77f_return_output := CONST_SL_8_uxn_opcodes_h_l130_c3_e77f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l119_c1_4d62] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l142_c7_2723] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_right := VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_7f2e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_e77f_return_output;
     VAR_printf_uxn_opcodes_h_l120_c3_bd0f_uxn_opcodes_h_l120_c3_bd0f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_4d62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_2723_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_2723_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_3423_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l140_c16_c2dd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l133_c7_3423] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_return_output;

     -- printf_uxn_opcodes_h_l120_c3_bd0f[uxn_opcodes_h_l120_c3_bd0f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l120_c3_bd0f_uxn_opcodes_h_l120_c3_bd0f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l120_c3_bd0f_uxn_opcodes_h_l120_c3_bd0f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l136_c7_3a6c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_cond;
     tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output := tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l136_c7_3a6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l136_c7_3a6c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l128_c7_27f6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_c2dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_3423_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_27f6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_3423_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l128_c7_27f6] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l140_c16_e936] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_left;
     BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_return_output := BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l133_c7_3423] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l133_c7_3423_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_3423_cond;
     tmp16_MUX_uxn_opcodes_h_l133_c7_3423_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_3423_iftrue;
     tmp16_MUX_uxn_opcodes_h_l133_c7_3423_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_3423_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_3423_return_output := tmp16_MUX_uxn_opcodes_h_l133_c7_3423_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l125_c7_0877] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_return_output := result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l133_c7_3423] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l133_c7_3423] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l140_c3_e935 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_e936_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_3423_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_3423_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_27f6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_0877_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_3423_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue := VAR_result_pc_uxn_opcodes_h_l140_c3_e935;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l128_c7_27f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l128_c7_27f6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_cond;
     tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_return_output := tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l136_c7_3a6c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_cond;
     result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output := result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l128_c7_27f6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l125_c7_0877] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l119_c2_c9b7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_27f6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_27f6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_0877_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_3423_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_3a6c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_0877_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_27f6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l125_c7_0877] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l125_c7_0877] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l119_c2_c9b7] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l125_c7_0877] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l125_c7_0877_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_0877_cond;
     tmp16_MUX_uxn_opcodes_h_l125_c7_0877_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_0877_iftrue;
     tmp16_MUX_uxn_opcodes_h_l125_c7_0877_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_0877_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_0877_return_output := tmp16_MUX_uxn_opcodes_h_l125_c7_0877_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l133_c7_3423] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l133_c7_3423_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_3423_cond;
     result_pc_MUX_uxn_opcodes_h_l133_c7_3423_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_3423_iftrue;
     result_pc_MUX_uxn_opcodes_h_l133_c7_3423_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_3423_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_3423_return_output := result_pc_MUX_uxn_opcodes_h_l133_c7_3423_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_0877_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_0877_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_3423_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_0877_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c2_c9b7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l128_c7_27f6] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_cond;
     result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_iftrue;
     result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_return_output := result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l119_c2_c9b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l119_c2_c9b7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_cond;
     tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output := tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output;

     -- Submodule level 7
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_0877_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_27f6_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l125_c7_0877] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l125_c7_0877_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_0877_cond;
     result_pc_MUX_uxn_opcodes_h_l125_c7_0877_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_0877_iftrue;
     result_pc_MUX_uxn_opcodes_h_l125_c7_0877_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_0877_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_0877_return_output := result_pc_MUX_uxn_opcodes_h_l125_c7_0877_return_output;

     -- Submodule level 8
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_0877_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l119_c2_c9b7] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_cond;
     result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_iftrue;
     result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output := result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e2cf_uxn_opcodes_h_l147_l115_DUPLICATE_dc78 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e2cf_uxn_opcodes_h_l147_l115_DUPLICATE_dc78_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e2cf(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_c9b7_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e2cf_uxn_opcodes_h_l147_l115_DUPLICATE_dc78_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e2cf_uxn_opcodes_h_l147_l115_DUPLICATE_dc78_return_output;
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
