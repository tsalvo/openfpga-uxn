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
-- Submodules: 68
entity swp_0CLK_90fc2573 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp_0CLK_90fc2573;
architecture arch of swp_0CLK_90fc2573 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2894_c6_15f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_f13a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2894_c2_6012]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2894_c2_6012]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2894_c2_6012]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2894_c2_6012]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2894_c2_6012]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2894_c2_6012]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2894_c2_6012]
signal result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2894_c2_6012]
signal t8_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2894_c2_6012]
signal n8_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2895_c3_d849[uxn_opcodes_h_l2895_c3_d849]
signal printf_uxn_opcodes_h_l2895_c3_d849_uxn_opcodes_h_l2895_c3_d849_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_4704]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2900_c7_7746]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2900_c7_7746]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2900_c7_7746]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2900_c7_7746]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2900_c7_7746]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2900_c7_7746]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2900_c7_7746]
signal result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2900_c7_7746]
signal t8_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2900_c7_7746]
signal n8_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_846e]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2903_c7_cb00]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2903_c7_cb00]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2903_c7_cb00]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2903_c7_cb00]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2903_c7_cb00]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2903_c7_cb00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2903_c7_cb00]
signal result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2903_c7_cb00]
signal t8_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2903_c7_cb00]
signal n8_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_3587]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2907_c7_c0a8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2907_c7_c0a8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2907_c7_c0a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2907_c7_c0a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2907_c7_c0a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2907_c7_c0a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2907_c7_c0a8]
signal result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2907_c7_c0a8]
signal n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_3439]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2910_c7_8759]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2910_c7_8759]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2910_c7_8759]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2910_c7_8759]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2910_c7_8759]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2910_c7_8759]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2910_c7_8759]
signal result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2910_c7_8759]
signal n8_MUX_uxn_opcodes_h_l2910_c7_8759_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2910_c7_8759_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2914_c32_ff06]
signal BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2914_c32_e5d0]
signal BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2914_c32_cdb3]
signal MUX_uxn_opcodes_h_l2914_c32_cdb3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2914_c32_cdb3_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2914_c32_cdb3_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2914_c32_cdb3_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_6ebe]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2916_c7_fa61]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2916_c7_fa61]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2916_c7_fa61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2916_c7_fa61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2916_c7_fa61]
signal result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_03a1]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2922_c7_63d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2922_c7_63d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2922_c7_63d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2922_c7_63d4]
signal result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_64ab]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2926_c7_4f4a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2926_c7_4f4a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4
BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012
result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012
result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_cond,
result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_return_output);

-- t8_MUX_uxn_opcodes_h_l2894_c2_6012
t8_MUX_uxn_opcodes_h_l2894_c2_6012 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2894_c2_6012_cond,
t8_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue,
t8_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse,
t8_MUX_uxn_opcodes_h_l2894_c2_6012_return_output);

-- n8_MUX_uxn_opcodes_h_l2894_c2_6012
n8_MUX_uxn_opcodes_h_l2894_c2_6012 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2894_c2_6012_cond,
n8_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue,
n8_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse,
n8_MUX_uxn_opcodes_h_l2894_c2_6012_return_output);

-- printf_uxn_opcodes_h_l2895_c3_d849_uxn_opcodes_h_l2895_c3_d849
printf_uxn_opcodes_h_l2895_c3_d849_uxn_opcodes_h_l2895_c3_d849 : entity work.printf_uxn_opcodes_h_l2895_c3_d849_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2895_c3_d849_uxn_opcodes_h_l2895_c3_d849_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746
result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746
result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746
result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746
result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746
result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746
result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_cond,
result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_return_output);

-- t8_MUX_uxn_opcodes_h_l2900_c7_7746
t8_MUX_uxn_opcodes_h_l2900_c7_7746 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2900_c7_7746_cond,
t8_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue,
t8_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse,
t8_MUX_uxn_opcodes_h_l2900_c7_7746_return_output);

-- n8_MUX_uxn_opcodes_h_l2900_c7_7746
n8_MUX_uxn_opcodes_h_l2900_c7_7746 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2900_c7_7746_cond,
n8_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue,
n8_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse,
n8_MUX_uxn_opcodes_h_l2900_c7_7746_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00
result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00
result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00
result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00
result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00
result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00
result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_cond,
result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output);

-- t8_MUX_uxn_opcodes_h_l2903_c7_cb00
t8_MUX_uxn_opcodes_h_l2903_c7_cb00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2903_c7_cb00_cond,
t8_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue,
t8_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse,
t8_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output);

-- n8_MUX_uxn_opcodes_h_l2903_c7_cb00
n8_MUX_uxn_opcodes_h_l2903_c7_cb00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2903_c7_cb00_cond,
n8_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue,
n8_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse,
n8_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8
result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8
result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8
result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8
result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8
result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output);

-- n8_MUX_uxn_opcodes_h_l2907_c7_c0a8
n8_MUX_uxn_opcodes_h_l2907_c7_c0a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond,
n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue,
n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse,
n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759
result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759
result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759
result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759
result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759
result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759
result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_cond,
result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_return_output);

-- n8_MUX_uxn_opcodes_h_l2910_c7_8759
n8_MUX_uxn_opcodes_h_l2910_c7_8759 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2910_c7_8759_cond,
n8_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue,
n8_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse,
n8_MUX_uxn_opcodes_h_l2910_c7_8759_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06
BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_left,
BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_right,
BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0
BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_left,
BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_right,
BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_return_output);

-- MUX_uxn_opcodes_h_l2914_c32_cdb3
MUX_uxn_opcodes_h_l2914_c32_cdb3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2914_c32_cdb3_cond,
MUX_uxn_opcodes_h_l2914_c32_cdb3_iftrue,
MUX_uxn_opcodes_h_l2914_c32_cdb3_iffalse,
MUX_uxn_opcodes_h_l2914_c32_cdb3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61
result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61
result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61
result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61
result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_cond,
result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4
result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4
result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4
result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a
result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a
result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_return_output,
 t8_MUX_uxn_opcodes_h_l2894_c2_6012_return_output,
 n8_MUX_uxn_opcodes_h_l2894_c2_6012_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_return_output,
 t8_MUX_uxn_opcodes_h_l2900_c7_7746_return_output,
 n8_MUX_uxn_opcodes_h_l2900_c7_7746_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output,
 t8_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output,
 n8_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output,
 n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_return_output,
 n8_MUX_uxn_opcodes_h_l2910_c7_8759_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_return_output,
 MUX_uxn_opcodes_h_l2914_c32_cdb3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2897_c3_f0d4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2900_c7_7746_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2894_c2_6012_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2894_c2_6012_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2895_c3_d849_uxn_opcodes_h_l2895_c3_d849_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2901_c3_3fb3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2900_c7_7746_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2905_c3_1c28 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2903_c7_cb00_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2908_c3_5bb6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2910_c7_8759_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2910_c7_8759_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2914_c32_cdb3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2914_c32_cdb3_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2914_c32_cdb3_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2914_c32_cdb3_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2919_c3_54f6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2923_c3_74c1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2894_l2916_l2907_l2903_l2900_DUPLICATE_4683_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2894_l2910_l2907_l2903_l2900_DUPLICATE_74fe_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_l2926_DUPLICATE_ddce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_DUPLICATE_0d09_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2907_l2900_l2910_l2903_DUPLICATE_fe5e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2922_l2916_l2910_l2907_l2903_l2900_l2926_DUPLICATE_7504_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2922_l2910_DUPLICATE_b3aa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2931_l2890_DUPLICATE_d74e_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2923_c3_74c1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2923_c3_74c1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2908_c3_5bb6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2908_c3_5bb6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2919_c3_54f6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2919_c3_54f6;
     VAR_MUX_uxn_opcodes_h_l2914_c32_cdb3_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l2914_c32_cdb3_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2905_c3_1c28 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2905_c3_1c28;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2901_c3_3fb3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2901_c3_3fb3;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2897_c3_f0d4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2897_c3_f0d4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_4704] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_6ebe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_l2926_DUPLICATE_ddce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_l2926_DUPLICATE_ddce_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2922_l2916_l2910_l2907_l2903_l2900_l2926_DUPLICATE_7504 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2922_l2916_l2910_l2907_l2903_l2900_l2926_DUPLICATE_7504_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2894_l2916_l2907_l2903_l2900_DUPLICATE_4683 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2894_l2916_l2907_l2903_l2900_DUPLICATE_4683_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2907_l2900_l2910_l2903_DUPLICATE_fe5e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2907_l2900_l2910_l2903_DUPLICATE_fe5e_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_64ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2914_c32_ff06] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_left;
     BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_return_output := BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_3439] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c6_15f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_3587] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_03a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_DUPLICATE_0d09 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_DUPLICATE_0d09_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2894_l2910_l2907_l2903_l2900_DUPLICATE_74fe LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2894_l2910_l2907_l2903_l2900_DUPLICATE_74fe_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2922_l2910_DUPLICATE_b3aa LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2922_l2910_DUPLICATE_b3aa_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_846e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2914_c32_ff06_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2894_c2_6012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2894_c2_6012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c6_15f4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2900_c7_7746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2900_c7_7746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_4704_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2903_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2903_c7_cb00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_846e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3587_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2910_c7_8759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3439_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_6ebe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_03a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_64ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2894_l2910_l2907_l2903_l2900_DUPLICATE_74fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2894_l2910_l2907_l2903_l2900_DUPLICATE_74fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2894_l2910_l2907_l2903_l2900_DUPLICATE_74fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2894_l2910_l2907_l2903_l2900_DUPLICATE_74fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2894_l2910_l2907_l2903_l2900_DUPLICATE_74fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2922_l2916_l2910_l2907_l2903_l2900_l2926_DUPLICATE_7504_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2922_l2916_l2910_l2907_l2903_l2900_l2926_DUPLICATE_7504_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2922_l2916_l2910_l2907_l2903_l2900_l2926_DUPLICATE_7504_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2922_l2916_l2910_l2907_l2903_l2900_l2926_DUPLICATE_7504_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2922_l2916_l2910_l2907_l2903_l2900_l2926_DUPLICATE_7504_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2922_l2916_l2910_l2907_l2903_l2900_l2926_DUPLICATE_7504_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2922_l2916_l2910_l2907_l2903_l2900_l2926_DUPLICATE_7504_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2894_l2916_l2907_l2903_l2900_DUPLICATE_4683_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2894_l2916_l2907_l2903_l2900_DUPLICATE_4683_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2894_l2916_l2907_l2903_l2900_DUPLICATE_4683_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2894_l2916_l2907_l2903_l2900_DUPLICATE_4683_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2894_l2916_l2907_l2903_l2900_DUPLICATE_4683_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2907_l2900_l2910_l2903_DUPLICATE_fe5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2907_l2900_l2910_l2903_DUPLICATE_fe5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2907_l2900_l2910_l2903_DUPLICATE_fe5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2907_l2900_l2910_l2903_DUPLICATE_fe5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_l2926_DUPLICATE_ddce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_l2926_DUPLICATE_ddce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_l2926_DUPLICATE_ddce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_l2926_DUPLICATE_ddce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_l2926_DUPLICATE_ddce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_l2926_DUPLICATE_ddce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_l2926_DUPLICATE_ddce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2922_l2910_DUPLICATE_b3aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2922_l2910_DUPLICATE_b3aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_DUPLICATE_0d09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_DUPLICATE_0d09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_DUPLICATE_0d09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_DUPLICATE_0d09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_DUPLICATE_0d09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2894_l2922_l2910_l2907_l2903_l2900_DUPLICATE_0d09_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2922_c7_63d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output;

     -- t8_MUX[uxn_opcodes_h_l2903_c7_cb00] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2903_c7_cb00_cond <= VAR_t8_MUX_uxn_opcodes_h_l2903_c7_cb00_cond;
     t8_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue;
     t8_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output := t8_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2916_c7_fa61] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2910_c7_8759] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2926_c7_4f4a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_return_output;

     -- n8_MUX[uxn_opcodes_h_l2910_c7_8759] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2910_c7_8759_cond <= VAR_n8_MUX_uxn_opcodes_h_l2910_c7_8759_cond;
     n8_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue;
     n8_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2910_c7_8759_return_output := n8_MUX_uxn_opcodes_h_l2910_c7_8759_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2922_c7_63d4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2926_c7_4f4a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2914_c32_e5d0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_left;
     BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_return_output := BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_f13a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2914_c32_cdb3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2914_c32_e5d0_return_output;
     VAR_printf_uxn_opcodes_h_l2895_c3_d849_uxn_opcodes_h_l2895_c3_d849_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_f13a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2910_c7_8759_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_4f4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2910_c7_8759_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_4f4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2907_c7_c0a8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output;

     -- n8_MUX[uxn_opcodes_h_l2907_c7_c0a8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond <= VAR_n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond;
     n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue;
     n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output := n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2922_c7_63d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2922_c7_63d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2910_c7_8759] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_return_output;

     -- printf_uxn_opcodes_h_l2895_c3_d849[uxn_opcodes_h_l2895_c3_d849] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2895_c3_d849_uxn_opcodes_h_l2895_c3_d849_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2895_c3_d849_uxn_opcodes_h_l2895_c3_d849_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l2916_c7_fa61] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output := result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output;

     -- t8_MUX[uxn_opcodes_h_l2900_c7_7746] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2900_c7_7746_cond <= VAR_t8_MUX_uxn_opcodes_h_l2900_c7_7746_cond;
     t8_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue;
     t8_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2900_c7_7746_return_output := t8_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2916_c7_fa61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output;

     -- MUX[uxn_opcodes_h_l2914_c32_cdb3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2914_c32_cdb3_cond <= VAR_MUX_uxn_opcodes_h_l2914_c32_cdb3_cond;
     MUX_uxn_opcodes_h_l2914_c32_cdb3_iftrue <= VAR_MUX_uxn_opcodes_h_l2914_c32_cdb3_iftrue;
     MUX_uxn_opcodes_h_l2914_c32_cdb3_iffalse <= VAR_MUX_uxn_opcodes_h_l2914_c32_cdb3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2914_c32_cdb3_return_output := MUX_uxn_opcodes_h_l2914_c32_cdb3_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue := VAR_MUX_uxn_opcodes_h_l2914_c32_cdb3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8759_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_63d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2916_c7_fa61] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2910_c7_8759] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2910_c7_8759] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2907_c7_c0a8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2910_c7_8759] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_return_output := result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_return_output;

     -- n8_MUX[uxn_opcodes_h_l2903_c7_cb00] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2903_c7_cb00_cond <= VAR_n8_MUX_uxn_opcodes_h_l2903_c7_cb00_cond;
     n8_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue;
     n8_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output := n8_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2916_c7_fa61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2903_c7_cb00] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;

     -- t8_MUX[uxn_opcodes_h_l2894_c2_6012] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2894_c2_6012_cond <= VAR_t8_MUX_uxn_opcodes_h_l2894_c2_6012_cond;
     t8_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue;
     t8_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2894_c2_6012_return_output := t8_MUX_uxn_opcodes_h_l2894_c2_6012_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2916_c7_fa61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8759_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8759_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8759_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2894_c2_6012_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2907_c7_c0a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output;

     -- n8_MUX[uxn_opcodes_h_l2900_c7_7746] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2900_c7_7746_cond <= VAR_n8_MUX_uxn_opcodes_h_l2900_c7_7746_cond;
     n8_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue;
     n8_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2900_c7_7746_return_output := n8_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2900_c7_7746] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2907_c7_c0a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2907_c7_c0a8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2910_c7_8759] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2903_c7_cb00] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2910_c7_8759] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8759_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8759_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2903_c7_cb00] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2900_c7_7746] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;

     -- n8_MUX[uxn_opcodes_h_l2894_c2_6012] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2894_c2_6012_cond <= VAR_n8_MUX_uxn_opcodes_h_l2894_c2_6012_cond;
     n8_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue;
     n8_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2894_c2_6012_return_output := n8_MUX_uxn_opcodes_h_l2894_c2_6012_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2907_c7_c0a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2894_c2_6012] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2907_c7_c0a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2903_c7_cb00] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output := result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2903_c7_cb00] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2894_c2_6012_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2907_c7_c0a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2900_c7_7746] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2903_c7_cb00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2900_c7_7746] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2900_c7_7746] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_return_output := result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2903_c7_cb00] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2894_c2_6012] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_cb00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2900_c7_7746] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2894_c2_6012] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_return_output := result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2900_c7_7746] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2894_c2_6012] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2894_c2_6012] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2900_c7_7746_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2894_c2_6012] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2894_c2_6012] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2931_l2890_DUPLICATE_d74e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2931_l2890_DUPLICATE_d74e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c2_6012_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2894_c2_6012_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c2_6012_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c2_6012_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c2_6012_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c2_6012_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2894_c2_6012_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2931_l2890_DUPLICATE_d74e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2931_l2890_DUPLICATE_d74e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
