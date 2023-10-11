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
-- Submodules: 97
entity sft2_0CLK_cb029fa9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_cb029fa9;
architecture arch of sft2_0CLK_cb029fa9 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2448_c6_fded]
signal BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2448_c1_50c5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2448_c2_d40e]
signal tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2448_c2_d40e]
signal t8_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2448_c2_d40e]
signal n16_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2448_c2_d40e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2448_c2_d40e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2448_c2_d40e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2448_c2_d40e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2448_c2_d40e]
signal result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2448_c2_d40e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2449_c3_c9a7[uxn_opcodes_h_l2449_c3_c9a7]
signal printf_uxn_opcodes_h_l2449_c3_c9a7_uxn_opcodes_h_l2449_c3_c9a7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2453_c11_d4eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2453_c7_39bb]
signal tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2453_c7_39bb]
signal t8_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2453_c7_39bb]
signal n16_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2453_c7_39bb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2453_c7_39bb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2453_c7_39bb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2453_c7_39bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2453_c7_39bb]
signal result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2453_c7_39bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2456_c11_6253]
signal BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2456_c7_d72d]
signal tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2456_c7_d72d]
signal t8_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2456_c7_d72d]
signal n16_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2456_c7_d72d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2456_c7_d72d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2456_c7_d72d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2456_c7_d72d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2456_c7_d72d]
signal result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2456_c7_d72d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2460_c11_30cd]
signal BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2460_c7_3463]
signal tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2460_c7_3463]
signal n16_MUX_uxn_opcodes_h_l2460_c7_3463_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2460_c7_3463_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2460_c7_3463]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2460_c7_3463]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2460_c7_3463]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2460_c7_3463]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2460_c7_3463]
signal result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2460_c7_3463]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2463_c11_83e2]
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2463_c7_5b54]
signal tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2463_c7_5b54]
signal n16_MUX_uxn_opcodes_h_l2463_c7_5b54_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2463_c7_5b54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2463_c7_5b54]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2463_c7_5b54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2463_c7_5b54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2463_c7_5b54]
signal result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2463_c7_5b54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2465_c3_1a6c]
signal CONST_SL_8_uxn_opcodes_h_l2465_c3_1a6c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2465_c3_1a6c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2468_c11_38d9]
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2468_c7_207d]
signal tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2468_c7_207d]
signal n16_MUX_uxn_opcodes_h_l2468_c7_207d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2468_c7_207d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2468_c7_207d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2468_c7_207d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2468_c7_207d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2468_c7_207d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2468_c7_207d]
signal result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2468_c7_207d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2471_c11_4c43]
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2471_c7_806b]
signal tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2471_c7_806b]
signal n16_MUX_uxn_opcodes_h_l2471_c7_806b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2471_c7_806b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2471_c7_806b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2471_c7_806b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2471_c7_806b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2471_c7_806b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2471_c7_806b]
signal result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2471_c7_806b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2472_c3_b38a]
signal BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2474_c32_4f48]
signal BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2474_c32_8441]
signal BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2474_c32_7cf4]
signal MUX_uxn_opcodes_h_l2474_c32_7cf4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2474_c32_7cf4_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2474_c32_7cf4_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2474_c32_7cf4_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2476_c11_5f2e]
signal BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2476_c7_b58a]
signal tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2476_c7_b58a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2476_c7_b58a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2476_c7_b58a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2476_c7_b58a]
signal result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2476_c7_b58a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2477_c20_af20]
signal BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2477_c12_6d2e]
signal BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2477_c36_5049]
signal CONST_SR_4_uxn_opcodes_h_l2477_c36_5049_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2477_c36_5049_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2477_c12_b818]
signal BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2483_c11_9470]
signal BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2483_c7_157f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2483_c7_157f]
signal result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2483_c7_157f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2483_c7_157f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2485_c34_1c2b]
signal CONST_SR_8_uxn_opcodes_h_l2485_c34_1c2b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2485_c34_1c2b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2487_c11_9755]
signal BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2487_c7_5b05]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2487_c7_5b05]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded
BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_left,
BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_right,
BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e
tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_cond,
tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output);

-- t8_MUX_uxn_opcodes_h_l2448_c2_d40e
t8_MUX_uxn_opcodes_h_l2448_c2_d40e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2448_c2_d40e_cond,
t8_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue,
t8_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse,
t8_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output);

-- n16_MUX_uxn_opcodes_h_l2448_c2_d40e
n16_MUX_uxn_opcodes_h_l2448_c2_d40e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2448_c2_d40e_cond,
n16_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue,
n16_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse,
n16_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e
result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e
result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e
result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e
result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output);

-- printf_uxn_opcodes_h_l2449_c3_c9a7_uxn_opcodes_h_l2449_c3_c9a7
printf_uxn_opcodes_h_l2449_c3_c9a7_uxn_opcodes_h_l2449_c3_c9a7 : entity work.printf_uxn_opcodes_h_l2449_c3_c9a7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2449_c3_c9a7_uxn_opcodes_h_l2449_c3_c9a7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb
tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_cond,
tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue,
tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse,
tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output);

-- t8_MUX_uxn_opcodes_h_l2453_c7_39bb
t8_MUX_uxn_opcodes_h_l2453_c7_39bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2453_c7_39bb_cond,
t8_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue,
t8_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse,
t8_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output);

-- n16_MUX_uxn_opcodes_h_l2453_c7_39bb
n16_MUX_uxn_opcodes_h_l2453_c7_39bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2453_c7_39bb_cond,
n16_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue,
n16_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse,
n16_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb
result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb
result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_left,
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_right,
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d
tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_cond,
tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output);

-- t8_MUX_uxn_opcodes_h_l2456_c7_d72d
t8_MUX_uxn_opcodes_h_l2456_c7_d72d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2456_c7_d72d_cond,
t8_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue,
t8_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse,
t8_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output);

-- n16_MUX_uxn_opcodes_h_l2456_c7_d72d
n16_MUX_uxn_opcodes_h_l2456_c7_d72d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2456_c7_d72d_cond,
n16_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue,
n16_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse,
n16_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d
result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_left,
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_right,
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2460_c7_3463
tmp16_MUX_uxn_opcodes_h_l2460_c7_3463 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_cond,
tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue,
tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse,
tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_return_output);

-- n16_MUX_uxn_opcodes_h_l2460_c7_3463
n16_MUX_uxn_opcodes_h_l2460_c7_3463 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2460_c7_3463_cond,
n16_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue,
n16_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse,
n16_MUX_uxn_opcodes_h_l2460_c7_3463_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463
result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463
result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_cond,
result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_left,
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_right,
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54
tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_cond,
tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue,
tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse,
tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output);

-- n16_MUX_uxn_opcodes_h_l2463_c7_5b54
n16_MUX_uxn_opcodes_h_l2463_c7_5b54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2463_c7_5b54_cond,
n16_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue,
n16_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse,
n16_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54
result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_cond,
result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2465_c3_1a6c
CONST_SL_8_uxn_opcodes_h_l2465_c3_1a6c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2465_c3_1a6c_x,
CONST_SL_8_uxn_opcodes_h_l2465_c3_1a6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_left,
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_right,
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2468_c7_207d
tmp16_MUX_uxn_opcodes_h_l2468_c7_207d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_cond,
tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_return_output);

-- n16_MUX_uxn_opcodes_h_l2468_c7_207d
n16_MUX_uxn_opcodes_h_l2468_c7_207d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2468_c7_207d_cond,
n16_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue,
n16_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse,
n16_MUX_uxn_opcodes_h_l2468_c7_207d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d
result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_left,
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_right,
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2471_c7_806b
tmp16_MUX_uxn_opcodes_h_l2471_c7_806b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_cond,
tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_return_output);

-- n16_MUX_uxn_opcodes_h_l2471_c7_806b
n16_MUX_uxn_opcodes_h_l2471_c7_806b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2471_c7_806b_cond,
n16_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue,
n16_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse,
n16_MUX_uxn_opcodes_h_l2471_c7_806b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b
result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a
BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_left,
BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_right,
BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48
BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_left,
BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_right,
BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441
BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_left,
BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_right,
BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_return_output);

-- MUX_uxn_opcodes_h_l2474_c32_7cf4
MUX_uxn_opcodes_h_l2474_c32_7cf4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2474_c32_7cf4_cond,
MUX_uxn_opcodes_h_l2474_c32_7cf4_iftrue,
MUX_uxn_opcodes_h_l2474_c32_7cf4_iffalse,
MUX_uxn_opcodes_h_l2474_c32_7cf4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e
BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_left,
BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_right,
BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a
tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_cond,
tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a
result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a
result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a
result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a
result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20
BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_left,
BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_right,
BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e
BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_left,
BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_right,
BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2477_c36_5049
CONST_SR_4_uxn_opcodes_h_l2477_c36_5049 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2477_c36_5049_x,
CONST_SR_4_uxn_opcodes_h_l2477_c36_5049_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818
BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_left,
BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_right,
BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470
BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_left,
BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_right,
BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f
result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f
result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f
result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2485_c34_1c2b
CONST_SR_8_uxn_opcodes_h_l2485_c34_1c2b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2485_c34_1c2b_x,
CONST_SR_8_uxn_opcodes_h_l2485_c34_1c2b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755
BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_left,
BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_right,
BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05
result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05
result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output,
 t8_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output,
 n16_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output,
 t8_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output,
 n16_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_return_output,
 tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output,
 t8_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output,
 n16_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_return_output,
 tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_return_output,
 n16_MUX_uxn_opcodes_h_l2460_c7_3463_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output,
 n16_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output,
 CONST_SL_8_uxn_opcodes_h_l2465_c3_1a6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_return_output,
 n16_MUX_uxn_opcodes_h_l2468_c7_207d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_return_output,
 tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_return_output,
 n16_MUX_uxn_opcodes_h_l2471_c7_806b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_return_output,
 MUX_uxn_opcodes_h_l2474_c32_7cf4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_return_output,
 CONST_SR_4_uxn_opcodes_h_l2477_c36_5049_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_return_output,
 CONST_SR_8_uxn_opcodes_h_l2485_c34_1c2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2450_c3_5cbc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2449_c3_c9a7_uxn_opcodes_h_l2449_c3_c9a7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2454_c3_7899 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2460_c7_3463_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2458_c3_70b9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2460_c7_3463_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_b12b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2468_c7_207d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5b54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2466_c3_d2cc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2465_c3_1a6c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2465_c3_1a6c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_806b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2468_c7_207d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2469_c3_82a8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_806b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2474_c32_7cf4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2474_c32_7cf4_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2474_c32_7cf4_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2474_c32_7cf4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2480_c3_0007 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2477_c36_5049_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2477_c36_5049_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2481_c24_b951_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2484_c3_27c9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2485_c34_1c2b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2485_c34_1c2b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2485_c24_20b8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_979d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2476_l2448_l2468_DUPLICATE_9603_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2448_l2471_l2468_DUPLICATE_2710_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_7523_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2476_l2471_l2468_DUPLICATE_e39f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2464_l2472_DUPLICATE_b765_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2483_l2471_DUPLICATE_2f96_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2492_l2443_DUPLICATE_693a_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2469_c3_82a8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2469_c3_82a8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2454_c3_7899 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2454_c3_7899;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2484_c3_27c9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2484_c3_27c9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_b12b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_b12b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2466_c3_d2cc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2466_c3_d2cc;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2480_c3_0007 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2480_c3_0007;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2458_c3_70b9 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2458_c3_70b9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2450_c3_5cbc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2450_c3_5cbc;
     VAR_MUX_uxn_opcodes_h_l2474_c32_7cf4_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_right := to_unsigned(128, 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l2474_c32_7cf4_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_left := n16;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2477_c36_5049_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2485_c34_1c2b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_979d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_979d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2463_c11_83e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2464_l2472_DUPLICATE_b765 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2464_l2472_DUPLICATE_b765_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2468_c11_38d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2476_l2471_l2468_DUPLICATE_e39f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2476_l2471_l2468_DUPLICATE_e39f_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_7523 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_7523_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2483_c11_9470] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_left;
     BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_return_output := BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2476_c11_5f2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2485_c34_1c2b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2485_c34_1c2b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2485_c34_1c2b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2485_c34_1c2b_return_output := CONST_SR_8_uxn_opcodes_h_l2485_c34_1c2b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2474_c32_4f48] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_left;
     BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_return_output := BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2477_c20_af20] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_left;
     BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_return_output := BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2456_c11_6253] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_left;
     BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_return_output := BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2471_c11_4c43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_left;
     BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_return_output := BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2448_c6_fded] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_left;
     BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_return_output := BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2448_l2471_l2468_DUPLICATE_2710 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2448_l2471_l2468_DUPLICATE_2710_return_output := result.sp_relative_shift;

     -- CONST_SR_4[uxn_opcodes_h_l2477_c36_5049] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2477_c36_5049_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2477_c36_5049_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2477_c36_5049_return_output := CONST_SR_4_uxn_opcodes_h_l2477_c36_5049_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2483_l2471_DUPLICATE_2f96 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2483_l2471_DUPLICATE_2f96_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2460_c11_30cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2453_c11_d4eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2487_c11_9755] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_left;
     BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_return_output := BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2476_l2448_l2468_DUPLICATE_9603 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2476_l2448_l2468_DUPLICATE_9603_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_4f48_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_af20_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2448_c2_d40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2448_c2_d40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_fded_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2453_c7_39bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2453_c7_39bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_d4eb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2456_c7_d72d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2456_c7_d72d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_6253_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2460_c7_3463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_30cd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_83e2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2468_c7_207d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_38d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_806b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_4c43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_5f2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_9470_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_9755_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2464_l2472_DUPLICATE_b765_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2465_c3_1a6c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2464_l2472_DUPLICATE_b765_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2448_l2471_l2468_DUPLICATE_2710_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2448_l2471_l2468_DUPLICATE_2710_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2448_l2471_l2468_DUPLICATE_2710_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2448_l2471_l2468_DUPLICATE_2710_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2448_l2471_l2468_DUPLICATE_2710_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2448_l2471_l2468_DUPLICATE_2710_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2448_l2471_l2468_DUPLICATE_2710_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2476_l2471_l2468_DUPLICATE_e39f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2476_l2471_l2468_DUPLICATE_e39f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2476_l2471_l2468_DUPLICATE_e39f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2476_l2471_l2468_DUPLICATE_e39f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2476_l2471_l2468_DUPLICATE_e39f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2476_l2471_l2468_DUPLICATE_e39f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2476_l2471_l2468_DUPLICATE_e39f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2476_l2471_l2468_DUPLICATE_e39f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2476_l2471_l2468_DUPLICATE_e39f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2476_l2448_l2468_DUPLICATE_9603_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2476_l2448_l2468_DUPLICATE_9603_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2476_l2448_l2468_DUPLICATE_9603_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2476_l2448_l2468_DUPLICATE_9603_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2476_l2448_l2468_DUPLICATE_9603_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2476_l2448_l2468_DUPLICATE_9603_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2453_l2476_l2448_l2468_DUPLICATE_9603_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_979d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_979d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_979d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_979d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_979d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_979d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_979d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_979d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2463_l2460_l2487_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_979d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2483_l2471_DUPLICATE_2f96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2483_l2471_DUPLICATE_2f96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_7523_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_7523_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_7523_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_7523_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_7523_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_7523_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_7523_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2463_l2460_l2456_l2483_l2453_l2448_l2471_l2468_DUPLICATE_7523_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_right := VAR_CONST_SR_4_uxn_opcodes_h_l2477_c36_5049_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l2465_c3_1a6c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2465_c3_1a6c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2465_c3_1a6c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2465_c3_1a6c_return_output := CONST_SL_8_uxn_opcodes_h_l2465_c3_1a6c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2485_c24_20b8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2485_c24_20b8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2485_c34_1c2b_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2487_c7_5b05] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2472_c3_b38a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_left;
     BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_return_output := BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2474_c32_8441] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_left;
     BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_return_output := BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_return_output;

     -- t8_MUX[uxn_opcodes_h_l2456_c7_d72d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2456_c7_d72d_cond <= VAR_t8_MUX_uxn_opcodes_h_l2456_c7_d72d_cond;
     t8_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue;
     t8_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output := t8_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2483_c7_157f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2448_c1_50c5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2476_c7_b58a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2477_c12_6d2e] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_left;
     BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_return_output := BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2487_c7_5b05] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2474_c32_7cf4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_8441_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_b38a_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_6d2e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2485_c24_20b8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2465_c3_1a6c_return_output;
     VAR_printf_uxn_opcodes_h_l2449_c3_c9a7_uxn_opcodes_h_l2449_c3_c9a7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2448_c1_50c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_5b05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_5b05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_157f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;
     -- BIN_OP_SL[uxn_opcodes_h_l2477_c12_b818] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_left;
     BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_return_output := BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_return_output;

     -- MUX[uxn_opcodes_h_l2474_c32_7cf4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2474_c32_7cf4_cond <= VAR_MUX_uxn_opcodes_h_l2474_c32_7cf4_cond;
     MUX_uxn_opcodes_h_l2474_c32_7cf4_iftrue <= VAR_MUX_uxn_opcodes_h_l2474_c32_7cf4_iftrue;
     MUX_uxn_opcodes_h_l2474_c32_7cf4_iffalse <= VAR_MUX_uxn_opcodes_h_l2474_c32_7cf4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2474_c32_7cf4_return_output := MUX_uxn_opcodes_h_l2474_c32_7cf4_return_output;

     -- printf_uxn_opcodes_h_l2449_c3_c9a7[uxn_opcodes_h_l2449_c3_c9a7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2449_c3_c9a7_uxn_opcodes_h_l2449_c3_c9a7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2449_c3_c9a7_uxn_opcodes_h_l2449_c3_c9a7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l2453_c7_39bb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2453_c7_39bb_cond <= VAR_t8_MUX_uxn_opcodes_h_l2453_c7_39bb_cond;
     t8_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue;
     t8_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output := t8_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2483_c7_157f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2471_c7_806b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2471_c7_806b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2471_c7_806b_cond;
     n16_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue;
     n16_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_806b_return_output := n16_MUX_uxn_opcodes_h_l2471_c7_806b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2483_c7_157f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2471_c7_806b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2483_c7_157f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2476_c7_b58a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue := VAR_MUX_uxn_opcodes_h_l2474_c32_7cf4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2471_c7_806b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_157f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_806b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_157f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_157f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2471_c7_806b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2476_c7_b58a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2468_c7_207d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2468_c7_207d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2468_c7_207d_cond;
     n16_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue;
     n16_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2468_c7_207d_return_output := n16_MUX_uxn_opcodes_h_l2468_c7_207d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2476_c7_b58a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_cond;
     tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output := tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2476_c7_b58a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output;

     -- t8_MUX[uxn_opcodes_h_l2448_c2_d40e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2448_c2_d40e_cond <= VAR_t8_MUX_uxn_opcodes_h_l2448_c2_d40e_cond;
     t8_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue;
     t8_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output := t8_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2481_c24_b951] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2481_c24_b951_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_b818_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2471_c7_806b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2468_c7_207d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_return_output;

     -- Submodule level 4
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2481_c24_b951_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2468_c7_207d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_207d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_806b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_806b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2468_c7_207d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2476_c7_b58a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2471_c7_806b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2471_c7_806b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_cond;
     tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_return_output := tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2471_c7_806b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2463_c7_5b54] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2468_c7_207d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2463_c7_5b54] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2463_c7_5b54_cond <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5b54_cond;
     n16_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue;
     n16_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output := n16_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_806b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_806b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_207d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_207d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_b58a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_806b_return_output;
     -- n16_MUX[uxn_opcodes_h_l2460_c7_3463] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2460_c7_3463_cond <= VAR_n16_MUX_uxn_opcodes_h_l2460_c7_3463_cond;
     n16_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue;
     n16_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2460_c7_3463_return_output := n16_MUX_uxn_opcodes_h_l2460_c7_3463_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2460_c7_3463] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2468_c7_207d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2463_c7_5b54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2468_c7_207d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_cond;
     tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_return_output := tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2468_c7_207d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2463_c7_5b54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2471_c7_806b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2460_c7_3463_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_207d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_3463_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_207d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_806b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_207d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2463_c7_5b54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2460_c7_3463] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_return_output;

     -- n16_MUX[uxn_opcodes_h_l2456_c7_d72d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2456_c7_d72d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2456_c7_d72d_cond;
     n16_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue;
     n16_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output := n16_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2456_c7_d72d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2463_c7_5b54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2468_c7_207d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2463_c7_5b54] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_cond;
     tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output := tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2460_c7_3463] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_3463_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_3463_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_207d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2456_c7_d72d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2453_c7_39bb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2456_c7_d72d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2460_c7_3463] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2460_c7_3463] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_cond;
     tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_return_output := tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2460_c7_3463] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2463_c7_5b54] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output := result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output;

     -- n16_MUX[uxn_opcodes_h_l2453_c7_39bb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2453_c7_39bb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2453_c7_39bb_cond;
     n16_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue;
     n16_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output := n16_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_3463_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_3463_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_5b54_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_3463_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2456_c7_d72d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2448_c2_d40e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2448_c2_d40e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2448_c2_d40e_cond;
     n16_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue;
     n16_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output := n16_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2456_c7_d72d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_cond;
     tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output := tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2453_c7_39bb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2460_c7_3463] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_return_output := result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2456_c7_d72d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2448_c2_d40e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2453_c7_39bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_3463_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2453_c7_39bb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2453_c7_39bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2448_c2_d40e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2456_c7_d72d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2453_c7_39bb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_cond;
     tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output := tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2448_c2_d40e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_d72d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2448_c2_d40e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2448_c2_d40e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2453_c7_39bb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2448_c2_d40e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_cond;
     tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output := tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output;

     -- Submodule level 11
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_39bb_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2448_c2_d40e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2492_l2443_DUPLICATE_693a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2492_l2443_DUPLICATE_693a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_d40e_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2492_l2443_DUPLICATE_693a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2492_l2443_DUPLICATE_693a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
