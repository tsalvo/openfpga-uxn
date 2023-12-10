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
-- Submodules: 73
entity div2_0CLK_dbfc9f73 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_dbfc9f73;
architecture arch of div2_0CLK_dbfc9f73 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2057_c6_f617]
signal BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2057_c2_a38d]
signal n16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2057_c2_a38d]
signal t16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2057_c2_a38d]
signal tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2057_c2_a38d]
signal result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2057_c2_a38d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2057_c2_a38d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2057_c2_a38d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2057_c2_a38d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2064_c11_670e]
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2064_c7_c6f4]
signal n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2064_c7_c6f4]
signal t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2064_c7_c6f4]
signal tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2064_c7_c6f4]
signal result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2064_c7_c6f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2064_c7_c6f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2064_c7_c6f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2064_c7_c6f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2067_c11_1e66]
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2067_c7_d85a]
signal n16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2067_c7_d85a]
signal t16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2067_c7_d85a]
signal tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2067_c7_d85a]
signal result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2067_c7_d85a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2067_c7_d85a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2067_c7_d85a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2067_c7_d85a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2072_c11_d2dd]
signal BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2072_c7_fbae]
signal n16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2072_c7_fbae]
signal t16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2072_c7_fbae]
signal tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2072_c7_fbae]
signal result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2072_c7_fbae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2072_c7_fbae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2072_c7_fbae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2072_c7_fbae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2073_c3_5c90]
signal BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2076_c11_5847]
signal BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2076_c7_fa8f]
signal n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2076_c7_fa8f]
signal tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2076_c7_fa8f]
signal result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2076_c7_fa8f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2076_c7_fa8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2076_c7_fa8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2076_c7_fa8f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2080_c11_b7f1]
signal BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2080_c7_f9d0]
signal n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2080_c7_f9d0]
signal tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2080_c7_f9d0]
signal result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2080_c7_f9d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2080_c7_f9d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2080_c7_f9d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2080_c7_f9d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2081_c3_264a]
signal BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2082_c11_d651]
signal BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2082_c26_56be]
signal BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2082_c11_2865]
signal MUX_uxn_opcodes_h_l2082_c11_2865_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2082_c11_2865_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2082_c11_2865_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2082_c11_2865_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2084_c30_7960]
signal sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2089_c11_a577]
signal BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2089_c7_47bf]
signal result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2089_c7_47bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2089_c7_47bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2089_c7_47bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2089_c7_47bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2092_c31_d1a5]
signal CONST_SR_8_uxn_opcodes_h_l2092_c31_d1a5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2092_c31_d1a5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2094_c11_cfcf]
signal BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2094_c7_19c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2094_c7_19c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_eae7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617
BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_left,
BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_right,
BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_return_output);

-- n16_MUX_uxn_opcodes_h_l2057_c2_a38d
n16_MUX_uxn_opcodes_h_l2057_c2_a38d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond,
n16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue,
n16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse,
n16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output);

-- t16_MUX_uxn_opcodes_h_l2057_c2_a38d
t16_MUX_uxn_opcodes_h_l2057_c2_a38d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond,
t16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue,
t16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse,
t16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d
tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond,
tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d
result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d
result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d
result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_left,
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_right,
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_return_output);

-- n16_MUX_uxn_opcodes_h_l2064_c7_c6f4
n16_MUX_uxn_opcodes_h_l2064_c7_c6f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond,
n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue,
n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse,
n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output);

-- t16_MUX_uxn_opcodes_h_l2064_c7_c6f4
t16_MUX_uxn_opcodes_h_l2064_c7_c6f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond,
t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue,
t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse,
t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4
tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond,
tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4
result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4
result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_left,
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_right,
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_return_output);

-- n16_MUX_uxn_opcodes_h_l2067_c7_d85a
n16_MUX_uxn_opcodes_h_l2067_c7_d85a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond,
n16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue,
n16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse,
n16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output);

-- t16_MUX_uxn_opcodes_h_l2067_c7_d85a
t16_MUX_uxn_opcodes_h_l2067_c7_d85a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond,
t16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue,
t16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse,
t16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a
tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond,
tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a
result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a
result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a
result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd
BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_left,
BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_right,
BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_return_output);

-- n16_MUX_uxn_opcodes_h_l2072_c7_fbae
n16_MUX_uxn_opcodes_h_l2072_c7_fbae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond,
n16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue,
n16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse,
n16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output);

-- t16_MUX_uxn_opcodes_h_l2072_c7_fbae
t16_MUX_uxn_opcodes_h_l2072_c7_fbae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond,
t16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue,
t16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse,
t16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae
tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond,
tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue,
tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse,
tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae
result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_cond,
result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae
result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae
result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae
result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90
BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_left,
BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_right,
BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_left,
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_right,
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_return_output);

-- n16_MUX_uxn_opcodes_h_l2076_c7_fa8f
n16_MUX_uxn_opcodes_h_l2076_c7_fa8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond,
n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue,
n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse,
n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f
tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond,
tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f
result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f
result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f
result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1
BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_left,
BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_right,
BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_return_output);

-- n16_MUX_uxn_opcodes_h_l2080_c7_f9d0
n16_MUX_uxn_opcodes_h_l2080_c7_f9d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond,
n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue,
n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse,
n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0
tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond,
tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0
result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0
result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0
result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a
BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_left,
BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_right,
BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651
BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_left,
BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_right,
BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be
BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_left,
BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_right,
BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_return_output);

-- MUX_uxn_opcodes_h_l2082_c11_2865
MUX_uxn_opcodes_h_l2082_c11_2865 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2082_c11_2865_cond,
MUX_uxn_opcodes_h_l2082_c11_2865_iftrue,
MUX_uxn_opcodes_h_l2082_c11_2865_iffalse,
MUX_uxn_opcodes_h_l2082_c11_2865_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2084_c30_7960
sp_relative_shift_uxn_opcodes_h_l2084_c30_7960 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_ins,
sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_x,
sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_y,
sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577
BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_left,
BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_right,
BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf
result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf
result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf
result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2092_c31_d1a5
CONST_SR_8_uxn_opcodes_h_l2092_c31_d1a5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2092_c31_d1a5_x,
CONST_SR_8_uxn_opcodes_h_l2092_c31_d1a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf
BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_left,
BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_right,
BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2
result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2
result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735
CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_return_output,
 n16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output,
 t16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_return_output,
 n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output,
 t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_return_output,
 n16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output,
 t16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_return_output,
 n16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output,
 t16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output,
 tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_return_output,
 n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_return_output,
 n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_return_output,
 MUX_uxn_opcodes_h_l2082_c11_2865_return_output,
 sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output,
 CONST_SR_8_uxn_opcodes_h_l2092_c31_d1a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_0813 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2065_c3_264a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2070_c3_664d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2074_c3_f2ea : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2086_c3_a557 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2082_c11_2865_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2082_c11_2865_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2082_c11_2865_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2082_c11_2865_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2087_c21_6572_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2091_c3_2223 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2090_c3_f4b5 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2092_c31_d1a5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2092_c31_d1a5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2092_c21_0e2b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_b33d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2057_l2076_l2094_l2067_l2089_l2064_l2072_DUPLICATE_aab6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_a098_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2076_l2094_l2080_l2067_l2089_l2064_l2072_DUPLICATE_abed_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2068_l2077_l2073_l2081_DUPLICATE_5b0b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2089_l2076_DUPLICATE_ac86_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2099_l2053_DUPLICATE_9aba_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2074_c3_f2ea := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2074_c3_f2ea;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2065_c3_264a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2065_c3_264a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_0813 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_0813;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2090_c3_f4b5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2090_c3_f4b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2070_c3_664d := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2070_c3_664d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2091_c3_2223 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2091_c3_2223;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2086_c3_a557 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2086_c3_a557;
     VAR_sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_MUX_uxn_opcodes_h_l2082_c11_2865_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2092_c31_d1a5_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2080_c11_b7f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2064_c11_670e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2094_c11_cfcf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_a098 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_a098_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2057_c6_f617] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_left;
     BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_return_output := BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2068_l2077_l2073_l2081_DUPLICATE_5b0b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2068_l2077_l2073_l2081_DUPLICATE_5b0b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2067_c11_1e66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_left;
     BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_return_output := BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_b33d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_b33d_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2057_l2076_l2094_l2067_l2089_l2064_l2072_DUPLICATE_aab6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2057_l2076_l2094_l2067_l2089_l2064_l2072_DUPLICATE_aab6_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l2092_c31_d1a5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2092_c31_d1a5_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2092_c31_d1a5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2092_c31_d1a5_return_output := CONST_SR_8_uxn_opcodes_h_l2092_c31_d1a5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2076_l2094_l2080_l2067_l2089_l2064_l2072_DUPLICATE_abed LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2076_l2094_l2080_l2067_l2089_l2064_l2072_DUPLICATE_abed_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l2084_c30_7960] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_ins;
     sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_x;
     sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_return_output := sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2072_c11_d2dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2089_l2076_DUPLICATE_ac86 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2089_l2076_DUPLICATE_ac86_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2089_c11_a577] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_left;
     BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_return_output := BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2076_c11_5847] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_left;
     BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_return_output := BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2082_c11_d651] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_left;
     BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_return_output := BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c6_f617_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_670e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_1e66_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2072_c11_d2dd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_5847_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b7f1_return_output;
     VAR_MUX_uxn_opcodes_h_l2082_c11_2865_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_d651_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_a577_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_cfcf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2068_l2077_l2073_l2081_DUPLICATE_5b0b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2068_l2077_l2073_l2081_DUPLICATE_5b0b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2068_l2077_l2073_l2081_DUPLICATE_5b0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_a098_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_a098_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_a098_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_a098_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_a098_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_a098_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2076_l2094_l2080_l2067_l2089_l2064_l2072_DUPLICATE_abed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2076_l2094_l2080_l2067_l2089_l2064_l2072_DUPLICATE_abed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2076_l2094_l2080_l2067_l2089_l2064_l2072_DUPLICATE_abed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2076_l2094_l2080_l2067_l2089_l2064_l2072_DUPLICATE_abed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2076_l2094_l2080_l2067_l2089_l2064_l2072_DUPLICATE_abed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2076_l2094_l2080_l2067_l2089_l2064_l2072_DUPLICATE_abed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2076_l2094_l2080_l2067_l2089_l2064_l2072_DUPLICATE_abed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2057_l2076_l2094_l2067_l2089_l2064_l2072_DUPLICATE_aab6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2057_l2076_l2094_l2067_l2089_l2064_l2072_DUPLICATE_aab6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2057_l2076_l2094_l2067_l2089_l2064_l2072_DUPLICATE_aab6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2057_l2076_l2094_l2067_l2089_l2064_l2072_DUPLICATE_aab6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2057_l2076_l2094_l2067_l2089_l2064_l2072_DUPLICATE_aab6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2057_l2076_l2094_l2067_l2089_l2064_l2072_DUPLICATE_aab6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2057_l2076_l2094_l2067_l2089_l2064_l2072_DUPLICATE_aab6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2089_l2076_DUPLICATE_ac86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2089_l2076_DUPLICATE_ac86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_b33d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_b33d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_b33d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_b33d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_b33d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2057_l2076_l2067_l2089_l2064_l2072_DUPLICATE_b33d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2084_c30_7960_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2081_c3_264a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_left;
     BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_return_output := BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2089_c7_47bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2073_c3_5c90] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_left;
     BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_return_output := BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2094_c7_19c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2089_c7_47bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2092_c21_0e2b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2092_c21_0e2b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2092_c31_d1a5_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2094_c7_19c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2073_c3_5c90_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2081_c3_264a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2092_c21_0e2b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2069_l2078_DUPLICATE_0735_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_19c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_19c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2080_c7_f9d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2089_c7_47bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2082_c26_56be] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_left;
     BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_return_output := BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2089_c7_47bf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output;

     -- t16_MUX[uxn_opcodes_h_l2072_c7_fbae] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond <= VAR_t16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond;
     t16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue;
     t16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output := t16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2089_c7_47bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2080_c7_f9d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2080_c7_f9d0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond;
     n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue;
     n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output := n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2082_c11_2865_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2082_c26_56be_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2089_c7_47bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2080_c7_f9d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2076_c7_fa8f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2076_c7_fa8f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond;
     n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue;
     n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output := n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2067_c7_d85a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond;
     t16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue;
     t16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output := t16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2076_c7_fa8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2080_c7_f9d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output;

     -- MUX[uxn_opcodes_h_l2082_c11_2865] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2082_c11_2865_cond <= VAR_MUX_uxn_opcodes_h_l2082_c11_2865_cond;
     MUX_uxn_opcodes_h_l2082_c11_2865_iftrue <= VAR_MUX_uxn_opcodes_h_l2082_c11_2865_iftrue;
     MUX_uxn_opcodes_h_l2082_c11_2865_iffalse <= VAR_MUX_uxn_opcodes_h_l2082_c11_2865_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2082_c11_2865_return_output := MUX_uxn_opcodes_h_l2082_c11_2865_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue := VAR_MUX_uxn_opcodes_h_l2082_c11_2865_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2072_c7_fbae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output;

     -- n16_MUX[uxn_opcodes_h_l2072_c7_fbae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond <= VAR_n16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond;
     n16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue;
     n16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output := n16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2080_c7_f9d0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond;
     tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output := tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2087_c21_6572] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2087_c21_6572_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2082_c11_2865_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2072_c7_fbae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2076_c7_fa8f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2076_c7_fa8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2064_c7_c6f4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond;
     t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue;
     t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output := t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2087_c21_6572_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2067_c7_d85a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2067_c7_d85a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond;
     n16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue;
     n16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output := n16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2072_c7_fbae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2067_c7_d85a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2080_c7_f9d0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2072_c7_fbae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2076_c7_fa8f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond;
     tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output := tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2057_c2_a38d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond;
     t16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue;
     t16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output := t16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2080_c7_f9d0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2064_c7_c6f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2064_c7_c6f4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond;
     n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue;
     n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output := n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2076_c7_fa8f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2067_c7_d85a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2072_c7_fbae] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_cond;
     tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output := tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2064_c7_c6f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2067_c7_d85a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_fa8f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2067_c7_d85a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_cond;
     tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output := tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2057_c2_a38d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2057_c2_a38d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2057_c2_a38d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond;
     n16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue;
     n16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output := n16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2072_c7_fbae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output := result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2064_c7_c6f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2064_c7_c6f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2072_c7_fbae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2064_c7_c6f4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond;
     tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output := tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2067_c7_d85a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2057_c2_a38d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2057_c2_a38d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2067_c7_d85a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2057_c2_a38d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_cond;
     tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output := tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2064_c7_c6f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_c6f4_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2057_c2_a38d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2099_l2053_DUPLICATE_9aba LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2099_l2053_DUPLICATE_9aba_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c2_a38d_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2099_l2053_DUPLICATE_9aba_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2099_l2053_DUPLICATE_9aba_return_output;
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
