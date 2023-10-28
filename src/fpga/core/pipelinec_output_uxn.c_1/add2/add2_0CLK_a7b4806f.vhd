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
entity add2_0CLK_a7b4806f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_a7b4806f;
architecture arch of add2_0CLK_a7b4806f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l895_c6_ab0c]
signal BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l895_c1_6ee7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l895_c2_9d99]
signal t16_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l895_c2_9d99]
signal tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l895_c2_9d99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l895_c2_9d99]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l895_c2_9d99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l895_c2_9d99]
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l895_c2_9d99]
signal result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l895_c2_9d99]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l895_c2_9d99]
signal n16_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l896_c3_23c1[uxn_opcodes_h_l896_c3_23c1]
signal printf_uxn_opcodes_h_l896_c3_23c1_uxn_opcodes_h_l896_c3_23c1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l900_c11_27e6]
signal BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l900_c7_38b0]
signal t16_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l900_c7_38b0]
signal tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l900_c7_38b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l900_c7_38b0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l900_c7_38b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l900_c7_38b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l900_c7_38b0]
signal result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l900_c7_38b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l900_c7_38b0]
signal n16_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l903_c11_a7cb]
signal BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l903_c7_dfcd]
signal t16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l903_c7_dfcd]
signal tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l903_c7_dfcd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l903_c7_dfcd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l903_c7_dfcd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l903_c7_dfcd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l903_c7_dfcd]
signal result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l903_c7_dfcd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l903_c7_dfcd]
signal n16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l908_c11_d651]
signal BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l908_c7_da3a]
signal t16_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l908_c7_da3a]
signal tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l908_c7_da3a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l908_c7_da3a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l908_c7_da3a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l908_c7_da3a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l908_c7_da3a]
signal result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l908_c7_da3a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l908_c7_da3a]
signal n16_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l911_c11_187b]
signal BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l911_c7_089b]
signal t16_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l911_c7_089b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l911_c7_089b]
signal tmp16_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l911_c7_089b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l911_c7_089b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l911_c7_089b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l911_c7_089b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l911_c7_089b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l911_c7_089b]
signal result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l911_c7_089b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l911_c7_089b]
signal n16_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l911_c7_089b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l912_c3_7609]
signal BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l915_c11_b166]
signal BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l915_c7_4adf]
signal tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l915_c7_4adf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l915_c7_4adf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l915_c7_4adf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l915_c7_4adf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l915_c7_4adf]
signal result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l915_c7_4adf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l915_c7_4adf]
signal n16_MUX_uxn_opcodes_h_l915_c7_4adf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l915_c7_4adf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l918_c11_eeed]
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l918_c7_8f2e]
signal tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l918_c7_8f2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l918_c7_8f2e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_8f2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_8f2e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l918_c7_8f2e]
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l918_c7_8f2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l918_c7_8f2e]
signal n16_MUX_uxn_opcodes_h_l918_c7_8f2e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l923_c11_8576]
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l923_c7_bb63]
signal tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_bb63]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l923_c7_bb63]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_bb63]
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_bb63]
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l923_c7_bb63]
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_bb63]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l923_c7_bb63]
signal n16_MUX_uxn_opcodes_h_l923_c7_bb63_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l923_c7_bb63_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l926_c11_309b]
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l926_c7_ac07]
signal tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_ac07]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_ac07]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_ac07]
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_ac07]
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l926_c7_ac07]
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_ac07]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l926_c7_ac07]
signal n16_MUX_uxn_opcodes_h_l926_c7_ac07_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_ac07_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l927_c3_7858]
signal BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l928_c11_fe3d]
signal BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l930_c30_064a]
signal sp_relative_shift_uxn_opcodes_h_l930_c30_064a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l930_c30_064a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l930_c30_064a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l930_c30_064a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l935_c11_ff6f]
signal BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l935_c7_bd9d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l935_c7_bd9d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l935_c7_bd9d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l935_c7_bd9d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l935_c7_bd9d]
signal result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l938_c31_eecd]
signal CONST_SR_8_uxn_opcodes_h_l938_c31_eecd_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l938_c31_eecd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l940_c11_83a2]
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l940_c7_15b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l940_c7_15b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c
BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_left,
BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_right,
BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_return_output);

-- t16_MUX_uxn_opcodes_h_l895_c2_9d99
t16_MUX_uxn_opcodes_h_l895_c2_9d99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l895_c2_9d99_cond,
t16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue,
t16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse,
t16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output);

-- tmp16_MUX_uxn_opcodes_h_l895_c2_9d99
tmp16_MUX_uxn_opcodes_h_l895_c2_9d99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_cond,
tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue,
tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse,
tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99
result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99
result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99
result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_cond,
result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_return_output);

-- n16_MUX_uxn_opcodes_h_l895_c2_9d99
n16_MUX_uxn_opcodes_h_l895_c2_9d99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l895_c2_9d99_cond,
n16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue,
n16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse,
n16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output);

-- printf_uxn_opcodes_h_l896_c3_23c1_uxn_opcodes_h_l896_c3_23c1
printf_uxn_opcodes_h_l896_c3_23c1_uxn_opcodes_h_l896_c3_23c1 : entity work.printf_uxn_opcodes_h_l896_c3_23c1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l896_c3_23c1_uxn_opcodes_h_l896_c3_23c1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6
BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_left,
BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_right,
BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_return_output);

-- t16_MUX_uxn_opcodes_h_l900_c7_38b0
t16_MUX_uxn_opcodes_h_l900_c7_38b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l900_c7_38b0_cond,
t16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue,
t16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse,
t16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l900_c7_38b0
tmp16_MUX_uxn_opcodes_h_l900_c7_38b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_cond,
tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue,
tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse,
tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0
result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0
result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0
result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0
result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_cond,
result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_return_output);

-- n16_MUX_uxn_opcodes_h_l900_c7_38b0
n16_MUX_uxn_opcodes_h_l900_c7_38b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l900_c7_38b0_cond,
n16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue,
n16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse,
n16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb
BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_left,
BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_right,
BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_return_output);

-- t16_MUX_uxn_opcodes_h_l903_c7_dfcd
t16_MUX_uxn_opcodes_h_l903_c7_dfcd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond,
t16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue,
t16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse,
t16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd
tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond,
tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue,
tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse,
tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd
result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_cond,
result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output);

-- n16_MUX_uxn_opcodes_h_l903_c7_dfcd
n16_MUX_uxn_opcodes_h_l903_c7_dfcd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond,
n16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue,
n16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse,
n16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651
BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_left,
BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_right,
BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_return_output);

-- t16_MUX_uxn_opcodes_h_l908_c7_da3a
t16_MUX_uxn_opcodes_h_l908_c7_da3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l908_c7_da3a_cond,
t16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue,
t16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse,
t16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l908_c7_da3a
tmp16_MUX_uxn_opcodes_h_l908_c7_da3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_cond,
tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue,
tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse,
tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a
result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a
result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a
result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_cond,
result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_return_output);

-- n16_MUX_uxn_opcodes_h_l908_c7_da3a
n16_MUX_uxn_opcodes_h_l908_c7_da3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l908_c7_da3a_cond,
n16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue,
n16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse,
n16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b
BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_left,
BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_right,
BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_return_output);

-- t16_MUX_uxn_opcodes_h_l911_c7_089b
t16_MUX_uxn_opcodes_h_l911_c7_089b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l911_c7_089b_cond,
t16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue,
t16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse,
t16_MUX_uxn_opcodes_h_l911_c7_089b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l911_c7_089b
tmp16_MUX_uxn_opcodes_h_l911_c7_089b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l911_c7_089b_cond,
tmp16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue,
tmp16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse,
tmp16_MUX_uxn_opcodes_h_l911_c7_089b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b
result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_cond,
result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_return_output);

-- n16_MUX_uxn_opcodes_h_l911_c7_089b
n16_MUX_uxn_opcodes_h_l911_c7_089b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l911_c7_089b_cond,
n16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue,
n16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse,
n16_MUX_uxn_opcodes_h_l911_c7_089b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l912_c3_7609
BIN_OP_OR_uxn_opcodes_h_l912_c3_7609 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_left,
BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_right,
BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166
BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_left,
BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_right,
BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_return_output);

-- tmp16_MUX_uxn_opcodes_h_l915_c7_4adf
tmp16_MUX_uxn_opcodes_h_l915_c7_4adf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_cond,
tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue,
tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse,
tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf
result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf
result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf
result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf
result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_cond,
result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf
result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_return_output);

-- n16_MUX_uxn_opcodes_h_l915_c7_4adf
n16_MUX_uxn_opcodes_h_l915_c7_4adf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l915_c7_4adf_cond,
n16_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue,
n16_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse,
n16_MUX_uxn_opcodes_h_l915_c7_4adf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed
BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_left,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_right,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_return_output);

-- tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e
tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_cond,
tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue,
tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse,
tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e
result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_cond,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output);

-- n16_MUX_uxn_opcodes_h_l918_c7_8f2e
n16_MUX_uxn_opcodes_h_l918_c7_8f2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l918_c7_8f2e_cond,
n16_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue,
n16_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse,
n16_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576
BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_left,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_right,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_return_output);

-- tmp16_MUX_uxn_opcodes_h_l923_c7_bb63
tmp16_MUX_uxn_opcodes_h_l923_c7_bb63 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_cond,
tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue,
tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse,
tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63
result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63
result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_cond,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_return_output);

-- n16_MUX_uxn_opcodes_h_l923_c7_bb63
n16_MUX_uxn_opcodes_h_l923_c7_bb63 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l923_c7_bb63_cond,
n16_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue,
n16_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse,
n16_MUX_uxn_opcodes_h_l923_c7_bb63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b
BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_left,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_right,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l926_c7_ac07
tmp16_MUX_uxn_opcodes_h_l926_c7_ac07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_cond,
tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue,
tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse,
tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07
result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_cond,
result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_return_output);

-- n16_MUX_uxn_opcodes_h_l926_c7_ac07
n16_MUX_uxn_opcodes_h_l926_c7_ac07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l926_c7_ac07_cond,
n16_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue,
n16_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse,
n16_MUX_uxn_opcodes_h_l926_c7_ac07_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l927_c3_7858
BIN_OP_OR_uxn_opcodes_h_l927_c3_7858 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_left,
BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_right,
BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d
BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_left,
BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_right,
BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l930_c30_064a
sp_relative_shift_uxn_opcodes_h_l930_c30_064a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l930_c30_064a_ins,
sp_relative_shift_uxn_opcodes_h_l930_c30_064a_x,
sp_relative_shift_uxn_opcodes_h_l930_c30_064a_y,
sp_relative_shift_uxn_opcodes_h_l930_c30_064a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f
BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_left,
BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_right,
BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d
result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d
result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_cond,
result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l938_c31_eecd
CONST_SR_8_uxn_opcodes_h_l938_c31_eecd : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l938_c31_eecd_x,
CONST_SR_8_uxn_opcodes_h_l938_c31_eecd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2
BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_left,
BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_right,
BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009
CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_return_output,
 t16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output,
 tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_return_output,
 n16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_return_output,
 t16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output,
 tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_return_output,
 n16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_return_output,
 t16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output,
 tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output,
 n16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_return_output,
 t16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output,
 tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_return_output,
 n16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_return_output,
 t16_MUX_uxn_opcodes_h_l911_c7_089b_return_output,
 tmp16_MUX_uxn_opcodes_h_l911_c7_089b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_return_output,
 n16_MUX_uxn_opcodes_h_l911_c7_089b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_return_output,
 tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_return_output,
 n16_MUX_uxn_opcodes_h_l915_c7_4adf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_return_output,
 tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output,
 n16_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_return_output,
 tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_return_output,
 n16_MUX_uxn_opcodes_h_l923_c7_bb63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_return_output,
 tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_return_output,
 n16_MUX_uxn_opcodes_h_l926_c7_ac07_return_output,
 BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_return_output,
 sp_relative_shift_uxn_opcodes_h_l930_c30_064a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output,
 CONST_SR_8_uxn_opcodes_h_l938_c31_eecd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l897_c3_3f9f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c2_9d99_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l896_c3_23c1_uxn_opcodes_h_l896_c3_23c1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l901_c3_d31f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l900_c7_38b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l906_c3_6953 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l911_c7_089b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_089b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_d415 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l911_c7_089b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l908_c7_da3a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l913_c3_ab82 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l915_c7_4adf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l911_c7_089b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l916_c3_4b66 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l915_c7_4adf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l921_c3_a588 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l923_c7_bb63_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l918_c7_8f2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_3929 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_ac07_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l923_c7_bb63_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l928_c3_80f1 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l932_c3_fc6c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_ac07_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l930_c30_064a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l930_c30_064a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l930_c30_064a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l930_c30_064a_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l933_c21_eed3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l937_c3_463c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l935_c7_bd9d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l938_c31_eecd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l938_c31_eecd_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l938_c21_ff50_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_6579_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_b0df_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_52e1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l915_l911_l908_l903_l926_l900_l923_l895_l918_DUPLICATE_baa0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l926_l900_l923_l918_DUPLICATE_6942_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l904_l927_l919_l912_DUPLICATE_7b80_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l891_l945_DUPLICATE_40a9_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l930_c30_064a_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l937_c3_463c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l937_c3_463c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l906_c3_6953 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l906_c3_6953;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l897_c3_3f9f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l897_c3_3f9f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_3929 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_3929;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l932_c3_fc6c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l932_c3_fc6c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l913_c3_ab82 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l913_c3_ab82;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_right := to_unsigned(10, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l921_c3_a588 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l921_c3_a588;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l901_c3_d31f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l901_c3_d31f;
     VAR_sp_relative_shift_uxn_opcodes_h_l930_c30_064a_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_d415 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_d415;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l916_c3_4b66 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l916_c3_4b66;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l930_c30_064a_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l938_c31_eecd_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_6579 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_6579_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l908_c11_d651] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_left;
     BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_return_output := BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l930_c30_064a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l930_c30_064a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l930_c30_064a_ins;
     sp_relative_shift_uxn_opcodes_h_l930_c30_064a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l930_c30_064a_x;
     sp_relative_shift_uxn_opcodes_h_l930_c30_064a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l930_c30_064a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l930_c30_064a_return_output := sp_relative_shift_uxn_opcodes_h_l930_c30_064a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l915_c11_b166] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_left;
     BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_return_output := BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l935_c11_ff6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_b0df LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_b0df_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l926_c11_309b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_left;
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_return_output := BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l903_c11_a7cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l940_c11_83a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l918_c11_eeed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_left;
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_return_output := BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l935_c7_bd9d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l935_c7_bd9d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l923_c11_8576] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_left;
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_return_output := BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l900_c11_27e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_52e1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_52e1_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l926_l900_l923_l918_DUPLICATE_6942 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l926_l900_l923_l918_DUPLICATE_6942_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l904_l927_l919_l912_DUPLICATE_7b80 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l904_l927_l919_l912_DUPLICATE_7b80_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l915_l911_l908_l903_l926_l900_l923_l895_l918_DUPLICATE_baa0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l915_l911_l908_l903_l926_l900_l923_l895_l918_DUPLICATE_baa0_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l911_c11_187b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_left;
     BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_return_output := BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l938_c31_eecd] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l938_c31_eecd_x <= VAR_CONST_SR_8_uxn_opcodes_h_l938_c31_eecd_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l938_c31_eecd_return_output := CONST_SR_8_uxn_opcodes_h_l938_c31_eecd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l895_c6_ab0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l895_c2_9d99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l895_c2_9d99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c6_ab0c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l900_c7_38b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l900_c7_38b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l900_c11_27e6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_a7cb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l908_c7_da3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l908_c7_da3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l908_c11_d651_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l911_c7_089b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l911_c7_089b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_089b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_187b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l915_c7_4adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l915_c11_b166_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l918_c7_8f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_eeed_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l923_c7_bb63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_8576_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_ac07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_309b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ff6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_83a2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l904_l927_l919_l912_DUPLICATE_7b80_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l904_l927_l919_l912_DUPLICATE_7b80_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l904_l927_l919_l912_DUPLICATE_7b80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l915_l911_l908_l903_l926_l900_l923_l895_l918_DUPLICATE_baa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l915_l911_l908_l903_l926_l900_l923_l895_l918_DUPLICATE_baa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l915_l911_l908_l903_l926_l900_l923_l895_l918_DUPLICATE_baa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l915_l911_l908_l903_l926_l900_l923_l895_l918_DUPLICATE_baa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l915_l911_l908_l903_l926_l900_l923_l895_l918_DUPLICATE_baa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l915_l911_l908_l903_l926_l900_l923_l895_l918_DUPLICATE_baa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l915_l911_l908_l903_l926_l900_l923_l895_l918_DUPLICATE_baa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l915_l911_l908_l903_l926_l900_l923_l895_l918_DUPLICATE_baa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l915_l911_l908_l903_l926_l900_l923_l895_l918_DUPLICATE_baa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l926_l900_l923_l918_DUPLICATE_6942_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l926_l900_l923_l918_DUPLICATE_6942_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l926_l900_l923_l918_DUPLICATE_6942_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l926_l900_l923_l918_DUPLICATE_6942_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l926_l900_l923_l918_DUPLICATE_6942_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l926_l900_l923_l918_DUPLICATE_6942_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l926_l900_l923_l918_DUPLICATE_6942_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l926_l900_l923_l918_DUPLICATE_6942_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l926_l900_l923_l918_DUPLICATE_6942_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l926_l900_l923_l918_DUPLICATE_6942_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_6579_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_6579_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_6579_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_6579_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_6579_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_6579_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_6579_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_6579_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_6579_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_b0df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_b0df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_b0df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_b0df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_b0df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_b0df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_b0df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_b0df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_b0df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l915_l911_l940_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_b0df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_52e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_52e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_52e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_52e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_52e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_52e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_52e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_52e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l915_l911_l908_l935_l903_l900_l923_l895_l918_DUPLICATE_52e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l935_c7_bd9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l930_c30_064a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l935_c7_bd9d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l927_c3_7858] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_left;
     BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_return_output := BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l940_c7_15b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l938_c21_ff50] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l938_c21_ff50_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l938_c31_eecd_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l912_c3_7609] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_left;
     BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_return_output := BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l940_c7_15b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l935_c7_bd9d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_ac07] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l895_c1_6ee7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l912_c3_7609_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_right := VAR_BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l927_c3_7858_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l938_c21_ff50_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l905_l920_DUPLICATE_9009_return_output;
     VAR_printf_uxn_opcodes_h_l896_c3_23c1_uxn_opcodes_h_l896_c3_23c1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l895_c1_6ee7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_15b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_15b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_ac07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l935_c7_bd9d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_bb63] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l935_c7_bd9d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output := result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_ac07] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_return_output;

     -- printf_uxn_opcodes_h_l896_c3_23c1[uxn_opcodes_h_l896_c3_23c1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l896_c3_23c1_uxn_opcodes_h_l896_c3_23c1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l896_c3_23c1_uxn_opcodes_h_l896_c3_23c1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_PLUS[uxn_opcodes_h_l928_c11_fe3d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_return_output;

     -- t16_MUX[uxn_opcodes_h_l911_c7_089b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l911_c7_089b_cond <= VAR_t16_MUX_uxn_opcodes_h_l911_c7_089b_cond;
     t16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue;
     t16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l911_c7_089b_return_output := t16_MUX_uxn_opcodes_h_l911_c7_089b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l935_c7_bd9d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_ac07] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_return_output;

     -- n16_MUX[uxn_opcodes_h_l926_c7_ac07] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l926_c7_ac07_cond <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_ac07_cond;
     n16_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue;
     n16_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_ac07_return_output := n16_MUX_uxn_opcodes_h_l926_c7_ac07_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l928_c3_80f1 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l928_c11_fe3d_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse := VAR_n16_MUX_uxn_opcodes_h_l926_c7_ac07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_ac07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_bb63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_ac07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_bd9d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l911_c7_089b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue := VAR_tmp16_uxn_opcodes_h_l928_c3_80f1;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_ac07] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l926_c7_ac07] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_cond;
     tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue;
     tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_return_output := tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_return_output;

     -- t16_MUX[uxn_opcodes_h_l908_c7_da3a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l908_c7_da3a_cond <= VAR_t16_MUX_uxn_opcodes_h_l908_c7_da3a_cond;
     t16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue;
     t16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output := t16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l933_c21_eed3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l933_c21_eed3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l928_c3_80f1);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_ac07] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l923_c7_bb63] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_return_output;

     -- n16_MUX[uxn_opcodes_h_l923_c7_bb63] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l923_c7_bb63_cond <= VAR_n16_MUX_uxn_opcodes_h_l923_c7_bb63_cond;
     n16_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue;
     n16_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l923_c7_bb63_return_output := n16_MUX_uxn_opcodes_h_l923_c7_bb63_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l918_c7_8f2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_bb63] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l933_c21_eed3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l923_c7_bb63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_ac07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l923_c7_bb63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_ac07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_bb63_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_ac07_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l915_c7_4adf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l926_c7_ac07] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_cond;
     result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_return_output := result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l918_c7_8f2e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_bb63] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_return_output;

     -- n16_MUX[uxn_opcodes_h_l918_c7_8f2e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l918_c7_8f2e_cond <= VAR_n16_MUX_uxn_opcodes_h_l918_c7_8f2e_cond;
     n16_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue;
     n16_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output := n16_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l923_c7_bb63] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_cond;
     tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue;
     tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_return_output := tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_return_output;

     -- t16_MUX[uxn_opcodes_h_l903_c7_dfcd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond <= VAR_t16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond;
     t16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue;
     t16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output := t16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_bb63] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l918_c7_8f2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_bb63_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_bb63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l915_c7_4adf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_ac07_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l923_c7_bb63_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l915_c7_4adf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_8f2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l911_c7_089b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_8f2e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output;

     -- t16_MUX[uxn_opcodes_h_l900_c7_38b0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l900_c7_38b0_cond <= VAR_t16_MUX_uxn_opcodes_h_l900_c7_38b0_cond;
     t16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue;
     t16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output := t16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l915_c7_4adf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_return_output;

     -- n16_MUX[uxn_opcodes_h_l915_c7_4adf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l915_c7_4adf_cond <= VAR_n16_MUX_uxn_opcodes_h_l915_c7_4adf_cond;
     n16_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue;
     n16_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l915_c7_4adf_return_output := n16_MUX_uxn_opcodes_h_l915_c7_4adf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l918_c7_8f2e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_cond;
     tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output := tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l923_c7_bb63] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_cond;
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_return_output := result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l915_c7_4adf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l915_c7_4adf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_089b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l915_c7_4adf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_bb63_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse := VAR_t16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l915_c7_4adf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_cond;
     tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_return_output := tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l911_c7_089b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_return_output;

     -- t16_MUX[uxn_opcodes_h_l895_c2_9d99] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l895_c2_9d99_cond <= VAR_t16_MUX_uxn_opcodes_h_l895_c2_9d99_cond;
     t16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue;
     t16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output := t16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output;

     -- n16_MUX[uxn_opcodes_h_l911_c7_089b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l911_c7_089b_cond <= VAR_n16_MUX_uxn_opcodes_h_l911_c7_089b_cond;
     n16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue;
     n16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l911_c7_089b_return_output := n16_MUX_uxn_opcodes_h_l911_c7_089b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l911_c7_089b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l915_c7_4adf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l915_c7_4adf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l908_c7_da3a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l918_c7_8f2e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output := result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l911_c7_089b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l915_c7_4adf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_089b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l915_c7_4adf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_089b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_8f2e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l915_c7_4adf_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l915_c7_4adf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_return_output := result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l908_c7_da3a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;

     -- n16_MUX[uxn_opcodes_h_l908_c7_da3a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l908_c7_da3a_cond <= VAR_n16_MUX_uxn_opcodes_h_l908_c7_da3a_cond;
     n16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue;
     n16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output := n16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l908_c7_da3a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l911_c7_089b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l911_c7_089b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l911_c7_089b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_089b_cond;
     tmp16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_089b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_089b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_089b_return_output := tmp16_MUX_uxn_opcodes_h_l911_c7_089b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l911_c7_089b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l903_c7_dfcd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_089b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_089b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l915_c7_4adf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l911_c7_089b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l908_c7_da3a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l900_c7_38b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l908_c7_da3a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l911_c7_089b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_return_output := result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l908_c7_da3a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_cond;
     tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output := tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l903_c7_dfcd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;

     -- n16_MUX[uxn_opcodes_h_l903_c7_dfcd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond <= VAR_n16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond;
     n16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue;
     n16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output := n16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l903_c7_dfcd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l911_c7_089b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l900_c7_38b0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l900_c7_38b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l895_c2_9d99] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l903_c7_dfcd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;

     -- n16_MUX[uxn_opcodes_h_l900_c7_38b0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l900_c7_38b0_cond <= VAR_n16_MUX_uxn_opcodes_h_l900_c7_38b0_cond;
     n16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue;
     n16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output := n16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l903_c7_dfcd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l908_c7_da3a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_return_output := result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l903_c7_dfcd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_cond;
     tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output := tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse := VAR_n16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l908_c7_da3a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l900_c7_38b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;

     -- n16_MUX[uxn_opcodes_h_l895_c2_9d99] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l895_c2_9d99_cond <= VAR_n16_MUX_uxn_opcodes_h_l895_c2_9d99_cond;
     n16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue;
     n16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output := n16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l900_c7_38b0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_cond;
     tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output := tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l895_c2_9d99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l895_c2_9d99] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l903_c7_dfcd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output := result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l900_c7_38b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l903_c7_dfcd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l900_c7_38b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_return_output := result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l895_c2_9d99] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l895_c2_9d99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l895_c2_9d99] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_cond;
     tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue;
     tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output := tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l900_c7_38b0_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l895_c2_9d99_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l895_c2_9d99] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_cond;
     result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_return_output := result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l891_l945_DUPLICATE_40a9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l891_l945_DUPLICATE_40a9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c2_9d99_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c2_9d99_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c2_9d99_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c2_9d99_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c2_9d99_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c2_9d99_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l891_l945_DUPLICATE_40a9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l891_l945_DUPLICATE_40a9_return_output;
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
