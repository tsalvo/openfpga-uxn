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
-- Submodules: 114
entity ora2_0CLK_df1f1450 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_df1f1450;
architecture arch of ora2_0CLK_df1f1450 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1093_c6_8918]
signal BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1093_c1_c338]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1093_c2_f90a]
signal n16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1093_c2_f90a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1093_c2_f90a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1093_c2_f90a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1093_c2_f90a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1093_c2_f90a]
signal result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1093_c2_f90a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1093_c2_f90a]
signal tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1093_c2_f90a]
signal t16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1094_c3_c117[uxn_opcodes_h_l1094_c3_c117]
signal printf_uxn_opcodes_h_l1094_c3_c117_uxn_opcodes_h_l1094_c3_c117_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1098_c11_8d7c]
signal BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1098_c7_1930]
signal n16_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1098_c7_1930]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1098_c7_1930]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1098_c7_1930]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1098_c7_1930]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1098_c7_1930]
signal result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1098_c7_1930]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1098_c7_1930]
signal tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1098_c7_1930]
signal t16_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_3c3a]
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1101_c7_15af]
signal n16_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_15af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_15af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1101_c7_15af]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_15af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1101_c7_15af]
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1101_c7_15af]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1101_c7_15af]
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1101_c7_15af]
signal t16_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1106_c11_aa0e]
signal BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1106_c7_9b99]
signal n16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1106_c7_9b99]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1106_c7_9b99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1106_c7_9b99]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1106_c7_9b99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1106_c7_9b99]
signal result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1106_c7_9b99]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1106_c7_9b99]
signal tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1106_c7_9b99]
signal t16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1109_c11_2d86]
signal BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1109_c7_224e]
signal n16_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1109_c7_224e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1109_c7_224e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1109_c7_224e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1109_c7_224e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1109_c7_224e]
signal result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1109_c7_224e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1109_c7_224e]
signal tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1109_c7_224e]
signal t16_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1110_c3_f392]
signal BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1113_c11_af17]
signal BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1113_c7_e42a]
signal n16_MUX_uxn_opcodes_h_l1113_c7_e42a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1113_c7_e42a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1113_c7_e42a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1113_c7_e42a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1113_c7_e42a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1113_c7_e42a]
signal result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1113_c7_e42a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1113_c7_e42a]
signal tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1116_c11_18d6]
signal BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1116_c7_bc65]
signal n16_MUX_uxn_opcodes_h_l1116_c7_bc65_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1116_c7_bc65]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1116_c7_bc65]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1116_c7_bc65]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1116_c7_bc65]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1116_c7_bc65]
signal result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1116_c7_bc65]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1116_c7_bc65]
signal tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1121_c11_9034]
signal BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1121_c7_3c6b]
signal n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1121_c7_3c6b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1121_c7_3c6b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1121_c7_3c6b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1121_c7_3c6b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1121_c7_3c6b]
signal result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1121_c7_3c6b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1121_c7_3c6b]
signal tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_f5b8]
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1124_c7_e5b6]
signal n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_e5b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_e5b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1124_c7_e5b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_e5b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1124_c7_e5b6]
signal result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1124_c7_e5b6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1124_c7_e5b6]
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1125_c3_7209]
signal BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1126_c11_9e51]
signal BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1128_c32_078b]
signal BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1128_c32_5006]
signal BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1128_c32_0fc7]
signal MUX_uxn_opcodes_h_l1128_c32_0fc7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1128_c32_0fc7_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1128_c32_0fc7_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1128_c32_0fc7_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1130_c11_5c60]
signal BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1130_c7_6620]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1130_c7_6620]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1130_c7_6620]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1130_c7_6620]
signal result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1130_c7_6620]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1136_c11_f703]
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1136_c7_f585]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1136_c7_f585]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1136_c7_f585]
signal result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1136_c7_f585]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1138_c34_d757]
signal CONST_SR_8_uxn_opcodes_h_l1138_c34_d757_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1138_c34_d757_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_31c5]
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_eca7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_eca7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_53ff( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918
BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_left,
BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_right,
BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_return_output);

-- n16_MUX_uxn_opcodes_h_l1093_c2_f90a
n16_MUX_uxn_opcodes_h_l1093_c2_f90a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond,
n16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue,
n16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse,
n16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a
result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a
result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a
tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond,
tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output);

-- t16_MUX_uxn_opcodes_h_l1093_c2_f90a
t16_MUX_uxn_opcodes_h_l1093_c2_f90a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond,
t16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue,
t16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse,
t16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output);

-- printf_uxn_opcodes_h_l1094_c3_c117_uxn_opcodes_h_l1094_c3_c117
printf_uxn_opcodes_h_l1094_c3_c117_uxn_opcodes_h_l1094_c3_c117 : entity work.printf_uxn_opcodes_h_l1094_c3_c117_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1094_c3_c117_uxn_opcodes_h_l1094_c3_c117_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c
BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_left,
BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_right,
BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_return_output);

-- n16_MUX_uxn_opcodes_h_l1098_c7_1930
n16_MUX_uxn_opcodes_h_l1098_c7_1930 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1098_c7_1930_cond,
n16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue,
n16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse,
n16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930
result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930
result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930
result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930
result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_cond,
result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930
result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1098_c7_1930
tmp16_MUX_uxn_opcodes_h_l1098_c7_1930 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_cond,
tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue,
tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse,
tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output);

-- t16_MUX_uxn_opcodes_h_l1098_c7_1930
t16_MUX_uxn_opcodes_h_l1098_c7_1930 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1098_c7_1930_cond,
t16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue,
t16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse,
t16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_left,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_right,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_return_output);

-- n16_MUX_uxn_opcodes_h_l1101_c7_15af
n16_MUX_uxn_opcodes_h_l1101_c7_15af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1101_c7_15af_cond,
n16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue,
n16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse,
n16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_cond,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1101_c7_15af
tmp16_MUX_uxn_opcodes_h_l1101_c7_15af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_cond,
tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue,
tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse,
tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output);

-- t16_MUX_uxn_opcodes_h_l1101_c7_15af
t16_MUX_uxn_opcodes_h_l1101_c7_15af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1101_c7_15af_cond,
t16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue,
t16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse,
t16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e
BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_left,
BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_right,
BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_return_output);

-- n16_MUX_uxn_opcodes_h_l1106_c7_9b99
n16_MUX_uxn_opcodes_h_l1106_c7_9b99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond,
n16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue,
n16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse,
n16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99
result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99
result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99
result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99
result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_cond,
result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99
result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99
tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond,
tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue,
tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse,
tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output);

-- t16_MUX_uxn_opcodes_h_l1106_c7_9b99
t16_MUX_uxn_opcodes_h_l1106_c7_9b99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond,
t16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue,
t16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse,
t16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86
BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_left,
BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_right,
BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_return_output);

-- n16_MUX_uxn_opcodes_h_l1109_c7_224e
n16_MUX_uxn_opcodes_h_l1109_c7_224e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1109_c7_224e_cond,
n16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue,
n16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse,
n16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e
result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e
result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e
result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e
result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1109_c7_224e
tmp16_MUX_uxn_opcodes_h_l1109_c7_224e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_cond,
tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output);

-- t16_MUX_uxn_opcodes_h_l1109_c7_224e
t16_MUX_uxn_opcodes_h_l1109_c7_224e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1109_c7_224e_cond,
t16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue,
t16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse,
t16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392
BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_left,
BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_right,
BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17
BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_left,
BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_right,
BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_return_output);

-- n16_MUX_uxn_opcodes_h_l1113_c7_e42a
n16_MUX_uxn_opcodes_h_l1113_c7_e42a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1113_c7_e42a_cond,
n16_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue,
n16_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse,
n16_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a
tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_cond,
tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6
BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_left,
BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_right,
BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_return_output);

-- n16_MUX_uxn_opcodes_h_l1116_c7_bc65
n16_MUX_uxn_opcodes_h_l1116_c7_bc65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1116_c7_bc65_cond,
n16_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue,
n16_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse,
n16_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65
result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65
result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_cond,
result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65
tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_cond,
tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue,
tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse,
tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_left,
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_right,
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_return_output);

-- n16_MUX_uxn_opcodes_h_l1121_c7_3c6b
n16_MUX_uxn_opcodes_h_l1121_c7_3c6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond,
n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue,
n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse,
n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b
result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b
result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b
tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond,
tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_left,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_right,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_return_output);

-- n16_MUX_uxn_opcodes_h_l1124_c7_e5b6
n16_MUX_uxn_opcodes_h_l1124_c7_e5b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond,
n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue,
n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse,
n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6
result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6
result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6
tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond,
tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209
BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_left,
BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_right,
BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51
BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_left,
BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_right,
BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b
BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_left,
BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_right,
BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006
BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_left,
BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_right,
BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_return_output);

-- MUX_uxn_opcodes_h_l1128_c32_0fc7
MUX_uxn_opcodes_h_l1128_c32_0fc7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1128_c32_0fc7_cond,
MUX_uxn_opcodes_h_l1128_c32_0fc7_iftrue,
MUX_uxn_opcodes_h_l1128_c32_0fc7_iffalse,
MUX_uxn_opcodes_h_l1128_c32_0fc7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60
BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_left,
BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_right,
BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620
result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620
result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620
result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_cond,
result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620
result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_left,
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_right,
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585
result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_cond,
result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1138_c34_d757
CONST_SR_8_uxn_opcodes_h_l1138_c34_d757 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1138_c34_d757_x,
CONST_SR_8_uxn_opcodes_h_l1138_c34_d757_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_left,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_right,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b
CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_return_output,
 n16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output,
 t16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_return_output,
 n16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_return_output,
 tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output,
 t16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_return_output,
 n16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_return_output,
 tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output,
 t16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_return_output,
 n16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output,
 tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output,
 t16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_return_output,
 n16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output,
 t16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_return_output,
 n16_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_return_output,
 n16_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output,
 tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_return_output,
 n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_return_output,
 n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_return_output,
 MUX_uxn_opcodes_h_l1128_c32_0fc7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_return_output,
 CONST_SR_8_uxn_opcodes_h_l1138_c34_d757_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1095_c3_d6f8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1094_c3_c117_uxn_opcodes_h_l1094_c3_c117_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_f07b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1098_c7_1930_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1104_c3_141f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1101_c7_15af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1107_c3_c149 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1111_c3_1ac7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1109_c7_224e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1113_c7_e42a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1114_c3_6673 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1116_c7_bc65_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1119_c3_4457 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1122_c3_273d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1128_c32_0fc7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1128_c32_0fc7_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1128_c32_0fc7_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1128_c32_0fc7_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1133_c3_c6c8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1134_c24_079a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1137_c3_9afe : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1138_c34_d757_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1138_c34_d757_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1138_c24_e722_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1140_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_0bfe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1101_l1124_l1098_l1121_DUPLICATE_672a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_059d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1130_l1101_l1098_l1121_DUPLICATE_be8f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1116_l1113_l1140_l1109_l1136_l1106_l1130_l1101_l1124_l1098_l1121_DUPLICATE_2c18_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1102_l1125_l1117_l1110_DUPLICATE_8dee_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1124_DUPLICATE_19ba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1145_l1089_DUPLICATE_573b_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_f07b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_f07b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1114_c3_6673 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1114_c3_6673;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1128_c32_0fc7_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1122_c3_273d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1122_c3_273d;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1111_c3_1ac7 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1111_c3_1ac7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1133_c3_c6c8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1133_c3_c6c8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1107_c3_c149 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1107_c3_c149;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1095_c3_d6f8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1095_c3_d6f8;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1128_c32_0fc7_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1137_c3_9afe := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1137_c3_9afe;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1119_c3_4457 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1119_c3_4457;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1104_c3_141f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1104_c3_141f;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1138_c34_d757_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1116_l1113_l1140_l1109_l1136_l1106_l1130_l1101_l1124_l1098_l1121_DUPLICATE_2c18 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1116_l1113_l1140_l1109_l1136_l1106_l1130_l1101_l1124_l1098_l1121_DUPLICATE_2c18_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1121_c11_9034] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_left;
     BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_return_output := BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1106_c11_aa0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1101_l1124_l1098_l1121_DUPLICATE_672a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1101_l1124_l1098_l1121_DUPLICATE_672a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_3c3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1134_c24_079a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1134_c24_079a_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_AND[uxn_opcodes_h_l1128_c32_078b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_left;
     BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_return_output := BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1130_l1101_l1098_l1121_DUPLICATE_be8f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1130_l1101_l1098_l1121_DUPLICATE_be8f_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l1138_c34_d757] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1138_c34_d757_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1138_c34_d757_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1138_c34_d757_return_output := CONST_SR_8_uxn_opcodes_h_l1138_c34_d757_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1113_c11_af17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_left;
     BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_return_output := BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_f5b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1098_c11_8d7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_31c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1109_c11_2d86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_left;
     BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_return_output := BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_059d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_059d_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1116_c11_18d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1124_DUPLICATE_19ba LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1124_DUPLICATE_19ba_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1130_c11_5c60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_left;
     BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_return_output := BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1102_l1125_l1117_l1110_DUPLICATE_8dee LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1102_l1125_l1117_l1110_DUPLICATE_8dee_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1140_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_0bfe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1140_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_0bfe_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1136_c11_f703] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_left;
     BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_return_output := BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1093_c6_8918] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_left;
     BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_return_output := BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1128_c32_078b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1093_c6_8918_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1098_c7_1930_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1098_c7_1930_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1098_c11_8d7c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1101_c7_15af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1101_c7_15af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3c3a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1106_c11_aa0e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1109_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1109_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c11_2d86_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1113_c7_e42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_af17_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1116_c7_bc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_18d6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_9034_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_f5b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1130_c11_5c60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_f703_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_31c5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1102_l1125_l1117_l1110_DUPLICATE_8dee_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1102_l1125_l1117_l1110_DUPLICATE_8dee_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1102_l1125_l1117_l1110_DUPLICATE_8dee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1134_c24_079a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1101_l1124_l1098_l1121_DUPLICATE_672a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1101_l1124_l1098_l1121_DUPLICATE_672a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1101_l1124_l1098_l1121_DUPLICATE_672a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1101_l1124_l1098_l1121_DUPLICATE_672a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1101_l1124_l1098_l1121_DUPLICATE_672a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1101_l1124_l1098_l1121_DUPLICATE_672a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1101_l1124_l1098_l1121_DUPLICATE_672a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1101_l1124_l1098_l1121_DUPLICATE_672a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1101_l1124_l1098_l1121_DUPLICATE_672a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1116_l1113_l1140_l1109_l1136_l1106_l1130_l1101_l1124_l1098_l1121_DUPLICATE_2c18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1116_l1113_l1140_l1109_l1136_l1106_l1130_l1101_l1124_l1098_l1121_DUPLICATE_2c18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1116_l1113_l1140_l1109_l1136_l1106_l1130_l1101_l1124_l1098_l1121_DUPLICATE_2c18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1116_l1113_l1140_l1109_l1136_l1106_l1130_l1101_l1124_l1098_l1121_DUPLICATE_2c18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1116_l1113_l1140_l1109_l1136_l1106_l1130_l1101_l1124_l1098_l1121_DUPLICATE_2c18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1116_l1113_l1140_l1109_l1136_l1106_l1130_l1101_l1124_l1098_l1121_DUPLICATE_2c18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1116_l1113_l1140_l1109_l1136_l1106_l1130_l1101_l1124_l1098_l1121_DUPLICATE_2c18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1116_l1113_l1140_l1109_l1136_l1106_l1130_l1101_l1124_l1098_l1121_DUPLICATE_2c18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1116_l1113_l1140_l1109_l1136_l1106_l1130_l1101_l1124_l1098_l1121_DUPLICATE_2c18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1116_l1113_l1140_l1109_l1136_l1106_l1130_l1101_l1124_l1098_l1121_DUPLICATE_2c18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1116_l1113_l1140_l1109_l1136_l1106_l1130_l1101_l1124_l1098_l1121_DUPLICATE_2c18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1130_l1101_l1098_l1121_DUPLICATE_be8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1130_l1101_l1098_l1121_DUPLICATE_be8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1130_l1101_l1098_l1121_DUPLICATE_be8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1130_l1101_l1098_l1121_DUPLICATE_be8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1130_l1101_l1098_l1121_DUPLICATE_be8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1130_l1101_l1098_l1121_DUPLICATE_be8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1130_l1101_l1098_l1121_DUPLICATE_be8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1130_l1101_l1098_l1121_DUPLICATE_be8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1106_l1130_l1101_l1098_l1121_DUPLICATE_be8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1140_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_0bfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1140_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_0bfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1140_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_0bfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1140_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_0bfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1140_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_0bfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1140_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_0bfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1140_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_0bfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1140_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_0bfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1140_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_0bfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1140_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_0bfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1140_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_0bfe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1124_DUPLICATE_19ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1124_DUPLICATE_19ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_059d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_059d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_059d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_059d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_059d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_059d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_059d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_059d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_059d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1093_l1116_l1113_l1109_l1136_l1106_l1101_l1124_l1098_l1121_DUPLICATE_059d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1136_c7_f585] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1110_c3_f392] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_left;
     BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_return_output := BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_eca7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1128_c32_5006] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_left;
     BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_return_output := BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1138_c24_e722] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1138_c24_e722_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1138_c34_d757_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1130_c7_6620] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1125_c3_7209] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_left;
     BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_return_output := BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1093_c1_c338] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_eca7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1128_c32_0fc7_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1128_c32_5006_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1110_c3_f392_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1125_c3_7209_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1138_c24_e722_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1118_l1103_DUPLICATE_eb7b_return_output;
     VAR_printf_uxn_opcodes_h_l1094_c3_c117_uxn_opcodes_h_l1094_c3_c117_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1093_c1_c338_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_eca7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1130_c7_6620_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_eca7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f585_return_output;
     -- MUX[uxn_opcodes_h_l1128_c32_0fc7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1128_c32_0fc7_cond <= VAR_MUX_uxn_opcodes_h_l1128_c32_0fc7_cond;
     MUX_uxn_opcodes_h_l1128_c32_0fc7_iftrue <= VAR_MUX_uxn_opcodes_h_l1128_c32_0fc7_iftrue;
     MUX_uxn_opcodes_h_l1128_c32_0fc7_iffalse <= VAR_MUX_uxn_opcodes_h_l1128_c32_0fc7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1128_c32_0fc7_return_output := MUX_uxn_opcodes_h_l1128_c32_0fc7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1109_c7_224e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1109_c7_224e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1109_c7_224e_cond;
     t16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue;
     t16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output := t16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1136_c7_f585] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_return_output;

     -- n16_MUX[uxn_opcodes_h_l1124_c7_e5b6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond;
     n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue;
     n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output := n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1130_c7_6620] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_return_output;

     -- printf_uxn_opcodes_h_l1094_c3_c117[uxn_opcodes_h_l1094_c3_c117] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1094_c3_c117_uxn_opcodes_h_l1094_c3_c117_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1094_c3_c117_uxn_opcodes_h_l1094_c3_c117_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1136_c7_f585] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1136_c7_f585] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_return_output := result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1124_c7_e5b6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1126_c11_9e51] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_left;
     BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_return_output := BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1126_c11_9e51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue := VAR_MUX_uxn_opcodes_h_l1128_c32_0fc7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f585_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f585_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1130_c7_6620_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1136_c7_f585_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1124_c7_e5b6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond;
     tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output := tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1106_c7_9b99] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond <= VAR_t16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond;
     t16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue;
     t16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output := t16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1124_c7_e5b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1121_c7_3c6b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond;
     n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue;
     n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output := n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_e5b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1130_c7_6620] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_return_output := result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1121_c7_3c6b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1130_c7_6620] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1130_c7_6620] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1130_c7_6620_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1130_c7_6620_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1130_c7_6620_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1116_c7_bc65] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_e5b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1121_c7_3c6b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1121_c7_3c6b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1121_c7_3c6b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond;
     tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output := tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1116_c7_bc65] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1116_c7_bc65_cond <= VAR_n16_MUX_uxn_opcodes_h_l1116_c7_bc65_cond;
     n16_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue;
     n16_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output := n16_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output;

     -- t16_MUX[uxn_opcodes_h_l1101_c7_15af] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1101_c7_15af_cond <= VAR_t16_MUX_uxn_opcodes_h_l1101_c7_15af_cond;
     t16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue;
     t16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output := t16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_e5b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1124_c7_e5b6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1124_c7_e5b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output;
     -- t16_MUX[uxn_opcodes_h_l1098_c7_1930] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1098_c7_1930_cond <= VAR_t16_MUX_uxn_opcodes_h_l1098_c7_1930_cond;
     t16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue;
     t16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output := t16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1116_c7_bc65] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1121_c7_3c6b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1121_c7_3c6b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1121_c7_3c6b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1113_c7_e42a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1113_c7_e42a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1113_c7_e42a_cond;
     n16_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue;
     n16_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output := n16_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1113_c7_e42a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1116_c7_bc65] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_cond;
     tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output := tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1116_c7_bc65] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1121_c7_3c6b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output;
     -- t16_MUX[uxn_opcodes_h_l1093_c2_f90a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond;
     t16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue;
     t16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output := t16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1116_c7_bc65] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1113_c7_e42a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1109_c7_224e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1113_c7_e42a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_cond;
     tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output := tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1116_c7_bc65] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1116_c7_bc65] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output := result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output;

     -- n16_MUX[uxn_opcodes_h_l1109_c7_224e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1109_c7_224e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1109_c7_224e_cond;
     n16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue;
     n16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output := n16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1113_c7_e42a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_bc65_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1113_c7_e42a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1113_c7_e42a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1113_c7_e42a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1109_c7_224e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1106_c7_9b99] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond <= VAR_n16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond;
     n16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue;
     n16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output := n16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1109_c7_224e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_cond;
     tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output := tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1106_c7_9b99] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1109_c7_224e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_e42a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1101_c7_15af] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1109_c7_224e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1101_c7_15af] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1101_c7_15af_cond <= VAR_n16_MUX_uxn_opcodes_h_l1101_c7_15af_cond;
     n16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue;
     n16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output := n16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1106_c7_9b99] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_cond;
     tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output := tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1109_c7_224e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1109_c7_224e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1106_c7_9b99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1106_c7_9b99] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c7_224e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1106_c7_9b99] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output := result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1106_c7_9b99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_15af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1106_c7_9b99] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1101_c7_15af] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1101_c7_15af] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_cond;
     tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output := tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;

     -- n16_MUX[uxn_opcodes_h_l1098_c7_1930] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1098_c7_1930_cond <= VAR_n16_MUX_uxn_opcodes_h_l1098_c7_1930_cond;
     n16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue;
     n16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output := n16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1098_c7_1930] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1106_c7_9b99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_15af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1101_c7_15af] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_return_output := result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_15af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;

     -- n16_MUX[uxn_opcodes_h_l1093_c2_f90a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond;
     n16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue;
     n16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output := n16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1098_c7_1930] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_cond;
     tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output := tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1098_c7_1930] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1093_c2_f90a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1098_c7_1930] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_15af_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1093_c2_f90a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1098_c7_1930] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_return_output := result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1098_c7_1930] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1093_c2_f90a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_cond;
     tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output := tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1098_c7_1930] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1093_c2_f90a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1098_c7_1930_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1093_c2_f90a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1093_c2_f90a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1093_c2_f90a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1145_l1089_DUPLICATE_573b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1145_l1089_DUPLICATE_573b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1093_c2_f90a_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1145_l1089_DUPLICATE_573b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1145_l1089_DUPLICATE_573b_return_output;
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
