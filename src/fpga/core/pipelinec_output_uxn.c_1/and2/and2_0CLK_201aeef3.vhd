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
-- Submodules: 123
entity and2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_201aeef3;
architecture arch of and2_0CLK_201aeef3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1072_c6_0eee]
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1072_c1_5e4e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1072_c2_084e]
signal n16_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1072_c2_084e]
signal t16_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1072_c2_084e]
signal tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1072_c2_084e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1072_c2_084e]
signal result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1072_c2_084e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1072_c2_084e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1072_c2_084e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1072_c2_084e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1072_c2_084e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1073_c3_480a[uxn_opcodes_h_l1073_c3_480a]
signal printf_uxn_opcodes_h_l1073_c3_480a_uxn_opcodes_h_l1073_c3_480a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1078_c11_ec36]
signal BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1078_c7_9584]
signal n16_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1078_c7_9584]
signal t16_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1078_c7_9584]
signal tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1078_c7_9584]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1078_c7_9584]
signal result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1078_c7_9584]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1078_c7_9584]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1078_c7_9584]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1078_c7_9584]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1078_c7_9584]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1081_c11_9422]
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1081_c7_73de]
signal n16_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1081_c7_73de]
signal t16_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1081_c7_73de]
signal tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1081_c7_73de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1081_c7_73de]
signal result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1081_c7_73de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1081_c7_73de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1081_c7_73de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1081_c7_73de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1081_c7_73de]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1086_c11_ef4b]
signal BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1086_c7_3087]
signal n16_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1086_c7_3087]
signal t16_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1086_c7_3087]
signal tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1086_c7_3087]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1086_c7_3087]
signal result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1086_c7_3087]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1086_c7_3087]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1086_c7_3087]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1086_c7_3087]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1086_c7_3087]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1089_c11_55f3]
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1089_c7_a15c]
signal n16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1089_c7_a15c]
signal t16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1089_c7_a15c]
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1089_c7_a15c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1089_c7_a15c]
signal result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1089_c7_a15c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1089_c7_a15c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1089_c7_a15c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1089_c7_a15c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1089_c7_a15c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1090_c3_694f]
signal BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1093_c11_6877]
signal BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1093_c7_f78d]
signal n16_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1093_c7_f78d]
signal tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1093_c7_f78d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1093_c7_f78d]
signal result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1093_c7_f78d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1093_c7_f78d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1093_c7_f78d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1093_c7_f78d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1093_c7_f78d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1096_c11_0836]
signal BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1096_c7_7755]
signal n16_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1096_c7_7755]
signal tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1096_c7_7755]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1096_c7_7755]
signal result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1096_c7_7755]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1096_c7_7755]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1096_c7_7755]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1096_c7_7755]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1096_c7_7755]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_6f5e]
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1101_c7_f627]
signal n16_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1101_c7_f627]
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1101_c7_f627]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1101_c7_f627]
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_f627]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1101_c7_f627]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_f627]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_f627]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1101_c7_f627]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1104_c11_7bea]
signal BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1104_c7_9744]
signal n16_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1104_c7_9744]
signal tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1104_c7_9744]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1104_c7_9744]
signal result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1104_c7_9744]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1104_c7_9744]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1104_c7_9744]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1104_c7_9744]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1104_c7_9744]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1105_c3_990b]
signal BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1106_c11_a7ff]
signal BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1109_c32_9405]
signal BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1109_c32_38b4]
signal BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1109_c32_be26]
signal MUX_uxn_opcodes_h_l1109_c32_be26_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1109_c32_be26_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1109_c32_be26_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1109_c32_be26_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1111_c11_55f1]
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1111_c7_d534]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1111_c7_d534]
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c7_d534]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c7_d534]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c7_d534]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1117_c11_520e]
signal BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1117_c7_d7d5]
signal result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1117_c7_d7d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1117_c7_d7d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1117_c7_d7d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1119_c34_28ec]
signal CONST_SR_8_uxn_opcodes_h_l1119_c34_28ec_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1119_c34_28ec_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1121_c11_1382]
signal BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1121_c7_63f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1121_c7_63f5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

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
-- BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee
BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_left,
BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_right,
BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_return_output);

-- n16_MUX_uxn_opcodes_h_l1072_c2_084e
n16_MUX_uxn_opcodes_h_l1072_c2_084e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1072_c2_084e_cond,
n16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue,
n16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse,
n16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output);

-- t16_MUX_uxn_opcodes_h_l1072_c2_084e
t16_MUX_uxn_opcodes_h_l1072_c2_084e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1072_c2_084e_cond,
t16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue,
t16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse,
t16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1072_c2_084e
tmp16_MUX_uxn_opcodes_h_l1072_c2_084e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_cond,
tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e
result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e
result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_return_output);

-- printf_uxn_opcodes_h_l1073_c3_480a_uxn_opcodes_h_l1073_c3_480a
printf_uxn_opcodes_h_l1073_c3_480a_uxn_opcodes_h_l1073_c3_480a : entity work.printf_uxn_opcodes_h_l1073_c3_480a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1073_c3_480a_uxn_opcodes_h_l1073_c3_480a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36
BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_left,
BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_right,
BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_return_output);

-- n16_MUX_uxn_opcodes_h_l1078_c7_9584
n16_MUX_uxn_opcodes_h_l1078_c7_9584 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1078_c7_9584_cond,
n16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue,
n16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse,
n16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output);

-- t16_MUX_uxn_opcodes_h_l1078_c7_9584
t16_MUX_uxn_opcodes_h_l1078_c7_9584 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1078_c7_9584_cond,
t16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue,
t16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse,
t16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1078_c7_9584
tmp16_MUX_uxn_opcodes_h_l1078_c7_9584 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_cond,
tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue,
tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse,
tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584
result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584
result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_cond,
result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584
result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584
result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584
result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584
result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_left,
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_right,
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_return_output);

-- n16_MUX_uxn_opcodes_h_l1081_c7_73de
n16_MUX_uxn_opcodes_h_l1081_c7_73de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1081_c7_73de_cond,
n16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue,
n16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse,
n16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output);

-- t16_MUX_uxn_opcodes_h_l1081_c7_73de
t16_MUX_uxn_opcodes_h_l1081_c7_73de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1081_c7_73de_cond,
t16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue,
t16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse,
t16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1081_c7_73de
tmp16_MUX_uxn_opcodes_h_l1081_c7_73de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_cond,
tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue,
tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse,
tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de
result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_cond,
result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de
result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b
BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_left,
BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_right,
BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_return_output);

-- n16_MUX_uxn_opcodes_h_l1086_c7_3087
n16_MUX_uxn_opcodes_h_l1086_c7_3087 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1086_c7_3087_cond,
n16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue,
n16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse,
n16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output);

-- t16_MUX_uxn_opcodes_h_l1086_c7_3087
t16_MUX_uxn_opcodes_h_l1086_c7_3087 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1086_c7_3087_cond,
t16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue,
t16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse,
t16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1086_c7_3087
tmp16_MUX_uxn_opcodes_h_l1086_c7_3087 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_cond,
tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue,
tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse,
tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087
result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087
result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_cond,
result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087
result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087
result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087
result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087
result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_left,
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_right,
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_return_output);

-- n16_MUX_uxn_opcodes_h_l1089_c7_a15c
n16_MUX_uxn_opcodes_h_l1089_c7_a15c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond,
n16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue,
n16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse,
n16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output);

-- t16_MUX_uxn_opcodes_h_l1089_c7_a15c
t16_MUX_uxn_opcodes_h_l1089_c7_a15c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond,
t16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue,
t16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse,
t16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c
tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond,
tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f
BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_left,
BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_right,
BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877
BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_left,
BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_right,
BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_return_output);

-- n16_MUX_uxn_opcodes_h_l1093_c7_f78d
n16_MUX_uxn_opcodes_h_l1093_c7_f78d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1093_c7_f78d_cond,
n16_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue,
n16_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse,
n16_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d
tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_cond,
tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d
result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d
result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d
result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836
BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_left,
BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_right,
BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_return_output);

-- n16_MUX_uxn_opcodes_h_l1096_c7_7755
n16_MUX_uxn_opcodes_h_l1096_c7_7755 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1096_c7_7755_cond,
n16_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue,
n16_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse,
n16_MUX_uxn_opcodes_h_l1096_c7_7755_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1096_c7_7755
tmp16_MUX_uxn_opcodes_h_l1096_c7_7755 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_cond,
tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue,
tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse,
tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755
result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_cond,
result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755
result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_left,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_right,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_return_output);

-- n16_MUX_uxn_opcodes_h_l1101_c7_f627
n16_MUX_uxn_opcodes_h_l1101_c7_f627 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1101_c7_f627_cond,
n16_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue,
n16_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse,
n16_MUX_uxn_opcodes_h_l1101_c7_f627_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1101_c7_f627
tmp16_MUX_uxn_opcodes_h_l1101_c7_f627 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_cond,
tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue,
tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse,
tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_cond,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627
result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_left,
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_right,
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_return_output);

-- n16_MUX_uxn_opcodes_h_l1104_c7_9744
n16_MUX_uxn_opcodes_h_l1104_c7_9744 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1104_c7_9744_cond,
n16_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue,
n16_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse,
n16_MUX_uxn_opcodes_h_l1104_c7_9744_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1104_c7_9744
tmp16_MUX_uxn_opcodes_h_l1104_c7_9744 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_cond,
tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue,
tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse,
tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744
result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_cond,
result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744
result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b
BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_left,
BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_right,
BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff
BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_left,
BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_right,
BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405
BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_left,
BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_right,
BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4
BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_left,
BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_right,
BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_return_output);

-- MUX_uxn_opcodes_h_l1109_c32_be26
MUX_uxn_opcodes_h_l1109_c32_be26 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1109_c32_be26_cond,
MUX_uxn_opcodes_h_l1109_c32_be26_iftrue,
MUX_uxn_opcodes_h_l1109_c32_be26_iffalse,
MUX_uxn_opcodes_h_l1109_c32_be26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_left,
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_right,
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534
result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_cond,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e
BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_left,
BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_right,
BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1119_c34_28ec
CONST_SR_8_uxn_opcodes_h_l1119_c34_28ec : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1119_c34_28ec_x,
CONST_SR_8_uxn_opcodes_h_l1119_c34_28ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_left,
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_right,
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e
CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_return_output,
 n16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output,
 t16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_return_output,
 n16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output,
 t16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output,
 tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_return_output,
 n16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output,
 t16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output,
 tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_return_output,
 n16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output,
 t16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output,
 tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_return_output,
 n16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output,
 t16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_return_output,
 n16_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_return_output,
 n16_MUX_uxn_opcodes_h_l1096_c7_7755_return_output,
 tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_return_output,
 n16_MUX_uxn_opcodes_h_l1101_c7_f627_return_output,
 tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_return_output,
 n16_MUX_uxn_opcodes_h_l1104_c7_9744_return_output,
 tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_return_output,
 MUX_uxn_opcodes_h_l1109_c32_be26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output,
 CONST_SR_8_uxn_opcodes_h_l1119_c34_28ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1075_c3_2515 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1073_c3_480a_uxn_opcodes_h_l1073_c3_480a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1079_c3_2028 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1084_c3_2eb5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_f587 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1091_c3_3bb1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_9e35 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_0d51 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1102_c3_c5a5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1109_c32_be26_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1109_c32_be26_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1109_c32_be26_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1109_c32_be26_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1114_c3_ebbf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1115_c24_5ec1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_8ffd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1119_c34_28ec_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1119_c34_28ec_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1119_c24_4669_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1086_l1111_l1081_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_d920_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_a422_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1121_l1089_DUPLICATE_4b9f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_f535_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1086_l1111_l1081_l1104_l1078_l1101_l1096_l1093_l1121_l1089_DUPLICATE_5fde_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1096_l1093_l1089_DUPLICATE_8bf0_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1082_l1105_l1090_l1097_DUPLICATE_f8d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1117_l1104_DUPLICATE_ab5f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1126_l1068_DUPLICATE_69f2_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1091_c3_3bb1 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1091_c3_3bb1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_right := to_unsigned(11, 4);
     VAR_MUX_uxn_opcodes_h_l1109_c32_be26_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_9e35 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_9e35;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_8ffd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_8ffd;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1084_c3_2eb5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1084_c3_2eb5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1075_c3_2515 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1075_c3_2515;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1114_c3_ebbf := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1114_c3_ebbf;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1079_c3_2028 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1079_c3_2028;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1102_c3_c5a5 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1102_c3_c5a5;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_f587 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_f587;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_0d51 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_0d51;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_right := to_unsigned(8, 4);
     VAR_MUX_uxn_opcodes_h_l1109_c32_be26_iffalse := resize(to_signed(-2, 3), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1119_c34_28ec_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1096_c11_0836] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_left;
     BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_return_output := BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1111_c11_55f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1072_c6_0eee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1081_c11_9422] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_left;
     BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_return_output := BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_a422 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_a422_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1117_l1104_DUPLICATE_ab5f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1117_l1104_DUPLICATE_ab5f_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_f535 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_f535_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1117_c11_520e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1104_c11_7bea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_left;
     BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_return_output := BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1121_c11_1382] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_left;
     BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_return_output := BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1119_c34_28ec] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1119_c34_28ec_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1119_c34_28ec_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1119_c34_28ec_return_output := CONST_SR_8_uxn_opcodes_h_l1119_c34_28ec_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1096_l1093_l1089_DUPLICATE_8bf0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1096_l1093_l1089_DUPLICATE_8bf0_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1089_c11_55f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_6f5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1078_c11_ec36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_left;
     BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_return_output := BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1115_c24_5ec1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1115_c24_5ec1_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_AND[uxn_opcodes_h_l1109_c32_9405] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_left;
     BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_return_output := BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1086_c11_ef4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1082_l1105_l1090_l1097_DUPLICATE_f8d8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1082_l1105_l1090_l1097_DUPLICATE_f8d8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1086_l1111_l1081_l1104_l1078_l1101_l1096_l1093_l1121_l1089_DUPLICATE_5fde LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1086_l1111_l1081_l1104_l1078_l1101_l1096_l1093_l1121_l1089_DUPLICATE_5fde_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1086_l1111_l1081_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_d920 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1086_l1111_l1081_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_d920_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1093_c11_6877] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_left;
     BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_return_output := BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1121_l1089_DUPLICATE_4b9f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1121_l1089_DUPLICATE_4b9f_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1109_c32_9405_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1072_c2_084e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1072_c2_084e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c6_0eee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1078_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1078_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1078_c11_ec36_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1081_c7_73de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1081_c7_73de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_9422_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1086_c7_3087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1086_c7_3087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1086_c11_ef4b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_55f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1093_c7_f78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c11_6877_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1096_c7_7755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_0836_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1101_c7_f627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6f5e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1104_c7_9744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_7bea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_55f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_520e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_1382_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1082_l1105_l1090_l1097_DUPLICATE_f8d8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1082_l1105_l1090_l1097_DUPLICATE_f8d8_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1082_l1105_l1090_l1097_DUPLICATE_f8d8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1115_c24_5ec1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_f535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_f535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_f535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_f535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_f535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_f535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_f535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_f535_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_f535_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1086_l1111_l1081_l1104_l1078_l1101_l1096_l1093_l1121_l1089_DUPLICATE_5fde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1086_l1111_l1081_l1104_l1078_l1101_l1096_l1093_l1121_l1089_DUPLICATE_5fde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1086_l1111_l1081_l1104_l1078_l1101_l1096_l1093_l1121_l1089_DUPLICATE_5fde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1086_l1111_l1081_l1104_l1078_l1101_l1096_l1093_l1121_l1089_DUPLICATE_5fde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1086_l1111_l1081_l1104_l1078_l1101_l1096_l1093_l1121_l1089_DUPLICATE_5fde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1086_l1111_l1081_l1104_l1078_l1101_l1096_l1093_l1121_l1089_DUPLICATE_5fde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1086_l1111_l1081_l1104_l1078_l1101_l1096_l1093_l1121_l1089_DUPLICATE_5fde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1086_l1111_l1081_l1104_l1078_l1101_l1096_l1093_l1121_l1089_DUPLICATE_5fde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1086_l1111_l1081_l1104_l1078_l1101_l1096_l1093_l1121_l1089_DUPLICATE_5fde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1086_l1111_l1081_l1104_l1078_l1101_l1096_l1093_l1121_l1089_DUPLICATE_5fde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1086_l1111_l1081_l1104_l1078_l1101_l1096_l1093_l1121_l1089_DUPLICATE_5fde_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1086_l1111_l1081_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_d920_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1086_l1111_l1081_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_d920_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1086_l1111_l1081_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_d920_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1086_l1111_l1081_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_d920_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1086_l1111_l1081_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_d920_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1086_l1111_l1081_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_d920_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1086_l1111_l1081_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_d920_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1086_l1111_l1081_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_d920_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1086_l1111_l1081_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_d920_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1096_l1093_l1089_DUPLICATE_8bf0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1096_l1093_l1089_DUPLICATE_8bf0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1096_l1093_l1089_DUPLICATE_8bf0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1096_l1093_l1089_DUPLICATE_8bf0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1096_l1093_l1089_DUPLICATE_8bf0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1096_l1093_l1089_DUPLICATE_8bf0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1096_l1093_l1089_DUPLICATE_8bf0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1086_l1081_l1104_l1078_l1101_l1096_l1093_l1089_DUPLICATE_8bf0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1121_l1089_DUPLICATE_4b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1121_l1089_DUPLICATE_4b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1121_l1089_DUPLICATE_4b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1121_l1089_DUPLICATE_4b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1121_l1089_DUPLICATE_4b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1121_l1089_DUPLICATE_4b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1121_l1089_DUPLICATE_4b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1121_l1089_DUPLICATE_4b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1121_l1089_DUPLICATE_4b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1121_l1089_DUPLICATE_4b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1121_l1089_DUPLICATE_4b9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1117_l1104_DUPLICATE_ab5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1117_l1104_DUPLICATE_ab5f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_a422_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_a422_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_a422_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_a422_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_a422_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_a422_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_a422_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_a422_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_a422_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1086_l1081_l1104_l1078_l1101_l1072_l1096_l1093_l1089_DUPLICATE_a422_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1119_c24_4669] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1119_c24_4669_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1119_c34_28ec_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1072_c1_5e4e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1111_c7_d534] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1090_c3_694f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_left;
     BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_return_output := BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1117_c7_d7d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1121_c7_63f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1109_c32_38b4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_left;
     BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_return_output := BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1105_c3_990b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_left;
     BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_return_output := BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1104_c7_9744] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1121_c7_63f5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1109_c32_be26_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1109_c32_38b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_694f_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1105_c3_990b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1119_c24_4669_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1098_l1083_DUPLICATE_527e_return_output;
     VAR_printf_uxn_opcodes_h_l1073_c3_480a_uxn_opcodes_h_l1073_c3_480a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1072_c1_5e4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_63f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_d534_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_63f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output;
     -- n16_MUX[uxn_opcodes_h_l1104_c7_9744] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1104_c7_9744_cond <= VAR_n16_MUX_uxn_opcodes_h_l1104_c7_9744_cond;
     n16_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue;
     n16_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1104_c7_9744_return_output := n16_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c7_d534] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_return_output;

     -- MUX[uxn_opcodes_h_l1109_c32_be26] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1109_c32_be26_cond <= VAR_MUX_uxn_opcodes_h_l1109_c32_be26_cond;
     MUX_uxn_opcodes_h_l1109_c32_be26_iftrue <= VAR_MUX_uxn_opcodes_h_l1109_c32_be26_iftrue;
     MUX_uxn_opcodes_h_l1109_c32_be26_iffalse <= VAR_MUX_uxn_opcodes_h_l1109_c32_be26_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1109_c32_be26_return_output := MUX_uxn_opcodes_h_l1109_c32_be26_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1117_c7_d7d5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1117_c7_d7d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1106_c11_a7ff] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_left;
     BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_return_output := BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_return_output;

     -- t16_MUX[uxn_opcodes_h_l1089_c7_a15c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond;
     t16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue;
     t16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output := t16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1104_c7_9744] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;

     -- printf_uxn_opcodes_h_l1073_c3_480a[uxn_opcodes_h_l1073_c3_480a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1073_c3_480a_uxn_opcodes_h_l1073_c3_480a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1073_c3_480a_uxn_opcodes_h_l1073_c3_480a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1101_c7_f627] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1117_c7_d7d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l1106_c11_a7ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue := VAR_MUX_uxn_opcodes_h_l1109_c32_be26_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d534_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_d7d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;
     -- t16_MUX[uxn_opcodes_h_l1086_c7_3087] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1086_c7_3087_cond <= VAR_t16_MUX_uxn_opcodes_h_l1086_c7_3087_cond;
     t16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue;
     t16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output := t16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1111_c7_d534] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_return_output := result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c7_d534] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c7_d534] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1104_c7_9744] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1104_c7_9744] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_cond;
     tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_return_output := tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;

     -- n16_MUX[uxn_opcodes_h_l1101_c7_f627] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1101_c7_f627_cond <= VAR_n16_MUX_uxn_opcodes_h_l1101_c7_f627_cond;
     n16_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue;
     n16_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1101_c7_f627_return_output := n16_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1096_c7_7755] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1104_c7_9744] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1101_c7_f627] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d534_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d534_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d534_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_f627] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1096_c7_7755] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1093_c7_f78d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1081_c7_73de] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1081_c7_73de_cond <= VAR_t16_MUX_uxn_opcodes_h_l1081_c7_73de_cond;
     t16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue;
     t16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output := t16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;

     -- n16_MUX[uxn_opcodes_h_l1096_c7_7755] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1096_c7_7755_cond <= VAR_n16_MUX_uxn_opcodes_h_l1096_c7_7755_cond;
     n16_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue;
     n16_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1096_c7_7755_return_output := n16_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1104_c7_9744] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_return_output := result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1101_c7_f627] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1104_c7_9744] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1101_c7_f627] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_cond;
     tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_return_output := tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1104_c7_9744] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_9744_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_f627] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1089_c7_a15c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1101_c7_f627] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_return_output := result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1093_c7_f78d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1096_c7_7755] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_cond;
     tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_return_output := tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;

     -- t16_MUX[uxn_opcodes_h_l1078_c7_9584] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1078_c7_9584_cond <= VAR_t16_MUX_uxn_opcodes_h_l1078_c7_9584_cond;
     t16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue;
     t16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output := t16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1096_c7_7755] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_f627] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1096_c7_7755] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;

     -- n16_MUX[uxn_opcodes_h_l1093_c7_f78d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1093_c7_f78d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1093_c7_f78d_cond;
     n16_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue;
     n16_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output := n16_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_f627_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1093_c7_f78d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1089_c7_a15c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1072_c2_084e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1072_c2_084e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1072_c2_084e_cond;
     t16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue;
     t16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output := t16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1093_c7_f78d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_cond;
     tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output := tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1096_c7_7755] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_return_output := result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1086_c7_3087] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1093_c7_f78d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1096_c7_7755] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1096_c7_7755] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;

     -- n16_MUX[uxn_opcodes_h_l1089_c7_a15c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond;
     n16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue;
     n16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output := n16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1096_c7_7755_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1089_c7_a15c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1086_c7_3087] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1089_c7_a15c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_cond;
     tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output := tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1093_c7_f78d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1089_c7_a15c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1081_c7_73de] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1093_c7_f78d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1086_c7_3087] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1086_c7_3087_cond <= VAR_n16_MUX_uxn_opcodes_h_l1086_c7_3087_cond;
     n16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue;
     n16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output := n16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1093_c7_f78d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c7_f78d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1089_c7_a15c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1089_c7_a15c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1078_c7_9584] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1086_c7_3087] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_cond;
     tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output := tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1081_c7_73de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;

     -- n16_MUX[uxn_opcodes_h_l1081_c7_73de] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1081_c7_73de_cond <= VAR_n16_MUX_uxn_opcodes_h_l1081_c7_73de_cond;
     n16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue;
     n16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output := n16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1086_c7_3087] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1089_c7_a15c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1086_c7_3087] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_a15c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1086_c7_3087] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_return_output := result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1086_c7_3087] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1072_c2_084e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1081_c7_73de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1081_c7_73de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1081_c7_73de] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_cond;
     tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output := tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;

     -- n16_MUX[uxn_opcodes_h_l1078_c7_9584] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1078_c7_9584_cond <= VAR_n16_MUX_uxn_opcodes_h_l1078_c7_9584_cond;
     n16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue;
     n16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output := n16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1086_c7_3087] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1078_c7_9584] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1086_c7_3087_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;
     -- n16_MUX[uxn_opcodes_h_l1072_c2_084e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1072_c2_084e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1072_c2_084e_cond;
     n16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue;
     n16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output := n16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1081_c7_73de] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_return_output := result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1081_c7_73de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1078_c7_9584] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_cond;
     tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output := tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1078_c7_9584] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1078_c7_9584] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1081_c7_73de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1072_c2_084e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1081_c7_73de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1072_c2_084e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1072_c2_084e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_cond;
     tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output := tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1078_c7_9584] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_return_output := result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1078_c7_9584] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1072_c2_084e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1078_c7_9584] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1078_c7_9584_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1072_c2_084e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1072_c2_084e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1072_c2_084e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1072_c2_084e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1126_l1068_DUPLICATE_69f2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1126_l1068_DUPLICATE_69f2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c2_084e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1072_c2_084e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c2_084e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c2_084e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c2_084e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c2_084e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1072_c2_084e_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1126_l1068_DUPLICATE_69f2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1126_l1068_DUPLICATE_69f2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
