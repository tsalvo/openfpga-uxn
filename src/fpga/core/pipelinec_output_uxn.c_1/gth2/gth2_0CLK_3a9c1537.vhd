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
-- Submodules: 107
entity gth2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_3a9c1537;
architecture arch of gth2_0CLK_3a9c1537 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2140_c6_380b]
signal BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2140_c1_6fcb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2140_c2_4135]
signal n16_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2140_c2_4135]
signal t16_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2140_c2_4135]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2140_c2_4135]
signal result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2140_c2_4135]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2140_c2_4135]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2140_c2_4135]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2140_c2_4135]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2140_c2_4135]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2141_c3_47a3[uxn_opcodes_h_l2141_c3_47a3]
signal printf_uxn_opcodes_h_l2141_c3_47a3_uxn_opcodes_h_l2141_c3_47a3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2146_c11_dfd3]
signal BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2146_c7_954b]
signal n16_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2146_c7_954b]
signal t16_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2146_c7_954b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2146_c7_954b]
signal result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2146_c7_954b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2146_c7_954b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2146_c7_954b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2146_c7_954b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2146_c7_954b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2149_c11_eef9]
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2149_c7_46f1]
signal n16_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2149_c7_46f1]
signal t16_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2149_c7_46f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2149_c7_46f1]
signal result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2149_c7_46f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2149_c7_46f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2149_c7_46f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2149_c7_46f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2149_c7_46f1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2154_c11_2c88]
signal BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2154_c7_dd0d]
signal n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2154_c7_dd0d]
signal t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2154_c7_dd0d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2154_c7_dd0d]
signal result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2154_c7_dd0d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2154_c7_dd0d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2154_c7_dd0d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2154_c7_dd0d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2154_c7_dd0d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2157_c11_5f3a]
signal BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2157_c7_3aac]
signal n16_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2157_c7_3aac]
signal t16_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2157_c7_3aac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2157_c7_3aac]
signal result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2157_c7_3aac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2157_c7_3aac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2157_c7_3aac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2157_c7_3aac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2157_c7_3aac]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2158_c3_10df]
signal BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2161_c11_030f]
signal BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2161_c7_1834]
signal n16_MUX_uxn_opcodes_h_l2161_c7_1834_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2161_c7_1834_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2161_c7_1834]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2161_c7_1834]
signal result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2161_c7_1834]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2161_c7_1834]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2161_c7_1834]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2161_c7_1834]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2161_c7_1834]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2164_c11_d255]
signal BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2164_c7_3e1b]
signal n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2164_c7_3e1b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2164_c7_3e1b]
signal result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2164_c7_3e1b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2164_c7_3e1b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2164_c7_3e1b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2164_c7_3e1b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2164_c7_3e1b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2169_c11_dfd9]
signal BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2169_c7_14e2]
signal n16_MUX_uxn_opcodes_h_l2169_c7_14e2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2169_c7_14e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2169_c7_14e2]
signal result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2169_c7_14e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2169_c7_14e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2169_c7_14e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2169_c7_14e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2169_c7_14e2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2172_c11_7b1f]
signal BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2172_c7_792c]
signal n16_MUX_uxn_opcodes_h_l2172_c7_792c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2172_c7_792c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2172_c7_792c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2172_c7_792c]
signal result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2172_c7_792c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2172_c7_792c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2172_c7_792c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2172_c7_792c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2172_c7_792c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2173_c3_cd9f]
signal BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2176_c32_f7f3]
signal BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2176_c32_4ef9]
signal BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2176_c32_640f]
signal MUX_uxn_opcodes_h_l2176_c32_640f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2176_c32_640f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2176_c32_640f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2176_c32_640f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2178_c11_e416]
signal BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2178_c7_5944]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2178_c7_5944]
signal result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2178_c7_5944]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2178_c7_5944]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2178_c7_5944]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2182_c24_b8e3]
signal BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2182_c24_bfaf]
signal MUX_uxn_opcodes_h_l2182_c24_bfaf_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2182_c24_bfaf_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2182_c24_bfaf_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2182_c24_bfaf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2184_c11_ef40]
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2184_c7_812c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2184_c7_812c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b
BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_left,
BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_right,
BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_return_output);

-- n16_MUX_uxn_opcodes_h_l2140_c2_4135
n16_MUX_uxn_opcodes_h_l2140_c2_4135 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2140_c2_4135_cond,
n16_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue,
n16_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse,
n16_MUX_uxn_opcodes_h_l2140_c2_4135_return_output);

-- t16_MUX_uxn_opcodes_h_l2140_c2_4135
t16_MUX_uxn_opcodes_h_l2140_c2_4135 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2140_c2_4135_cond,
t16_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue,
t16_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse,
t16_MUX_uxn_opcodes_h_l2140_c2_4135_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135
result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135
result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_cond,
result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135
result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135
result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135
result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135
result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_return_output);

-- printf_uxn_opcodes_h_l2141_c3_47a3_uxn_opcodes_h_l2141_c3_47a3
printf_uxn_opcodes_h_l2141_c3_47a3_uxn_opcodes_h_l2141_c3_47a3 : entity work.printf_uxn_opcodes_h_l2141_c3_47a3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2141_c3_47a3_uxn_opcodes_h_l2141_c3_47a3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3
BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_left,
BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_right,
BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_return_output);

-- n16_MUX_uxn_opcodes_h_l2146_c7_954b
n16_MUX_uxn_opcodes_h_l2146_c7_954b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2146_c7_954b_cond,
n16_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue,
n16_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse,
n16_MUX_uxn_opcodes_h_l2146_c7_954b_return_output);

-- t16_MUX_uxn_opcodes_h_l2146_c7_954b
t16_MUX_uxn_opcodes_h_l2146_c7_954b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2146_c7_954b_cond,
t16_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue,
t16_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse,
t16_MUX_uxn_opcodes_h_l2146_c7_954b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b
result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b
result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b
result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b
result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b
result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_left,
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_right,
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_return_output);

-- n16_MUX_uxn_opcodes_h_l2149_c7_46f1
n16_MUX_uxn_opcodes_h_l2149_c7_46f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2149_c7_46f1_cond,
n16_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue,
n16_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse,
n16_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output);

-- t16_MUX_uxn_opcodes_h_l2149_c7_46f1
t16_MUX_uxn_opcodes_h_l2149_c7_46f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2149_c7_46f1_cond,
t16_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue,
t16_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse,
t16_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1
result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1
result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88
BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_left,
BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_right,
BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_return_output);

-- n16_MUX_uxn_opcodes_h_l2154_c7_dd0d
n16_MUX_uxn_opcodes_h_l2154_c7_dd0d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond,
n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue,
n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse,
n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output);

-- t16_MUX_uxn_opcodes_h_l2154_c7_dd0d
t16_MUX_uxn_opcodes_h_l2154_c7_dd0d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond,
t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue,
t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse,
t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d
result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d
result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a
BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_left,
BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_right,
BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_return_output);

-- n16_MUX_uxn_opcodes_h_l2157_c7_3aac
n16_MUX_uxn_opcodes_h_l2157_c7_3aac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2157_c7_3aac_cond,
n16_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue,
n16_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse,
n16_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output);

-- t16_MUX_uxn_opcodes_h_l2157_c7_3aac
t16_MUX_uxn_opcodes_h_l2157_c7_3aac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2157_c7_3aac_cond,
t16_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue,
t16_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse,
t16_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac
result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac
result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_cond,
result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac
result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac
result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac
result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac
result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df
BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_left,
BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_right,
BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f
BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_left,
BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_right,
BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_return_output);

-- n16_MUX_uxn_opcodes_h_l2161_c7_1834
n16_MUX_uxn_opcodes_h_l2161_c7_1834 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2161_c7_1834_cond,
n16_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue,
n16_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse,
n16_MUX_uxn_opcodes_h_l2161_c7_1834_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834
result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834
result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_cond,
result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834
result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834
result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834
result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834
result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255
BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_left,
BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_right,
BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_return_output);

-- n16_MUX_uxn_opcodes_h_l2164_c7_3e1b
n16_MUX_uxn_opcodes_h_l2164_c7_3e1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond,
n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue,
n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse,
n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b
result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b
result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b
result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b
result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b
result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9
BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_left,
BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_right,
BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_return_output);

-- n16_MUX_uxn_opcodes_h_l2169_c7_14e2
n16_MUX_uxn_opcodes_h_l2169_c7_14e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2169_c7_14e2_cond,
n16_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue,
n16_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse,
n16_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2
result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2
result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2
result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2
result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2
result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f
BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_left,
BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_right,
BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_return_output);

-- n16_MUX_uxn_opcodes_h_l2172_c7_792c
n16_MUX_uxn_opcodes_h_l2172_c7_792c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2172_c7_792c_cond,
n16_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue,
n16_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse,
n16_MUX_uxn_opcodes_h_l2172_c7_792c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c
result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c
result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c
result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c
result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c
result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f
BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_left,
BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_right,
BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3
BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_left,
BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_right,
BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9
BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_left,
BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_right,
BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_return_output);

-- MUX_uxn_opcodes_h_l2176_c32_640f
MUX_uxn_opcodes_h_l2176_c32_640f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2176_c32_640f_cond,
MUX_uxn_opcodes_h_l2176_c32_640f_iftrue,
MUX_uxn_opcodes_h_l2176_c32_640f_iffalse,
MUX_uxn_opcodes_h_l2176_c32_640f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416
BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_left,
BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_right,
BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944
result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944
result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_cond,
result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944
result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944
result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3
BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_left,
BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_right,
BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_return_output);

-- MUX_uxn_opcodes_h_l2182_c24_bfaf
MUX_uxn_opcodes_h_l2182_c24_bfaf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2182_c24_bfaf_cond,
MUX_uxn_opcodes_h_l2182_c24_bfaf_iftrue,
MUX_uxn_opcodes_h_l2182_c24_bfaf_iffalse,
MUX_uxn_opcodes_h_l2182_c24_bfaf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_left,
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_right,
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c
result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a
CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_return_output,
 n16_MUX_uxn_opcodes_h_l2140_c2_4135_return_output,
 t16_MUX_uxn_opcodes_h_l2140_c2_4135_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_return_output,
 n16_MUX_uxn_opcodes_h_l2146_c7_954b_return_output,
 t16_MUX_uxn_opcodes_h_l2146_c7_954b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_return_output,
 n16_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output,
 t16_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_return_output,
 n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output,
 t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_return_output,
 n16_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output,
 t16_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_return_output,
 n16_MUX_uxn_opcodes_h_l2161_c7_1834_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_return_output,
 n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_return_output,
 n16_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_return_output,
 n16_MUX_uxn_opcodes_h_l2172_c7_792c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_return_output,
 MUX_uxn_opcodes_h_l2176_c32_640f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_return_output,
 MUX_uxn_opcodes_h_l2182_c24_bfaf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_5fc6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2141_c3_47a3_uxn_opcodes_h_l2141_c3_47a3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_cabc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_426a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_5e54 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2161_c7_1834_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2159_c3_2349 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2161_c7_1834_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2162_c3_10ab : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2167_c3_5701 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2172_c7_792c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2169_c7_14e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_caa0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2172_c7_792c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2176_c32_640f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2176_c32_640f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2176_c32_640f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2176_c32_640f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2181_c3_496f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2182_c24_bfaf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2182_c24_bfaf_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2182_c24_bfaf_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2182_c24_bfaf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2146_l2169_l2140_DUPLICATE_17c0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2172_l2146_l2169_l2140_DUPLICATE_bdb6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_65f8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_151e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2178_l2149_l2172_l2146_l2169_DUPLICATE_fbb4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_DUPLICATE_3149_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2150_l2173_l2158_l2165_DUPLICATE_f829_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2178_l2172_DUPLICATE_439e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2189_l2136_DUPLICATE_3c94_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l2176_c32_640f_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2162_c3_10ab := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2162_c3_10ab;
     VAR_MUX_uxn_opcodes_h_l2182_c24_bfaf_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_cabc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_cabc;
     VAR_MUX_uxn_opcodes_h_l2176_c32_640f_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_5fc6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_5fc6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_caa0 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_caa0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_426a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_426a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2167_c3_5701 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2167_c3_5701;
     VAR_MUX_uxn_opcodes_h_l2182_c24_bfaf_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2181_c3_496f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2181_c3_496f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_5e54 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_5e54;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2159_c3_2349 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2159_c3_2349;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2146_l2169_l2140_DUPLICATE_17c0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2146_l2169_l2140_DUPLICATE_17c0_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2184_c11_ef40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_left;
     BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_return_output := BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2178_c11_e416] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_left;
     BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_return_output := BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2182_c24_b8e3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_left;
     BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_return_output := BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2176_c32_f7f3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_left;
     BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_return_output := BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2150_l2173_l2158_l2165_DUPLICATE_f829 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2150_l2173_l2158_l2165_DUPLICATE_f829_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2149_c11_eef9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2140_c6_380b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2164_c11_d255] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_left;
     BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_return_output := BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2161_c11_030f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2169_c11_dfd9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_65f8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_65f8_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2172_l2146_l2169_l2140_DUPLICATE_bdb6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2172_l2146_l2169_l2140_DUPLICATE_bdb6_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2172_c11_7b1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_DUPLICATE_3149 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_DUPLICATE_3149_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2178_l2172_DUPLICATE_439e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2178_l2172_DUPLICATE_439e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2157_c11_5f3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2146_c11_dfd3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2178_l2149_l2172_l2146_l2169_DUPLICATE_fbb4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2178_l2149_l2172_l2146_l2169_DUPLICATE_fbb4_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_151e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_151e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2154_c11_2c88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_left;
     BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_return_output := BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2176_c32_f7f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2140_c2_4135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2140_c2_4135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2140_c6_380b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2146_c7_954b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2146_c7_954b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2146_c11_dfd3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_46f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2149_c7_46f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_eef9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_2c88_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2157_c7_3aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2157_c7_3aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_5f3a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2161_c7_1834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2161_c11_030f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2164_c11_d255_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2169_c7_14e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2169_c11_dfd9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2172_c7_792c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2172_c11_7b1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2178_c11_e416_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_ef40_return_output;
     VAR_MUX_uxn_opcodes_h_l2182_c24_bfaf_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2182_c24_b8e3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2150_l2173_l2158_l2165_DUPLICATE_f829_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2150_l2173_l2158_l2165_DUPLICATE_f829_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2150_l2173_l2158_l2165_DUPLICATE_f829_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_151e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_151e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_151e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_151e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_151e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_151e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_151e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_151e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_151e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2178_l2149_l2172_l2146_l2169_DUPLICATE_fbb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2178_l2149_l2172_l2146_l2169_DUPLICATE_fbb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2178_l2149_l2172_l2146_l2169_DUPLICATE_fbb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2178_l2149_l2172_l2146_l2169_DUPLICATE_fbb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2178_l2149_l2172_l2146_l2169_DUPLICATE_fbb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2178_l2149_l2172_l2146_l2169_DUPLICATE_fbb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2178_l2149_l2172_l2146_l2169_DUPLICATE_fbb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2178_l2149_l2172_l2146_l2169_DUPLICATE_fbb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2178_l2149_l2172_l2146_l2169_DUPLICATE_fbb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2178_l2149_l2172_l2146_l2169_DUPLICATE_fbb4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2146_l2169_l2140_DUPLICATE_17c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2146_l2169_l2140_DUPLICATE_17c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2146_l2169_l2140_DUPLICATE_17c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2146_l2169_l2140_DUPLICATE_17c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2146_l2169_l2140_DUPLICATE_17c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2146_l2169_l2140_DUPLICATE_17c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2146_l2169_l2140_DUPLICATE_17c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2146_l2169_l2140_DUPLICATE_17c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2146_l2169_l2140_DUPLICATE_17c0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_DUPLICATE_3149_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_DUPLICATE_3149_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_DUPLICATE_3149_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_DUPLICATE_3149_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_DUPLICATE_3149_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_DUPLICATE_3149_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_DUPLICATE_3149_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2149_l2172_l2146_l2169_DUPLICATE_3149_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_65f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_65f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_65f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_65f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_65f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_65f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_65f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_65f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_65f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2184_l2154_l2149_l2172_l2146_l2169_l2140_DUPLICATE_65f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2178_l2172_DUPLICATE_439e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2178_l2172_DUPLICATE_439e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2172_l2146_l2169_l2140_DUPLICATE_bdb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2172_l2146_l2169_l2140_DUPLICATE_bdb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2172_l2146_l2169_l2140_DUPLICATE_bdb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2172_l2146_l2169_l2140_DUPLICATE_bdb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2172_l2146_l2169_l2140_DUPLICATE_bdb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2172_l2146_l2169_l2140_DUPLICATE_bdb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2172_l2146_l2169_l2140_DUPLICATE_bdb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2172_l2146_l2169_l2140_DUPLICATE_bdb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2172_l2146_l2169_l2140_DUPLICATE_bdb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2164_l2161_l2157_l2154_l2178_l2149_l2172_l2146_l2169_l2140_DUPLICATE_bdb6_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2172_c7_792c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2140_c1_6fcb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_return_output;

     -- MUX[uxn_opcodes_h_l2182_c24_bfaf] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2182_c24_bfaf_cond <= VAR_MUX_uxn_opcodes_h_l2182_c24_bfaf_cond;
     MUX_uxn_opcodes_h_l2182_c24_bfaf_iftrue <= VAR_MUX_uxn_opcodes_h_l2182_c24_bfaf_iftrue;
     MUX_uxn_opcodes_h_l2182_c24_bfaf_iffalse <= VAR_MUX_uxn_opcodes_h_l2182_c24_bfaf_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2182_c24_bfaf_return_output := MUX_uxn_opcodes_h_l2182_c24_bfaf_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2184_c7_812c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2178_c7_5944] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2184_c7_812c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2176_c32_4ef9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_left;
     BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_return_output := BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2158_c3_10df] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_left;
     BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_return_output := BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2178_c7_5944] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2173_c3_cd9f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_left;
     BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_return_output := BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2176_c32_640f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2176_c32_4ef9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2158_c3_10df_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2173_c3_cd9f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2151_l2166_DUPLICATE_e97a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue := VAR_MUX_uxn_opcodes_h_l2182_c24_bfaf_return_output;
     VAR_printf_uxn_opcodes_h_l2141_c3_47a3_uxn_opcodes_h_l2141_c3_47a3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2140_c1_6fcb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_812c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2178_c7_5944_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2172_c7_792c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_812c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2178_c7_5944_return_output;
     -- MUX[uxn_opcodes_h_l2176_c32_640f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2176_c32_640f_cond <= VAR_MUX_uxn_opcodes_h_l2176_c32_640f_cond;
     MUX_uxn_opcodes_h_l2176_c32_640f_iftrue <= VAR_MUX_uxn_opcodes_h_l2176_c32_640f_iftrue;
     MUX_uxn_opcodes_h_l2176_c32_640f_iffalse <= VAR_MUX_uxn_opcodes_h_l2176_c32_640f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2176_c32_640f_return_output := MUX_uxn_opcodes_h_l2176_c32_640f_return_output;

     -- printf_uxn_opcodes_h_l2141_c3_47a3[uxn_opcodes_h_l2141_c3_47a3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2141_c3_47a3_uxn_opcodes_h_l2141_c3_47a3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2141_c3_47a3_uxn_opcodes_h_l2141_c3_47a3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l2172_c7_792c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2172_c7_792c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2172_c7_792c_cond;
     n16_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue;
     n16_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2172_c7_792c_return_output := n16_MUX_uxn_opcodes_h_l2172_c7_792c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2157_c7_3aac] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2157_c7_3aac_cond <= VAR_t16_MUX_uxn_opcodes_h_l2157_c7_3aac_cond;
     t16_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue;
     t16_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output := t16_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2172_c7_792c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2178_c7_5944] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_return_output := result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2178_c7_5944] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2172_c7_792c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2169_c7_14e2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2178_c7_5944] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue := VAR_MUX_uxn_opcodes_h_l2176_c32_640f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2172_c7_792c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2178_c7_5944_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2172_c7_792c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2178_c7_5944_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2172_c7_792c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2178_c7_5944_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;
     -- n16_MUX[uxn_opcodes_h_l2169_c7_14e2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2169_c7_14e2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2169_c7_14e2_cond;
     n16_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue;
     n16_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output := n16_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2154_c7_dd0d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond;
     t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue;
     t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output := t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2169_c7_14e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2172_c7_792c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2169_c7_14e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2164_c7_3e1b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2172_c7_792c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2172_c7_792c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2172_c7_792c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2172_c7_792c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2172_c7_792c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2172_c7_792c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2172_c7_792c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2169_c7_14e2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2149_c7_46f1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2149_c7_46f1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2149_c7_46f1_cond;
     t16_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue;
     t16_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output := t16_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2169_c7_14e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2161_c7_1834] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2164_c7_3e1b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2169_c7_14e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2169_c7_14e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2164_c7_3e1b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond;
     n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue;
     n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output := n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2164_c7_3e1b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2161_c7_1834_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2169_c7_14e2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2164_c7_3e1b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2161_c7_1834] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2164_c7_3e1b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2157_c7_3aac] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;

     -- t16_MUX[uxn_opcodes_h_l2146_c7_954b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2146_c7_954b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2146_c7_954b_cond;
     t16_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue;
     t16_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2146_c7_954b_return_output := t16_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2161_c7_1834] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2161_c7_1834_cond <= VAR_n16_MUX_uxn_opcodes_h_l2161_c7_1834_cond;
     n16_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue;
     n16_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2161_c7_1834_return_output := n16_MUX_uxn_opcodes_h_l2161_c7_1834_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2161_c7_1834] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2164_c7_3e1b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2164_c7_3e1b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2161_c7_1834_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2161_c7_1834_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2161_c7_1834_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2164_c7_3e1b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2161_c7_1834] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2161_c7_1834] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_return_output;

     -- n16_MUX[uxn_opcodes_h_l2157_c7_3aac] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2157_c7_3aac_cond <= VAR_n16_MUX_uxn_opcodes_h_l2157_c7_3aac_cond;
     n16_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue;
     n16_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output := n16_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2161_c7_1834] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2154_c7_dd0d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2157_c7_3aac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2161_c7_1834] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_return_output := result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_return_output;

     -- t16_MUX[uxn_opcodes_h_l2140_c2_4135] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2140_c2_4135_cond <= VAR_t16_MUX_uxn_opcodes_h_l2140_c2_4135_cond;
     t16_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue;
     t16_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2140_c2_4135_return_output := t16_MUX_uxn_opcodes_h_l2140_c2_4135_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2157_c7_3aac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2161_c7_1834_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2161_c7_1834_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2161_c7_1834_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2161_c7_1834_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2140_c2_4135_return_output;
     -- n16_MUX[uxn_opcodes_h_l2154_c7_dd0d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond;
     n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue;
     n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output := n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2157_c7_3aac] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output := result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2157_c7_3aac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2157_c7_3aac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2149_c7_46f1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2154_c7_dd0d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2154_c7_dd0d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2157_c7_3aac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_3aac_return_output;
     -- n16_MUX[uxn_opcodes_h_l2149_c7_46f1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2149_c7_46f1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_46f1_cond;
     n16_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue;
     n16_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output := n16_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2154_c7_dd0d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2146_c7_954b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2149_c7_46f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2149_c7_46f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2154_c7_dd0d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2154_c7_dd0d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2154_c7_dd0d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2154_c7_dd0d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2149_c7_46f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2146_c7_954b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2146_c7_954b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2146_c7_954b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2146_c7_954b_cond;
     n16_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue;
     n16_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2146_c7_954b_return_output := n16_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2149_c7_46f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2146_c7_954b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2149_c7_46f1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2140_c2_4135] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2149_c7_46f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_46f1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2146_c7_954b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2146_c7_954b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2140_c2_4135] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2140_c2_4135_cond <= VAR_n16_MUX_uxn_opcodes_h_l2140_c2_4135_cond;
     n16_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue;
     n16_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2140_c2_4135_return_output := n16_MUX_uxn_opcodes_h_l2140_c2_4135_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2140_c2_4135] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2146_c7_954b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2146_c7_954b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2140_c2_4135] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2140_c2_4135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2146_c7_954b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2140_c2_4135] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2140_c2_4135] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2140_c2_4135] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2140_c2_4135] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_return_output := result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2189_l2136_DUPLICATE_3c94 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2189_l2136_DUPLICATE_3c94_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2140_c2_4135_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2140_c2_4135_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2140_c2_4135_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2140_c2_4135_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2140_c2_4135_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2140_c2_4135_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2140_c2_4135_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2189_l2136_DUPLICATE_3c94_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2189_l2136_DUPLICATE_3c94_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
