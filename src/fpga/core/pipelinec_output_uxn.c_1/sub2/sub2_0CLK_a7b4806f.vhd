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
entity sub2_0CLK_a7b4806f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_a7b4806f;
architecture arch of sub2_0CLK_a7b4806f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2653_c6_8a7f]
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2653_c1_5473]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2653_c2_38a0]
signal n16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2653_c2_38a0]
signal tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2653_c2_38a0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2653_c2_38a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2653_c2_38a0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2653_c2_38a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2653_c2_38a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2653_c2_38a0]
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2653_c2_38a0]
signal t16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2654_c3_55c9[uxn_opcodes_h_l2654_c3_55c9]
signal printf_uxn_opcodes_h_l2654_c3_55c9_uxn_opcodes_h_l2654_c3_55c9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2658_c11_50b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2658_c7_50b7]
signal n16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2658_c7_50b7]
signal tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2658_c7_50b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2658_c7_50b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2658_c7_50b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2658_c7_50b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2658_c7_50b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2658_c7_50b7]
signal result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2658_c7_50b7]
signal t16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_52c5]
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2661_c7_8f60]
signal n16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2661_c7_8f60]
signal tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2661_c7_8f60]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_8f60]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2661_c7_8f60]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_8f60]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2661_c7_8f60]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2661_c7_8f60]
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2661_c7_8f60]
signal t16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2666_c11_9e33]
signal BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2666_c7_bf5d]
signal n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2666_c7_bf5d]
signal tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2666_c7_bf5d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2666_c7_bf5d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2666_c7_bf5d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2666_c7_bf5d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2666_c7_bf5d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2666_c7_bf5d]
signal result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2666_c7_bf5d]
signal t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2669_c11_1f18]
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2669_c7_5b2e]
signal n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2669_c7_5b2e]
signal tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2669_c7_5b2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2669_c7_5b2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2669_c7_5b2e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2669_c7_5b2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2669_c7_5b2e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2669_c7_5b2e]
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2669_c7_5b2e]
signal t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2670_c3_981e]
signal BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2673_c11_d27e]
signal BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2673_c7_a3a0]
signal n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2673_c7_a3a0]
signal tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2673_c7_a3a0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2673_c7_a3a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2673_c7_a3a0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2673_c7_a3a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2673_c7_a3a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2673_c7_a3a0]
signal result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2676_c11_4596]
signal BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2676_c7_9760]
signal n16_MUX_uxn_opcodes_h_l2676_c7_9760_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2676_c7_9760_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2676_c7_9760]
signal tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2676_c7_9760]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2676_c7_9760]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2676_c7_9760]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2676_c7_9760]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2676_c7_9760]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2676_c7_9760]
signal result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2681_c11_141b]
signal BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2681_c7_a0f5]
signal n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2681_c7_a0f5]
signal tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2681_c7_a0f5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2681_c7_a0f5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2681_c7_a0f5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2681_c7_a0f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2681_c7_a0f5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2681_c7_a0f5]
signal result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2684_c11_de1c]
signal BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2684_c7_c99c]
signal n16_MUX_uxn_opcodes_h_l2684_c7_c99c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2684_c7_c99c]
signal tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2684_c7_c99c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2684_c7_c99c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2684_c7_c99c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2684_c7_c99c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2684_c7_c99c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2684_c7_c99c]
signal result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2685_c3_3824]
signal BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2686_c11_8356]
signal BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2688_c30_9160]
signal sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_bda9]
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2693_c7_7868]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2693_c7_7868]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2693_c7_7868]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2693_c7_7868]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2693_c7_7868]
signal result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2696_c31_656d]
signal CONST_SR_8_uxn_opcodes_h_l2696_c31_656d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2696_c31_656d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_3b63]
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_5e71]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_5e71]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f
BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_left,
BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_right,
BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_return_output);

-- n16_MUX_uxn_opcodes_h_l2653_c2_38a0
n16_MUX_uxn_opcodes_h_l2653_c2_38a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond,
n16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue,
n16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse,
n16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0
tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond,
tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0
result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output);

-- t16_MUX_uxn_opcodes_h_l2653_c2_38a0
t16_MUX_uxn_opcodes_h_l2653_c2_38a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond,
t16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue,
t16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse,
t16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output);

-- printf_uxn_opcodes_h_l2654_c3_55c9_uxn_opcodes_h_l2654_c3_55c9
printf_uxn_opcodes_h_l2654_c3_55c9_uxn_opcodes_h_l2654_c3_55c9 : entity work.printf_uxn_opcodes_h_l2654_c3_55c9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2654_c3_55c9_uxn_opcodes_h_l2654_c3_55c9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_return_output);

-- n16_MUX_uxn_opcodes_h_l2658_c7_50b7
n16_MUX_uxn_opcodes_h_l2658_c7_50b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond,
n16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue,
n16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse,
n16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7
tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond,
tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7
result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output);

-- t16_MUX_uxn_opcodes_h_l2658_c7_50b7
t16_MUX_uxn_opcodes_h_l2658_c7_50b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond,
t16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue,
t16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse,
t16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_left,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_right,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_return_output);

-- n16_MUX_uxn_opcodes_h_l2661_c7_8f60
n16_MUX_uxn_opcodes_h_l2661_c7_8f60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond,
n16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue,
n16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse,
n16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60
tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond,
tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue,
tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse,
tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_cond,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output);

-- t16_MUX_uxn_opcodes_h_l2661_c7_8f60
t16_MUX_uxn_opcodes_h_l2661_c7_8f60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond,
t16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue,
t16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse,
t16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33
BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_left,
BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_right,
BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_return_output);

-- n16_MUX_uxn_opcodes_h_l2666_c7_bf5d
n16_MUX_uxn_opcodes_h_l2666_c7_bf5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond,
n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue,
n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse,
n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d
tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond,
tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d
result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output);

-- t16_MUX_uxn_opcodes_h_l2666_c7_bf5d
t16_MUX_uxn_opcodes_h_l2666_c7_bf5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond,
t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue,
t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse,
t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_left,
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_right,
BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_return_output);

-- n16_MUX_uxn_opcodes_h_l2669_c7_5b2e
n16_MUX_uxn_opcodes_h_l2669_c7_5b2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond,
n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue,
n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse,
n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e
tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond,
tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output);

-- t16_MUX_uxn_opcodes_h_l2669_c7_5b2e
t16_MUX_uxn_opcodes_h_l2669_c7_5b2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond,
t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue,
t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse,
t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e
BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_left,
BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_right,
BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e
BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_left,
BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_right,
BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_return_output);

-- n16_MUX_uxn_opcodes_h_l2673_c7_a3a0
n16_MUX_uxn_opcodes_h_l2673_c7_a3a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond,
n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue,
n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse,
n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0
tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond,
tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0
result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_left,
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_right,
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_return_output);

-- n16_MUX_uxn_opcodes_h_l2676_c7_9760
n16_MUX_uxn_opcodes_h_l2676_c7_9760 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2676_c7_9760_cond,
n16_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue,
n16_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse,
n16_MUX_uxn_opcodes_h_l2676_c7_9760_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2676_c7_9760
tmp16_MUX_uxn_opcodes_h_l2676_c7_9760 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_cond,
tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue,
tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse,
tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760
result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760
result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_cond,
result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b
BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_left,
BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_right,
BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_return_output);

-- n16_MUX_uxn_opcodes_h_l2681_c7_a0f5
n16_MUX_uxn_opcodes_h_l2681_c7_a0f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond,
n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue,
n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse,
n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5
tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond,
tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue,
tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse,
tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5
result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c
BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_left,
BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_right,
BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_return_output);

-- n16_MUX_uxn_opcodes_h_l2684_c7_c99c
n16_MUX_uxn_opcodes_h_l2684_c7_c99c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2684_c7_c99c_cond,
n16_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue,
n16_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse,
n16_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c
tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_cond,
tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c
result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c
result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c
result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c
result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824
BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_left,
BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_right,
BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356
BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_left,
BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_right,
BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2688_c30_9160
sp_relative_shift_uxn_opcodes_h_l2688_c30_9160 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_ins,
sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_x,
sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_y,
sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_left,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_right,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868
result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_cond,
result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2696_c31_656d
CONST_SR_8_uxn_opcodes_h_l2696_c31_656d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2696_c31_656d_x,
CONST_SR_8_uxn_opcodes_h_l2696_c31_656d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_left,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_right,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa
CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_return_output,
 n16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output,
 t16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_return_output,
 n16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output,
 t16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_return_output,
 n16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output,
 tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output,
 t16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_return_output,
 n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output,
 t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_return_output,
 n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output,
 t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_return_output,
 n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_return_output,
 n16_MUX_uxn_opcodes_h_l2676_c7_9760_return_output,
 tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_return_output,
 n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_return_output,
 n16_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_return_output,
 sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_return_output,
 CONST_SR_8_uxn_opcodes_h_l2696_c31_656d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2655_c3_908f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2654_c3_55c9_uxn_opcodes_h_l2654_c3_55c9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2659_c3_98d4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2664_c3_5219 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2667_c3_54be : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2671_c3_09ac : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2676_c7_9760_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2674_c3_a315 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2676_c7_9760_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_3eeb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2682_c3_3f57 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c99c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2690_c3_ce5d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2691_c21_7562_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_d2b6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2693_c7_7868_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2696_c31_656d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2696_c31_656d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2696_c21_bb95_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2661_l2684_l2658_DUPLICATE_ffd1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_a3fc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2658_DUPLICATE_c029_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_5e39_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2681_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2684_l2658_DUPLICATE_5611_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2670_l2677_l2662_l2685_DUPLICATE_b81c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2649_l2703_DUPLICATE_f077_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_3eeb := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_3eeb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2682_c3_3f57 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2682_c3_3f57;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2659_c3_98d4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2659_c3_98d4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2674_c3_a315 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2674_c3_a315;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2664_c3_5219 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2664_c3_5219;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2690_c3_ce5d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2690_c3_ce5d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2655_c3_908f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2655_c3_908f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2667_c3_54be := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2667_c3_54be;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_d2b6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_d2b6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2671_c3_09ac := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2671_c3_09ac;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_right := to_unsigned(10, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2696_c31_656d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2681_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2684_l2658_DUPLICATE_5611 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2681_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2684_l2658_DUPLICATE_5611_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2681_c11_141b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2696_c31_656d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2696_c31_656d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2696_c31_656d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2696_c31_656d_return_output := CONST_SR_8_uxn_opcodes_h_l2696_c31_656d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_52c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2670_l2677_l2662_l2685_DUPLICATE_b81c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2670_l2677_l2662_l2685_DUPLICATE_b81c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2669_c11_1f18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_left;
     BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_return_output := BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2673_c11_d27e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_a3fc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_a3fc_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2693_c7_7868] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2693_c7_7868_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_3b63] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_left;
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_return_output := BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_bda9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_5e39 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_5e39_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2653_c6_8a7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2658_DUPLICATE_c029 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2658_DUPLICATE_c029_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2676_c11_4596] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_left;
     BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_return_output := BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2684_c11_de1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2661_l2684_l2658_DUPLICATE_ffd1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2661_l2684_l2658_DUPLICATE_ffd1_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2658_c11_50b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2688_c30_9160] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_ins;
     sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_x;
     sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_return_output := sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2666_c11_9e33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_left;
     BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_return_output := BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c6_8a7f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_50b2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_52c5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_9e33_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2669_c11_1f18_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_d27e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2676_c7_9760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_4596_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_141b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2684_c11_de1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bda9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_3b63_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2670_l2677_l2662_l2685_DUPLICATE_b81c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2670_l2677_l2662_l2685_DUPLICATE_b81c_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2670_l2677_l2662_l2685_DUPLICATE_b81c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2661_l2684_l2658_DUPLICATE_ffd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2661_l2684_l2658_DUPLICATE_ffd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2661_l2684_l2658_DUPLICATE_ffd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2661_l2684_l2658_DUPLICATE_ffd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2661_l2684_l2658_DUPLICATE_ffd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2661_l2684_l2658_DUPLICATE_ffd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2661_l2684_l2658_DUPLICATE_ffd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2661_l2684_l2658_DUPLICATE_ffd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2661_l2684_l2658_DUPLICATE_ffd1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2681_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2684_l2658_DUPLICATE_5611_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2681_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2684_l2658_DUPLICATE_5611_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2681_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2684_l2658_DUPLICATE_5611_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2681_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2684_l2658_DUPLICATE_5611_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2681_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2684_l2658_DUPLICATE_5611_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2681_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2684_l2658_DUPLICATE_5611_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2681_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2684_l2658_DUPLICATE_5611_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2681_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2684_l2658_DUPLICATE_5611_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2681_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2684_l2658_DUPLICATE_5611_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2681_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2684_l2658_DUPLICATE_5611_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_a3fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_a3fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_a3fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_a3fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_a3fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_a3fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_a3fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_a3fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_a3fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2658_DUPLICATE_c029_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2658_DUPLICATE_c029_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2658_DUPLICATE_c029_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2658_DUPLICATE_c029_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2658_DUPLICATE_c029_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2658_DUPLICATE_c029_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2658_DUPLICATE_c029_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2658_DUPLICATE_c029_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2658_DUPLICATE_c029_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2698_l2666_l2693_l2661_l2658_DUPLICATE_c029_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_5e39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_5e39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_5e39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_5e39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_5e39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_5e39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_5e39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_5e39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2681_l2653_l2676_l2673_l2669_l2666_l2693_l2661_l2658_DUPLICATE_5e39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2693_c7_7868_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2688_c30_9160_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_5e71] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2653_c1_5473] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_5e71] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2693_c7_7868] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2685_c3_3824] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_left;
     BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_return_output := BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2684_c7_c99c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2670_c3_981e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_left;
     BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_return_output := BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2696_c21_bb95] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2696_c21_bb95_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2696_c31_656d_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2693_c7_7868] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2670_c3_981e_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2685_c3_3824_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2696_c21_bb95_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2678_l2663_DUPLICATE_0aaa_return_output;
     VAR_printf_uxn_opcodes_h_l2654_c3_55c9_uxn_opcodes_h_l2654_c3_55c9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2653_c1_5473_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_5e71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_7868_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_5e71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_7868_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2693_c7_7868] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_return_output := result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2681_c7_a0f5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2684_c7_c99c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2684_c7_c99c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2684_c7_c99c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2684_c7_c99c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c99c_cond;
     n16_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue;
     n16_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output := n16_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2669_c7_5b2e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond;
     t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue;
     t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output := t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2693_c7_7868] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2686_c11_8356] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2693_c7_7868] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_return_output;

     -- printf_uxn_opcodes_h_l2654_c3_55c9[uxn_opcodes_h_l2654_c3_55c9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2654_c3_55c9_uxn_opcodes_h_l2654_c3_55c9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2654_c3_55c9_uxn_opcodes_h_l2654_c3_55c9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_7868_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_7868_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2693_c7_7868_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2684_c7_c99c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2684_c7_c99c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2681_c7_a0f5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2676_c7_9760] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_return_output;

     -- n16_MUX[uxn_opcodes_h_l2681_c7_a0f5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond;
     n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue;
     n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output := n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output;

     -- t16_MUX[uxn_opcodes_h_l2666_c7_bf5d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond;
     t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue;
     t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output := t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2681_c7_a0f5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2691_c21_7562] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2691_c21_7562_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2686_c11_8356_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l2684_c7_c99c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_cond;
     tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output := tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2691_c21_7562_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_9760_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2684_c7_c99c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2681_c7_a0f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2676_c7_9760] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2676_c7_9760] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2673_c7_a3a0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2661_c7_8f60] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond;
     t16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue;
     t16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output := t16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;

     -- n16_MUX[uxn_opcodes_h_l2676_c7_9760] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2676_c7_9760_cond <= VAR_n16_MUX_uxn_opcodes_h_l2676_c7_9760_cond;
     n16_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue;
     n16_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2676_c7_9760_return_output := n16_MUX_uxn_opcodes_h_l2676_c7_9760_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2681_c7_a0f5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2681_c7_a0f5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond;
     tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output := tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2676_c7_9760_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_9760_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_9760_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2684_c7_c99c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2676_c7_9760] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2676_c7_9760] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_return_output;

     -- t16_MUX[uxn_opcodes_h_l2658_c7_50b7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond;
     t16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue;
     t16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output := t16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2673_c7_a3a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2669_c7_5b2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2673_c7_a3a0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond;
     n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue;
     n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output := n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2681_c7_a0f5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2673_c7_a3a0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2676_c7_9760] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_cond;
     tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_return_output := tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_9760_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2676_c7_9760_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a0f5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2676_c7_9760_return_output;
     -- t16_MUX[uxn_opcodes_h_l2653_c2_38a0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond;
     t16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue;
     t16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output := t16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2669_c7_5b2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2673_c7_a3a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2666_c7_bf5d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2673_c7_a3a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2673_c7_a3a0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond;
     tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output := tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2676_c7_9760] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_return_output := result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2669_c7_5b2e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2669_c7_5b2e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond;
     n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue;
     n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output := n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2676_c7_9760_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2673_c7_a3a0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2669_c7_5b2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2661_c7_8f60] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2666_c7_bf5d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2669_c7_5b2e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2666_c7_bf5d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond;
     n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue;
     n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output := n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2666_c7_bf5d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2669_c7_5b2e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond;
     tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output := tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2673_c7_a3a0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2661_c7_8f60] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2666_c7_bf5d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond;
     tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output := tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_8f60] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2658_c7_50b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2669_c7_5b2e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2661_c7_8f60] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond <= VAR_n16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond;
     n16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue;
     n16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output := n16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2666_c7_bf5d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2666_c7_bf5d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2669_c7_5b2e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;
     -- n16_MUX[uxn_opcodes_h_l2658_c7_50b7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond;
     n16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue;
     n16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output := n16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2666_c7_bf5d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2658_c7_50b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_8f60] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2658_c7_50b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2661_c7_8f60] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2653_c2_38a0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2661_c7_8f60] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_cond;
     tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output := tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_bf5d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;
     -- n16_MUX[uxn_opcodes_h_l2653_c2_38a0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond;
     n16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue;
     n16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output := n16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2653_c2_38a0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2658_c7_50b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2653_c2_38a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2658_c7_50b7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_cond;
     tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output := tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2661_c7_8f60] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output := result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2658_c7_50b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2661_c7_8f60_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2658_c7_50b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2653_c2_38a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2653_c2_38a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2653_c2_38a0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_cond;
     tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output := tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c7_50b7_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2653_c2_38a0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2649_l2703_DUPLICATE_f077 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2649_l2703_DUPLICATE_f077_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2653_c2_38a0_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2649_l2703_DUPLICATE_f077_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2649_l2703_DUPLICATE_f077_return_output;
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
