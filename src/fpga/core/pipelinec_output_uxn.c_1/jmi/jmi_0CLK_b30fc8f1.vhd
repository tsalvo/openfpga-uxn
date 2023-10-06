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
-- BIN_OP_EQ[uxn_opcodes_h_l119_c6_6abc]
signal BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l119_c1_2d1a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l119_c2_faba]
signal tmp16_MUX_uxn_opcodes_h_l119_c2_faba_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c2_faba_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c2_faba_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l119_c2_faba_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l119_c2_faba]
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l119_c2_faba]
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l119_c2_faba]
signal result_pc_MUX_uxn_opcodes_h_l119_c2_faba_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c2_faba_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c2_faba_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l119_c2_faba_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l119_c2_faba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c2_faba]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l120_c3_959e[uxn_opcodes_h_l120_c3_959e]
signal printf_uxn_opcodes_h_l120_c3_959e_uxn_opcodes_h_l120_c3_959e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l125_c11_3720]
signal BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l125_c7_049c]
signal tmp16_MUX_uxn_opcodes_h_l125_c7_049c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l125_c7_049c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l125_c7_049c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l125_c7_049c_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l125_c7_049c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l125_c7_049c]
signal result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l125_c7_049c]
signal result_pc_MUX_uxn_opcodes_h_l125_c7_049c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l125_c7_049c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l125_c7_049c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l125_c7_049c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l125_c7_049c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l125_c7_049c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l128_c11_c2b4]
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l128_c7_a83c]
signal tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l128_c7_a83c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l128_c7_a83c]
signal result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l128_c7_a83c]
signal result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l128_c7_a83c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l128_c7_a83c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l130_c3_d4a9]
signal CONST_SL_8_uxn_opcodes_h_l130_c3_d4a9_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l130_c3_d4a9_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l131_c21_33d2]
signal BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l133_c11_2b11]
signal BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l133_c7_1388]
signal tmp16_MUX_uxn_opcodes_h_l133_c7_1388_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c7_1388_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c7_1388_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l133_c7_1388_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l133_c7_1388]
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l133_c7_1388]
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l133_c7_1388]
signal result_pc_MUX_uxn_opcodes_h_l133_c7_1388_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c7_1388_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c7_1388_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l133_c7_1388_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l133_c7_1388]
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l133_c7_1388]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l134_c21_fd8c]
signal BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l136_c11_4dd1]
signal BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l136_c7_28a1]
signal tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l136_c7_28a1]
signal result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l136_c7_28a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l136_c7_28a1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l136_c7_28a1]
signal result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l137_c3_c169]
signal BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l140_c16_05b2]
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l140_c16_a13a]
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l142_c11_1eed]
signal BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l142_c7_3a45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l142_c7_3a45]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8d9a( ref_toks_0 : opcode_result_t;
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
      base.ram_addr := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_pc_updated := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc
BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_left,
BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_right,
BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l119_c2_faba
tmp16_MUX_uxn_opcodes_h_l119_c2_faba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l119_c2_faba_cond,
tmp16_MUX_uxn_opcodes_h_l119_c2_faba_iftrue,
tmp16_MUX_uxn_opcodes_h_l119_c2_faba_iffalse,
tmp16_MUX_uxn_opcodes_h_l119_c2_faba_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_cond,
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_return_output);

-- result_pc_MUX_uxn_opcodes_h_l119_c2_faba
result_pc_MUX_uxn_opcodes_h_l119_c2_faba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l119_c2_faba_cond,
result_pc_MUX_uxn_opcodes_h_l119_c2_faba_iftrue,
result_pc_MUX_uxn_opcodes_h_l119_c2_faba_iffalse,
result_pc_MUX_uxn_opcodes_h_l119_c2_faba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_return_output);

-- printf_uxn_opcodes_h_l120_c3_959e_uxn_opcodes_h_l120_c3_959e
printf_uxn_opcodes_h_l120_c3_959e_uxn_opcodes_h_l120_c3_959e : entity work.printf_uxn_opcodes_h_l120_c3_959e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l120_c3_959e_uxn_opcodes_h_l120_c3_959e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720
BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_left,
BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_right,
BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_return_output);

-- tmp16_MUX_uxn_opcodes_h_l125_c7_049c
tmp16_MUX_uxn_opcodes_h_l125_c7_049c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l125_c7_049c_cond,
tmp16_MUX_uxn_opcodes_h_l125_c7_049c_iftrue,
tmp16_MUX_uxn_opcodes_h_l125_c7_049c_iffalse,
tmp16_MUX_uxn_opcodes_h_l125_c7_049c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l125_c7_049c
result_pc_MUX_uxn_opcodes_h_l125_c7_049c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l125_c7_049c_cond,
result_pc_MUX_uxn_opcodes_h_l125_c7_049c_iftrue,
result_pc_MUX_uxn_opcodes_h_l125_c7_049c_iffalse,
result_pc_MUX_uxn_opcodes_h_l125_c7_049c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4
BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_left,
BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_right,
BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l128_c7_a83c
tmp16_MUX_uxn_opcodes_h_l128_c7_a83c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_cond,
tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue,
tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse,
tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l128_c7_a83c
result_pc_MUX_uxn_opcodes_h_l128_c7_a83c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_cond,
result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue,
result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse,
result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l130_c3_d4a9
CONST_SL_8_uxn_opcodes_h_l130_c3_d4a9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l130_c3_d4a9_x,
CONST_SL_8_uxn_opcodes_h_l130_c3_d4a9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2
BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_left,
BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_right,
BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11
BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_left,
BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_right,
BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_return_output);

-- tmp16_MUX_uxn_opcodes_h_l133_c7_1388
tmp16_MUX_uxn_opcodes_h_l133_c7_1388 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l133_c7_1388_cond,
tmp16_MUX_uxn_opcodes_h_l133_c7_1388_iftrue,
tmp16_MUX_uxn_opcodes_h_l133_c7_1388_iffalse,
tmp16_MUX_uxn_opcodes_h_l133_c7_1388_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_cond,
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_return_output);

-- result_pc_MUX_uxn_opcodes_h_l133_c7_1388
result_pc_MUX_uxn_opcodes_h_l133_c7_1388 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l133_c7_1388_cond,
result_pc_MUX_uxn_opcodes_h_l133_c7_1388_iftrue,
result_pc_MUX_uxn_opcodes_h_l133_c7_1388_iffalse,
result_pc_MUX_uxn_opcodes_h_l133_c7_1388_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c
BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_left,
BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_right,
BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1
BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_left,
BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_right,
BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l136_c7_28a1
tmp16_MUX_uxn_opcodes_h_l136_c7_28a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_cond,
tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue,
tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse,
tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l136_c7_28a1
result_pc_MUX_uxn_opcodes_h_l136_c7_28a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_cond,
result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue,
result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse,
result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l137_c3_c169
BIN_OP_OR_uxn_opcodes_h_l137_c3_c169 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_left,
BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_right,
BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_left,
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_right,
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_left,
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_right,
BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed
BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_left,
BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_right,
BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_return_output,
 tmp16_MUX_uxn_opcodes_h_l119_c2_faba_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_return_output,
 result_pc_MUX_uxn_opcodes_h_l119_c2_faba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_return_output,
 tmp16_MUX_uxn_opcodes_h_l125_c7_049c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_return_output,
 result_pc_MUX_uxn_opcodes_h_l125_c7_049c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_return_output,
 tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_return_output,
 result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_return_output,
 CONST_SL_8_uxn_opcodes_h_l130_c3_d4a9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_return_output,
 tmp16_MUX_uxn_opcodes_h_l133_c7_1388_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_return_output,
 result_pc_MUX_uxn_opcodes_h_l133_c7_1388_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_return_output,
 tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_return_output,
 result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_faba_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_faba_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_049c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_faba_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_faba_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_faba_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_faba_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_049c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_faba_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_faba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l120_c3_959e_uxn_opcodes_h_l120_c3_959e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_049c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_049c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_049c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_049c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_049c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_049c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_1388_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l131_c3_42e7 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_1388_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_d4a9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_d4a9_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_1388_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_1388_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_1388_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l134_c3_ee66 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l133_c7_1388_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_1388_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_1388_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_1388_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l140_c3_e8e0 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l133_l119_l136_l125_l128_DUPLICATE_ae96_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l133_l119_l125_l142_l128_DUPLICATE_7d90_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l128_l136_l125_l133_DUPLICATE_b720_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l133_l136_l125_l142_l128_DUPLICATE_5ca3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l137_l129_DUPLICATE_54cc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8d9a_uxn_opcodes_h_l147_l115_DUPLICATE_a1ac_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_right := to_unsigned(2, 2);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_iffalse := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_faba_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_049c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_1388_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse := tmp16;
     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l133_c7_1388] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l133_c7_1388_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l128_l136_l125_l133_DUPLICATE_b720 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l128_l136_l125_l133_DUPLICATE_b720_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l136_c11_4dd1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_left;
     BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_return_output := BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l133_l119_l125_l142_l128_DUPLICATE_7d90 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l133_l119_l125_l142_l128_DUPLICATE_7d90_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l128_c11_c2b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l142_c11_1eed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_left;
     BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_return_output := BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l133_l119_l136_l125_l128_DUPLICATE_ae96 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l133_l119_l136_l125_l128_DUPLICATE_ae96_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l133_l136_l125_l142_l128_DUPLICATE_5ca3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l133_l136_l125_l142_l128_DUPLICATE_5ca3_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l134_c21_fd8c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l119_c6_6abc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_left;
     BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_return_output := BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l137_l129_DUPLICATE_54cc LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l137_l129_DUPLICATE_54cc_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l131_c21_33d2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l133_c11_2b11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_left;
     BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_return_output := BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l125_c11_3720] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_left;
     BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_return_output := BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_faba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_faba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l119_c6_6abc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_049c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_049c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l125_c11_3720_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l128_c11_c2b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_1388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_1388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l133_c11_2b11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l136_c11_4dd1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c11_1eed_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l131_c3_42e7 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l131_c21_33d2_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l134_c3_ee66 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l134_c21_fd8c_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l137_l129_DUPLICATE_54cc_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_d4a9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l137_l129_DUPLICATE_54cc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_faba_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l133_l119_l136_l125_l128_DUPLICATE_ae96_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_049c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l133_l119_l136_l125_l128_DUPLICATE_ae96_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l133_l119_l136_l125_l128_DUPLICATE_ae96_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_1388_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l133_l119_l136_l125_l128_DUPLICATE_ae96_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l133_l119_l136_l125_l128_DUPLICATE_ae96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l133_l136_l125_l142_l128_DUPLICATE_5ca3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l133_l136_l125_l142_l128_DUPLICATE_5ca3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l133_l136_l125_l142_l128_DUPLICATE_5ca3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l133_l136_l125_l142_l128_DUPLICATE_5ca3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l133_l136_l125_l142_l128_DUPLICATE_5ca3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l133_l119_l125_l142_l128_DUPLICATE_7d90_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l133_l119_l125_l142_l128_DUPLICATE_7d90_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l133_l119_l125_l142_l128_DUPLICATE_7d90_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l133_l119_l125_l142_l128_DUPLICATE_7d90_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l133_l119_l125_l142_l128_DUPLICATE_7d90_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l128_l136_l125_l133_DUPLICATE_b720_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l128_l136_l125_l133_DUPLICATE_b720_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l128_l136_l125_l133_DUPLICATE_b720_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l128_l136_l125_l133_DUPLICATE_b720_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l133_c7_1388_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l131_c3_42e7;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l134_c3_ee66;
     -- CONST_SL_8[uxn_opcodes_h_l130_c3_d4a9] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l130_c3_d4a9_x <= VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_d4a9_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_d4a9_return_output := CONST_SL_8_uxn_opcodes_h_l130_c3_d4a9_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l136_c7_28a1] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l142_c7_3a45] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l142_c7_3a45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l119_c1_2d1a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l137_c3_c169] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_left;
     BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_return_output := BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l133_c7_1388] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_return_output := result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_right := VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l137_c3_c169_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l130_c3_d4a9_return_output;
     VAR_printf_uxn_opcodes_h_l120_c3_959e_uxn_opcodes_h_l120_c3_959e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l119_c1_2d1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c7_3a45_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c7_3a45_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l136_c7_28a1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l133_c7_1388_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l136_c7_28a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l133_c7_1388] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l136_c7_28a1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_cond;
     tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_return_output := tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l140_c16_05b2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l136_c7_28a1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_return_output;

     -- printf_uxn_opcodes_h_l120_c3_959e[uxn_opcodes_h_l120_c3_959e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l120_c3_959e_uxn_opcodes_h_l120_c3_959e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l120_c3_959e_uxn_opcodes_h_l120_c3_959e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_ram_addr_MUX[uxn_opcodes_h_l128_c7_a83c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_05b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l136_c7_28a1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l136_c7_28a1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l133_c7_1388_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l128_c7_a83c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_1388_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l136_c7_28a1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l133_c7_1388] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l133_c7_1388] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l133_c7_1388_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_1388_cond;
     tmp16_MUX_uxn_opcodes_h_l133_c7_1388_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_1388_iftrue;
     tmp16_MUX_uxn_opcodes_h_l133_c7_1388_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_1388_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_1388_return_output := tmp16_MUX_uxn_opcodes_h_l133_c7_1388_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l125_c7_049c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l133_c7_1388] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l128_c7_a83c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l140_c16_a13a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l140_c3_e8e0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l140_c16_a13a_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l133_c7_1388_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l133_c7_1388_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l128_c7_a83c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l125_c7_049c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l133_c7_1388_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue := VAR_result_pc_uxn_opcodes_h_l140_c3_e8e0;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l125_c7_049c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l128_c7_a83c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l128_c7_a83c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l128_c7_a83c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_cond;
     tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_return_output := tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l136_c7_28a1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_cond;
     result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_return_output := result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l119_c2_faba] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_return_output := result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l128_c7_a83c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l128_c7_a83c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l125_c7_049c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_1388_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l136_c7_28a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_049c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l128_c7_a83c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l125_c7_049c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l125_c7_049c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l125_c7_049c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_049c_cond;
     tmp16_MUX_uxn_opcodes_h_l125_c7_049c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_049c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l125_c7_049c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_049c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_049c_return_output := tmp16_MUX_uxn_opcodes_h_l125_c7_049c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l119_c2_faba] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l125_c7_049c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l133_c7_1388] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l133_c7_1388_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_1388_cond;
     result_pc_MUX_uxn_opcodes_h_l133_c7_1388_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_1388_iftrue;
     result_pc_MUX_uxn_opcodes_h_l133_c7_1388_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_1388_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_1388_return_output := result_pc_MUX_uxn_opcodes_h_l133_c7_1388_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l125_c7_049c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l125_c7_049c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l133_c7_1388_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_faba_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l125_c7_049c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l119_c2_faba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l119_c2_faba] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l119_c2_faba_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_faba_cond;
     tmp16_MUX_uxn_opcodes_h_l119_c2_faba_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_faba_iftrue;
     tmp16_MUX_uxn_opcodes_h_l119_c2_faba_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_faba_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_faba_return_output := tmp16_MUX_uxn_opcodes_h_l119_c2_faba_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l128_c7_a83c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_cond;
     result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_return_output := result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l119_c2_faba] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_return_output;

     -- Submodule level 7
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_049c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l128_c7_a83c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l119_c2_faba_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l125_c7_049c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l125_c7_049c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_049c_cond;
     result_pc_MUX_uxn_opcodes_h_l125_c7_049c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_049c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l125_c7_049c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_049c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_049c_return_output := result_pc_MUX_uxn_opcodes_h_l125_c7_049c_return_output;

     -- Submodule level 8
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_faba_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l125_c7_049c_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l119_c2_faba] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l119_c2_faba_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_faba_cond;
     result_pc_MUX_uxn_opcodes_h_l119_c2_faba_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_faba_iftrue;
     result_pc_MUX_uxn_opcodes_h_l119_c2_faba_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_faba_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_faba_return_output := result_pc_MUX_uxn_opcodes_h_l119_c2_faba_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8d9a_uxn_opcodes_h_l147_l115_DUPLICATE_a1ac LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8d9a_uxn_opcodes_h_l147_l115_DUPLICATE_a1ac_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8d9a(
     result,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l119_c2_faba_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l119_c2_faba_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l119_c2_faba_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l119_c2_faba_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l119_c2_faba_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8d9a_uxn_opcodes_h_l147_l115_DUPLICATE_a1ac_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8d9a_uxn_opcodes_h_l147_l115_DUPLICATE_a1ac_return_output;
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
