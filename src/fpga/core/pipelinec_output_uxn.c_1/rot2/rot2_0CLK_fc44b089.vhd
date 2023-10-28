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
-- Submodules: 165
entity rot2_0CLK_fc44b089 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_fc44b089;
architecture arch of rot2_0CLK_fc44b089 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal l16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_l16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2871_c6_c38b]
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2871_c1_d584]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2871_c2_a2bc]
signal t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2871_c2_a2bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2871_c2_a2bc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2871_c2_a2bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2871_c2_a2bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2871_c2_a2bc]
signal result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2871_c2_a2bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2871_c2_a2bc]
signal l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2871_c2_a2bc]
signal n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2872_c3_9840[uxn_opcodes_h_l2872_c3_9840]
signal printf_uxn_opcodes_h_l2872_c3_9840_uxn_opcodes_h_l2872_c3_9840_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_7f98]
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2876_c7_64f1]
signal t16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2876_c7_64f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2876_c7_64f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2876_c7_64f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2876_c7_64f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2876_c7_64f1]
signal result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2876_c7_64f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2876_c7_64f1]
signal l16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2876_c7_64f1]
signal n16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_6a6b]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2879_c7_3ae1]
signal t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2879_c7_3ae1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2879_c7_3ae1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2879_c7_3ae1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2879_c7_3ae1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2879_c7_3ae1]
signal result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2879_c7_3ae1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2879_c7_3ae1]
signal l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2879_c7_3ae1]
signal n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_1d85]
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2884_c7_2e23]
signal t16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2884_c7_2e23]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2884_c7_2e23]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2884_c7_2e23]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2884_c7_2e23]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2884_c7_2e23]
signal result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2884_c7_2e23]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2884_c7_2e23]
signal l16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2884_c7_2e23]
signal n16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_4548]
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2887_c7_8608]
signal t16_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2887_c7_8608]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2887_c7_8608]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2887_c7_8608]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2887_c7_8608]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2887_c7_8608]
signal result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2887_c7_8608]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2887_c7_8608]
signal l16_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2887_c7_8608]
signal n16_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2888_c3_9e67]
signal BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_7b53]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2891_c7_a99e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2891_c7_a99e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2891_c7_a99e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2891_c7_a99e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2891_c7_a99e]
signal result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2891_c7_a99e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2891_c7_a99e]
signal l16_MUX_uxn_opcodes_h_l2891_c7_a99e_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2891_c7_a99e]
signal n16_MUX_uxn_opcodes_h_l2891_c7_a99e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_8964]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2894_c7_01d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2894_c7_01d7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2894_c7_01d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2894_c7_01d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2894_c7_01d7]
signal result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2894_c7_01d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2894_c7_01d7]
signal l16_MUX_uxn_opcodes_h_l2894_c7_01d7_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2894_c7_01d7]
signal n16_MUX_uxn_opcodes_h_l2894_c7_01d7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_1c0c]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2899_c7_f4c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2899_c7_f4c3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2899_c7_f4c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2899_c7_f4c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2899_c7_f4c3]
signal result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2899_c7_f4c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2899_c7_f4c3]
signal l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2899_c7_f4c3]
signal n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_fe22]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2902_c7_6a14]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2902_c7_6a14]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2902_c7_6a14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2902_c7_6a14]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2902_c7_6a14]
signal result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2902_c7_6a14]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2902_c7_6a14]
signal l16_MUX_uxn_opcodes_h_l2902_c7_6a14_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2902_c7_6a14]
signal n16_MUX_uxn_opcodes_h_l2902_c7_6a14_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2903_c3_a68e]
signal BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_19f5]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2906_c7_5e9c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2906_c7_5e9c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2906_c7_5e9c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2906_c7_5e9c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2906_c7_5e9c]
signal result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2906_c7_5e9c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2906_c7_5e9c]
signal l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_ba05]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2909_c7_0404]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2909_c7_0404]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2909_c7_0404]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2909_c7_0404]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2909_c7_0404]
signal result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2909_c7_0404]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2909_c7_0404]
signal l16_MUX_uxn_opcodes_h_l2909_c7_0404_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2909_c7_0404_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_103f]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2914_c7_16c8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2914_c7_16c8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2914_c7_16c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2914_c7_16c8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2914_c7_16c8]
signal result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2914_c7_16c8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2914_c7_16c8]
signal l16_MUX_uxn_opcodes_h_l2914_c7_16c8_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_c4f8]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2917_c7_dbe4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2917_c7_dbe4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2917_c7_dbe4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2917_c7_dbe4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2917_c7_dbe4]
signal result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2917_c7_dbe4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2917_c7_dbe4]
signal l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2918_c3_aa59]
signal BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2920_c30_3b59]
signal sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_84e0]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2925_c7_e255]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2925_c7_e255]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2925_c7_e255]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2925_c7_e255]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2925_c7_e255]
signal result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2928_c31_2620]
signal CONST_SR_8_uxn_opcodes_h_l2928_c31_2620_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2928_c31_2620_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_12d3]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2930_c7_ce66]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2930_c7_ce66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2930_c7_ce66]
signal result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2930_c7_ce66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_dda9]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2934_c7_1a12]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2934_c7_1a12]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2934_c7_1a12]
signal result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2934_c7_1a12]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2936_c31_e0c4]
signal CONST_SR_8_uxn_opcodes_h_l2936_c31_e0c4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2936_c31_e0c4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_7783]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2938_c7_559e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2938_c7_559e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2938_c7_559e]
signal result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2938_c7_559e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_eb81]
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2942_c7_0e91]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2942_c7_0e91]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2942_c7_0e91]
signal result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2942_c7_0e91]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2944_c31_e958]
signal CONST_SR_8_uxn_opcodes_h_l2944_c31_e958_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2944_c31_e958_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2946_c11_bce8]
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2946_c7_9a18]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2946_c7_9a18]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_left,
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_right,
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_return_output);

-- t16_MUX_uxn_opcodes_h_l2871_c2_a2bc
t16_MUX_uxn_opcodes_h_l2871_c2_a2bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond,
t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue,
t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse,
t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc
result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output);

-- l16_MUX_uxn_opcodes_h_l2871_c2_a2bc
l16_MUX_uxn_opcodes_h_l2871_c2_a2bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond,
l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue,
l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse,
l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output);

-- n16_MUX_uxn_opcodes_h_l2871_c2_a2bc
n16_MUX_uxn_opcodes_h_l2871_c2_a2bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond,
n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue,
n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse,
n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output);

-- printf_uxn_opcodes_h_l2872_c3_9840_uxn_opcodes_h_l2872_c3_9840
printf_uxn_opcodes_h_l2872_c3_9840_uxn_opcodes_h_l2872_c3_9840 : entity work.printf_uxn_opcodes_h_l2872_c3_9840_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2872_c3_9840_uxn_opcodes_h_l2872_c3_9840_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_left,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_right,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_return_output);

-- t16_MUX_uxn_opcodes_h_l2876_c7_64f1
t16_MUX_uxn_opcodes_h_l2876_c7_64f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond,
t16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue,
t16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse,
t16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1
result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1
result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1
result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1
result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output);

-- l16_MUX_uxn_opcodes_h_l2876_c7_64f1
l16_MUX_uxn_opcodes_h_l2876_c7_64f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond,
l16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue,
l16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse,
l16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output);

-- n16_MUX_uxn_opcodes_h_l2876_c7_64f1
n16_MUX_uxn_opcodes_h_l2876_c7_64f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond,
n16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue,
n16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse,
n16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_return_output);

-- t16_MUX_uxn_opcodes_h_l2879_c7_3ae1
t16_MUX_uxn_opcodes_h_l2879_c7_3ae1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond,
t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue,
t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse,
t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1
result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1
result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output);

-- l16_MUX_uxn_opcodes_h_l2879_c7_3ae1
l16_MUX_uxn_opcodes_h_l2879_c7_3ae1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond,
l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue,
l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse,
l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output);

-- n16_MUX_uxn_opcodes_h_l2879_c7_3ae1
n16_MUX_uxn_opcodes_h_l2879_c7_3ae1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond,
n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue,
n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse,
n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_left,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_right,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_return_output);

-- t16_MUX_uxn_opcodes_h_l2884_c7_2e23
t16_MUX_uxn_opcodes_h_l2884_c7_2e23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond,
t16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue,
t16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse,
t16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23
result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23
result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23
result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23
result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_cond,
result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23
result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output);

-- l16_MUX_uxn_opcodes_h_l2884_c7_2e23
l16_MUX_uxn_opcodes_h_l2884_c7_2e23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond,
l16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue,
l16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse,
l16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output);

-- n16_MUX_uxn_opcodes_h_l2884_c7_2e23
n16_MUX_uxn_opcodes_h_l2884_c7_2e23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond,
n16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue,
n16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse,
n16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_left,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_right,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_return_output);

-- t16_MUX_uxn_opcodes_h_l2887_c7_8608
t16_MUX_uxn_opcodes_h_l2887_c7_8608 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2887_c7_8608_cond,
t16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue,
t16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse,
t16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608
result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608
result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608
result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608
result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_cond,
result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608
result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_return_output);

-- l16_MUX_uxn_opcodes_h_l2887_c7_8608
l16_MUX_uxn_opcodes_h_l2887_c7_8608 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2887_c7_8608_cond,
l16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue,
l16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse,
l16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output);

-- n16_MUX_uxn_opcodes_h_l2887_c7_8608
n16_MUX_uxn_opcodes_h_l2887_c7_8608 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2887_c7_8608_cond,
n16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue,
n16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse,
n16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67
BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_left,
BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_right,
BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e
result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e
result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e
result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e
result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output);

-- l16_MUX_uxn_opcodes_h_l2891_c7_a99e
l16_MUX_uxn_opcodes_h_l2891_c7_a99e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2891_c7_a99e_cond,
l16_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue,
l16_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse,
l16_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output);

-- n16_MUX_uxn_opcodes_h_l2891_c7_a99e
n16_MUX_uxn_opcodes_h_l2891_c7_a99e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2891_c7_a99e_cond,
n16_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue,
n16_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse,
n16_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7
result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output);

-- l16_MUX_uxn_opcodes_h_l2894_c7_01d7
l16_MUX_uxn_opcodes_h_l2894_c7_01d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2894_c7_01d7_cond,
l16_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue,
l16_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse,
l16_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output);

-- n16_MUX_uxn_opcodes_h_l2894_c7_01d7
n16_MUX_uxn_opcodes_h_l2894_c7_01d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2894_c7_01d7_cond,
n16_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue,
n16_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse,
n16_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3
result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output);

-- l16_MUX_uxn_opcodes_h_l2899_c7_f4c3
l16_MUX_uxn_opcodes_h_l2899_c7_f4c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond,
l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue,
l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse,
l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output);

-- n16_MUX_uxn_opcodes_h_l2899_c7_f4c3
n16_MUX_uxn_opcodes_h_l2899_c7_f4c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond,
n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue,
n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse,
n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14
result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14
result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14
result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14
result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_cond,
result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14
result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output);

-- l16_MUX_uxn_opcodes_h_l2902_c7_6a14
l16_MUX_uxn_opcodes_h_l2902_c7_6a14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2902_c7_6a14_cond,
l16_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue,
l16_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse,
l16_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output);

-- n16_MUX_uxn_opcodes_h_l2902_c7_6a14
n16_MUX_uxn_opcodes_h_l2902_c7_6a14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2902_c7_6a14_cond,
n16_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue,
n16_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse,
n16_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e
BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_left,
BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_right,
BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c
result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output);

-- l16_MUX_uxn_opcodes_h_l2906_c7_5e9c
l16_MUX_uxn_opcodes_h_l2906_c7_5e9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond,
l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue,
l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse,
l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404
result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_cond,
result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_return_output);

-- l16_MUX_uxn_opcodes_h_l2909_c7_0404
l16_MUX_uxn_opcodes_h_l2909_c7_0404 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2909_c7_0404_cond,
l16_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue,
l16_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse,
l16_MUX_uxn_opcodes_h_l2909_c7_0404_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8
result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8
result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8
result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8
result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output);

-- l16_MUX_uxn_opcodes_h_l2914_c7_16c8
l16_MUX_uxn_opcodes_h_l2914_c7_16c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2914_c7_16c8_cond,
l16_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue,
l16_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse,
l16_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4
result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4
result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4
result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4
result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output);

-- l16_MUX_uxn_opcodes_h_l2917_c7_dbe4
l16_MUX_uxn_opcodes_h_l2917_c7_dbe4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond,
l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue,
l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse,
l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59
BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_left,
BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_right,
BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59
sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_ins,
sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_x,
sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_y,
sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255
result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255
result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255
result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255
result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_cond,
result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2928_c31_2620
CONST_SR_8_uxn_opcodes_h_l2928_c31_2620 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2928_c31_2620_x,
CONST_SR_8_uxn_opcodes_h_l2928_c31_2620_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66
result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66
result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_cond,
result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66
result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12
result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12
result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_cond,
result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12
result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2936_c31_e0c4
CONST_SR_8_uxn_opcodes_h_l2936_c31_e0c4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2936_c31_e0c4_x,
CONST_SR_8_uxn_opcodes_h_l2936_c31_e0c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e
result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e
result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e
result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_left,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_right,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91
result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91
result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_cond,
result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91
result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2944_c31_e958
CONST_SR_8_uxn_opcodes_h_l2944_c31_e958 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2944_c31_e958_x,
CONST_SR_8_uxn_opcodes_h_l2944_c31_e958_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_left,
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_right,
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18
result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18
result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4
CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4_return_output);



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
 l16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_return_output,
 t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output,
 l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output,
 n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_return_output,
 t16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output,
 l16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output,
 n16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_return_output,
 t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output,
 l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output,
 n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_return_output,
 t16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output,
 l16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output,
 n16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_return_output,
 t16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_return_output,
 l16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output,
 n16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output,
 l16_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output,
 n16_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output,
 l16_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output,
 n16_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output,
 l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output,
 n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output,
 l16_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output,
 n16_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output,
 l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_return_output,
 l16_MUX_uxn_opcodes_h_l2909_c7_0404_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output,
 l16_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output,
 l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_return_output,
 sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_return_output,
 CONST_SR_8_uxn_opcodes_h_l2928_c31_2620_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output,
 CONST_SR_8_uxn_opcodes_h_l2936_c31_e0c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output,
 CONST_SR_8_uxn_opcodes_h_l2944_c31_e958_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2873_c3_4155 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2872_c3_9840_uxn_opcodes_h_l2872_c3_9840_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2877_c3_ddf3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2882_c3_aa59 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2885_c3_92e8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2889_c3_07ad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2887_c7_8608_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2892_c3_1932 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2891_c7_a99e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2891_c7_a99e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2897_c3_48bd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2894_c7_01d7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2894_c7_01d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2900_c3_eff3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2904_c3_5e95 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2902_c7_6a14_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2902_c7_6a14_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2907_c3_3d20 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2909_c7_0404_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2912_c3_dd62 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2909_c7_0404_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2915_c3_0dbb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2914_c7_16c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2922_c3_210c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2923_c21_d69b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2927_c3_d507 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2928_c31_2620_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2928_c31_2620_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2928_c21_0cb3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2931_c3_915e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2932_c21_3f08_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2935_c3_7cdb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2936_c31_e0c4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2936_c31_e0c4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2936_c21_fc8a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2939_c3_aec3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2940_c21_3d0f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2943_c3_7900 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2942_c7_0e91_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2944_c31_e958_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2944_c31_e958_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2944_c21_37bb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_5ca1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2891_l2914_l2942_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_a955_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2917_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_c2c9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2895_l2888_l2910_l2903_l2918_l2880_DUPLICATE_a919_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2867_l2951_DUPLICATE_96ae_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_l16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_l16 := l16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2915_c3_0dbb := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2915_c3_0dbb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_right := to_unsigned(14, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2943_c3_7900 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2943_c3_7900;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_right := to_unsigned(13, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2897_c3_48bd := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2897_c3_48bd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2904_c3_5e95 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2904_c3_5e95;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2885_c3_92e8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2885_c3_92e8;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2873_c3_4155 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2873_c3_4155;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2889_c3_07ad := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2889_c3_07ad;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_right := to_unsigned(16, 5);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2927_c3_d507 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2927_c3_d507;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2892_c3_1932 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2892_c3_1932;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2907_c3_3d20 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2907_c3_3d20;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_right := to_unsigned(18, 5);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2939_c3_aec3 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2939_c3_aec3;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2877_c3_ddf3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2877_c3_ddf3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2931_c3_915e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2931_c3_915e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2912_c3_dd62 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2912_c3_dd62;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2900_c3_eff3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2900_c3_eff3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2922_c3_210c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2922_c3_210c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2935_c3_7cdb := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2935_c3_7cdb;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2882_c3_aa59 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2882_c3_aa59;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2928_c31_2620_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2944_c31_e958_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2936_c31_e0c4_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse := t16;
     -- CONST_SR_8[uxn_opcodes_h_l2944_c31_e958] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2944_c31_e958_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2944_c31_e958_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2944_c31_e958_return_output := CONST_SR_8_uxn_opcodes_h_l2944_c31_e958_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_7783] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_12d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_ba05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2940_c21_3d0f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2940_c21_3d0f_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2895_l2888_l2910_l2903_l2918_l2880_DUPLICATE_a919 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2895_l2888_l2910_l2903_l2918_l2880_DUPLICATE_a919_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_8964] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_103f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2936_c31_e0c4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2936_c31_e0c4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2936_c31_e0c4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2936_c31_e0c4_return_output := CONST_SR_8_uxn_opcodes_h_l2936_c31_e0c4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2891_l2914_l2942_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_a955 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2891_l2914_l2942_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_a955_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_7f98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_left;
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_return_output := BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2917_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_c2c9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2917_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_c2c9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_7b53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2928_c31_2620] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2928_c31_2620_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2928_c31_2620_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2928_c31_2620_return_output := CONST_SR_8_uxn_opcodes_h_l2928_c31_2620_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_6a6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_84e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2932_c21_3f08] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2932_c21_3f08_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_19f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_5ca1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_5ca1_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_eb81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_left;
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_return_output := BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_1c0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2871_c6_c38b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2920_c30_3b59] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_ins;
     sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_x;
     sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_return_output := sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_1d85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_left;
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_return_output := BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2946_c11_bce8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_fe22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2942_c7_0e91] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2942_c7_0e91_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_4548] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_left;
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_return_output := BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_dda9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_c4f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_c38b_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_7f98_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6a6b_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1d85_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2887_c7_8608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2887_c7_8608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2887_c7_8608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_4548_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2891_c7_a99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2891_c7_a99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b53_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2894_c7_01d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2894_c7_01d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_8964_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1c0c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2902_c7_6a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2902_c7_6a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_fe22_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_19f5_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2909_c7_0404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ba05_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2914_c7_16c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_103f_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_c4f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_84e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_12d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_dda9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_7783_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_eb81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_bce8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2895_l2888_l2910_l2903_l2918_l2880_DUPLICATE_a919_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2895_l2888_l2910_l2903_l2918_l2880_DUPLICATE_a919_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2895_l2888_l2910_l2903_l2918_l2880_DUPLICATE_a919_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2895_l2888_l2910_l2903_l2918_l2880_DUPLICATE_a919_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2932_c21_3f08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2940_c21_3d0f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2917_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_c2c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2917_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_c2c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2917_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_c2c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2917_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_c2c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2917_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_c2c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2917_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_c2c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2917_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_c2c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2917_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_c2c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2917_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_c2c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2917_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_c2c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2917_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_c2c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2917_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_c2c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2917_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_c2c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2899_l2925_l2894_l2917_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_d85a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_5ca1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_5ca1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_5ca1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_5ca1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_5ca1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_5ca1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_5ca1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_5ca1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_5ca1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_5ca1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_5ca1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_5ca1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2891_l2914_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_5ca1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2899_l2925_l2871_l2894_l2946_l2891_l2914_l2942_l2887_l2909_l2938_l2884_l2906_l2934_l2879_l2902_l2930_l2876_DUPLICATE_ae8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2891_l2914_l2942_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_a955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2891_l2914_l2942_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_a955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2891_l2914_l2942_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_a955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2891_l2914_l2942_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_a955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2891_l2914_l2942_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_a955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2891_l2914_l2942_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_a955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2891_l2914_l2942_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_a955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2891_l2914_l2942_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_a955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2891_l2914_l2942_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_a955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2891_l2914_l2942_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_a955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2891_l2914_l2942_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_a955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2891_l2914_l2942_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_a955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2899_l2871_l2894_l2891_l2914_l2942_l2887_l2909_l2884_l2906_l2879_l2902_l2876_DUPLICATE_a955_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2942_c7_0e91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2920_c30_3b59_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2946_c7_9a18] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2944_c21_37bb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2944_c21_37bb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2944_c31_e958_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2871_c1_d584] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2942_c7_0e91] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2918_c3_aa59] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_left;
     BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_return_output := BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2946_c7_9a18] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2928_c21_0cb3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2928_c21_0cb3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2928_c31_2620_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2936_c21_fc8a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2936_c21_fc8a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2936_c31_e0c4_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2917_c7_dbe4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2903_c3_a68e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_left;
     BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_return_output := BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2888_c3_9e67] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_left;
     BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_return_output := BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2925_c7_e255] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2888_c3_9e67_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2903_c3_a68e_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2928_c21_0cb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2936_c21_fc8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2944_c21_37bb_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2896_l2881_l2911_DUPLICATE_efe4_return_output;
     VAR_printf_uxn_opcodes_h_l2872_c3_9840_uxn_opcodes_h_l2872_c3_9840_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d584_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2946_c7_9a18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2925_c7_e255_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2946_c7_9a18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2942_c7_0e91] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2938_c7_559e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2942_c7_0e91] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output := result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output;

     -- n16_MUX[uxn_opcodes_h_l2902_c7_6a14] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2902_c7_6a14_cond <= VAR_n16_MUX_uxn_opcodes_h_l2902_c7_6a14_cond;
     n16_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue;
     n16_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output := n16_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2923_c21_d69b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2923_c21_d69b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2918_c3_aa59_return_output);

     -- l16_MUX[uxn_opcodes_h_l2917_c7_dbe4] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond <= VAR_l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond;
     l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue;
     l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output := l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2914_c7_16c8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2917_c7_dbe4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2887_c7_8608] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2887_c7_8608_cond <= VAR_t16_MUX_uxn_opcodes_h_l2887_c7_8608_cond;
     t16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue;
     t16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output := t16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;

     -- printf_uxn_opcodes_h_l2872_c3_9840[uxn_opcodes_h_l2872_c3_9840] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2872_c3_9840_uxn_opcodes_h_l2872_c3_9840_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2872_c3_9840_uxn_opcodes_h_l2872_c3_9840_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2942_c7_0e91] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2923_c21_d69b_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2938_c7_559e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2942_c7_0e91_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2909_c7_0404] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2938_c7_559e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2899_c7_f4c3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond;
     n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue;
     n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output := n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output;

     -- l16_MUX[uxn_opcodes_h_l2914_c7_16c8] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2914_c7_16c8_cond <= VAR_l16_MUX_uxn_opcodes_h_l2914_c7_16c8_cond;
     l16_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue;
     l16_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output := l16_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2934_c7_1a12] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2914_c7_16c8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2884_c7_2e23] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond <= VAR_t16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond;
     t16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue;
     t16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output := t16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2938_c7_559e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2938_c7_559e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2938_c7_559e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2938_c7_559e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_0404_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2938_c7_559e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;
     -- t16_MUX[uxn_opcodes_h_l2879_c7_3ae1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond;
     t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue;
     t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output := t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2934_c7_1a12] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2906_c7_5e9c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output;

     -- l16_MUX[uxn_opcodes_h_l2909_c7_0404] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2909_c7_0404_cond <= VAR_l16_MUX_uxn_opcodes_h_l2909_c7_0404_cond;
     l16_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue;
     l16_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2909_c7_0404_return_output := l16_MUX_uxn_opcodes_h_l2909_c7_0404_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2934_c7_1a12] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output;

     -- n16_MUX[uxn_opcodes_h_l2894_c7_01d7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2894_c7_01d7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2894_c7_01d7_cond;
     n16_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue;
     n16_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output := n16_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2909_c7_0404] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2934_c7_1a12] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output := result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2930_c7_ce66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2909_c7_0404_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_0404_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2934_c7_1a12_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;
     -- n16_MUX[uxn_opcodes_h_l2891_c7_a99e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2891_c7_a99e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2891_c7_a99e_cond;
     n16_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue;
     n16_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output := n16_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2906_c7_5e9c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2930_c7_ce66] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output;

     -- l16_MUX[uxn_opcodes_h_l2906_c7_5e9c] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond <= VAR_l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond;
     l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue;
     l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output := l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2876_c7_64f1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond;
     t16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue;
     t16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output := t16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2930_c7_ce66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2902_c7_6a14] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2930_c7_ce66] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output := result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2925_c7_e255] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_e255_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2930_c7_ce66_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2925_c7_e255] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2925_c7_e255] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_return_output := result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_return_output;

     -- n16_MUX[uxn_opcodes_h_l2887_c7_8608] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2887_c7_8608_cond <= VAR_n16_MUX_uxn_opcodes_h_l2887_c7_8608_cond;
     n16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue;
     n16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output := n16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2917_c7_dbe4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2871_c2_a2bc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond <= VAR_t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond;
     t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue;
     t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output := t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2925_c7_e255] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2902_c7_6a14] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output;

     -- l16_MUX[uxn_opcodes_h_l2902_c7_6a14] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2902_c7_6a14_cond <= VAR_l16_MUX_uxn_opcodes_h_l2902_c7_6a14_cond;
     l16_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue;
     l16_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output := l16_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2899_c7_f4c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_e255_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_e255_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_e255_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2917_c7_dbe4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2917_c7_dbe4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2894_c7_01d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2884_c7_2e23] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond <= VAR_n16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond;
     n16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue;
     n16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output := n16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2899_c7_f4c3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2914_c7_16c8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output;

     -- l16_MUX[uxn_opcodes_h_l2899_c7_f4c3] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond <= VAR_l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond;
     l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue;
     l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output := l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2917_c7_dbe4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2917_c7_dbe4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2891_c7_a99e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2909_c7_0404] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2894_c7_01d7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2914_c7_16c8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2914_c7_16c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2914_c7_16c8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2879_c7_3ae1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond;
     n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue;
     n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output := n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;

     -- l16_MUX[uxn_opcodes_h_l2894_c7_01d7] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2894_c7_01d7_cond <= VAR_l16_MUX_uxn_opcodes_h_l2894_c7_01d7_cond;
     l16_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue;
     l16_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output := l16_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_0404_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2914_c7_16c8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2909_c7_0404] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2891_c7_a99e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2906_c7_5e9c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2876_c7_64f1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond;
     n16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue;
     n16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output := n16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2909_c7_0404] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_return_output := result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2909_c7_0404] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2887_c7_8608] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;

     -- l16_MUX[uxn_opcodes_h_l2891_c7_a99e] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2891_c7_a99e_cond <= VAR_l16_MUX_uxn_opcodes_h_l2891_c7_a99e_cond;
     l16_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue;
     l16_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output := l16_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output;

     -- Submodule level 10
     VAR_l16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_0404_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_0404_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_0404_return_output;
     -- n16_MUX[uxn_opcodes_h_l2871_c2_a2bc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond;
     n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue;
     n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output := n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2906_c7_5e9c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2884_c7_2e23] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2906_c7_5e9c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output;

     -- l16_MUX[uxn_opcodes_h_l2887_c7_8608] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2887_c7_8608_cond <= VAR_l16_MUX_uxn_opcodes_h_l2887_c7_8608_cond;
     l16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue;
     l16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output := l16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2902_c7_6a14] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2906_c7_5e9c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2887_c7_8608] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;

     -- Submodule level 11
     VAR_l16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2906_c7_5e9c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2902_c7_6a14] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2879_c7_3ae1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2902_c7_6a14] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output := result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2884_c7_2e23] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2899_c7_f4c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output;

     -- l16_MUX[uxn_opcodes_h_l2884_c7_2e23] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond <= VAR_l16_MUX_uxn_opcodes_h_l2884_c7_2e23_cond;
     l16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue;
     l16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output := l16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2902_c7_6a14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output;

     -- Submodule level 12
     VAR_l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2902_c7_6a14_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2894_c7_01d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2876_c7_64f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;

     -- l16_MUX[uxn_opcodes_h_l2879_c7_3ae1] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond <= VAR_l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond;
     l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue;
     l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output := l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2899_c7_f4c3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2899_c7_f4c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2899_c7_f4c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2879_c7_3ae1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;

     -- Submodule level 13
     VAR_l16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2899_c7_f4c3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2894_c7_01d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2871_c2_a2bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2876_c7_64f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2894_c7_01d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2891_c7_a99e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2894_c7_01d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output;

     -- l16_MUX[uxn_opcodes_h_l2876_c7_64f1] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond <= VAR_l16_MUX_uxn_opcodes_h_l2876_c7_64f1_cond;
     l16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue;
     l16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output := l16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;

     -- Submodule level 14
     VAR_l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_01d7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2891_c7_a99e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2891_c7_a99e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output;

     -- l16_MUX[uxn_opcodes_h_l2871_c2_a2bc] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond <= VAR_l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond;
     l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue;
     l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output := l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2891_c7_a99e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2871_c2_a2bc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2887_c7_8608] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;

     -- Submodule level 15
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2891_c7_a99e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2887_c7_8608] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2887_c7_8608] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_return_output := result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2887_c7_8608] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2884_c7_2e23] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2887_c7_8608_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2884_c7_2e23] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2884_c7_2e23] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output := result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2879_c7_3ae1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2884_c7_2e23] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;

     -- Submodule level 17
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2884_c7_2e23_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2876_c7_64f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2879_c7_3ae1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2879_c7_3ae1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2879_c7_3ae1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;

     -- Submodule level 18
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_3ae1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2876_c7_64f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2876_c7_64f1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2871_c2_a2bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2876_c7_64f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;

     -- Submodule level 19
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2876_c7_64f1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2871_c2_a2bc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2871_c2_a2bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2871_c2_a2bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output;

     -- Submodule level 20
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2867_l2951_DUPLICATE_96ae LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2867_l2951_DUPLICATE_96ae_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c2_a2bc_return_output);

     -- Submodule level 21
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2867_l2951_DUPLICATE_96ae_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2867_l2951_DUPLICATE_96ae_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_l16 <= REG_VAR_l16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     l16 <= REG_COMB_l16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
