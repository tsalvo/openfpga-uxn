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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 112
entity sub2_0CLK_c89b169c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_c89b169c;
architecture arch of sub2_0CLK_c89b169c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2723_c6_3f51]
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2723_c2_7dfa]
signal t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2723_c2_7dfa]
signal tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2723_c2_7dfa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2723_c2_7dfa]
signal result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2723_c2_7dfa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2723_c2_7dfa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2723_c2_7dfa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2723_c2_7dfa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2723_c2_7dfa]
signal n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_cc08]
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2728_c7_e056]
signal t16_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2728_c7_e056]
signal tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2728_c7_e056]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2728_c7_e056]
signal result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2728_c7_e056]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2728_c7_e056]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2728_c7_e056]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2728_c7_e056]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2728_c7_e056]
signal n16_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_a763]
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2731_c7_b26e]
signal t16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2731_c7_b26e]
signal tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2731_c7_b26e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2731_c7_b26e]
signal result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2731_c7_b26e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2731_c7_b26e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2731_c7_b26e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2731_c7_b26e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2731_c7_b26e]
signal n16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_b784]
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2736_c7_6285]
signal t16_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2736_c7_6285]
signal tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2736_c7_6285]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2736_c7_6285]
signal result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2736_c7_6285]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2736_c7_6285]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2736_c7_6285]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2736_c7_6285]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2736_c7_6285]
signal n16_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_ef61]
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2739_c7_c182]
signal t16_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2739_c7_c182]
signal tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2739_c7_c182]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2739_c7_c182]
signal result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2739_c7_c182]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2739_c7_c182]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2739_c7_c182]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2739_c7_c182]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2739_c7_c182]
signal n16_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2740_c3_bcd1]
signal BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_558f]
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2743_c7_d286]
signal tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2743_c7_d286]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2743_c7_d286]
signal result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2743_c7_d286]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2743_c7_d286]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2743_c7_d286]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2743_c7_d286]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2743_c7_d286]
signal n16_MUX_uxn_opcodes_h_l2743_c7_d286_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2743_c7_d286_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2746_c11_fd24]
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2746_c7_ba97]
signal tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2746_c7_ba97]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2746_c7_ba97]
signal result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2746_c7_ba97]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2746_c7_ba97]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2746_c7_ba97]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2746_c7_ba97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2746_c7_ba97]
signal n16_MUX_uxn_opcodes_h_l2746_c7_ba97_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_5868]
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2751_c7_6d8b]
signal tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2751_c7_6d8b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2751_c7_6d8b]
signal result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2751_c7_6d8b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2751_c7_6d8b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2751_c7_6d8b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2751_c7_6d8b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2751_c7_6d8b]
signal n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2754_c11_242b]
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2754_c7_676f]
signal tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2754_c7_676f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2754_c7_676f]
signal result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2754_c7_676f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2754_c7_676f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2754_c7_676f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2754_c7_676f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2754_c7_676f]
signal n16_MUX_uxn_opcodes_h_l2754_c7_676f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2754_c7_676f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2755_c3_9c10]
signal BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2756_c11_bd55]
signal BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2758_c32_0048]
signal BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2758_c32_ef36]
signal BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2758_c32_62c5]
signal MUX_uxn_opcodes_h_l2758_c32_62c5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2758_c32_62c5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2758_c32_62c5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2758_c32_62c5_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_1a9e]
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2760_c7_7b05]
signal result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2760_c7_7b05]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2760_c7_7b05]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2760_c7_7b05]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2760_c7_7b05]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_862e]
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2766_c7_3a2e]
signal result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2766_c7_3a2e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2766_c7_3a2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2766_c7_3a2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2768_c34_aad3]
signal CONST_SR_8_uxn_opcodes_h_l2768_c34_aad3_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2768_c34_aad3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_daf8]
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2770_c7_1d68]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2770_c7_1d68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51
BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_left,
BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_right,
BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_return_output);

-- t16_MUX_uxn_opcodes_h_l2723_c2_7dfa
t16_MUX_uxn_opcodes_h_l2723_c2_7dfa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond,
t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue,
t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse,
t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa
tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond,
tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue,
tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse,
tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa
result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond,
result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa
result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output);

-- n16_MUX_uxn_opcodes_h_l2723_c2_7dfa
n16_MUX_uxn_opcodes_h_l2723_c2_7dfa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond,
n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue,
n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse,
n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_left,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_right,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_return_output);

-- t16_MUX_uxn_opcodes_h_l2728_c7_e056
t16_MUX_uxn_opcodes_h_l2728_c7_e056 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2728_c7_e056_cond,
t16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue,
t16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse,
t16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2728_c7_e056
tmp16_MUX_uxn_opcodes_h_l2728_c7_e056 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_cond,
tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue,
tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse,
tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056
result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_cond,
result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056
result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_return_output);

-- n16_MUX_uxn_opcodes_h_l2728_c7_e056
n16_MUX_uxn_opcodes_h_l2728_c7_e056 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2728_c7_e056_cond,
n16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue,
n16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse,
n16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_left,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_right,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_return_output);

-- t16_MUX_uxn_opcodes_h_l2731_c7_b26e
t16_MUX_uxn_opcodes_h_l2731_c7_b26e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond,
t16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue,
t16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse,
t16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e
tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond,
tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e
result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e
result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e
result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output);

-- n16_MUX_uxn_opcodes_h_l2731_c7_b26e
n16_MUX_uxn_opcodes_h_l2731_c7_b26e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond,
n16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue,
n16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse,
n16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_left,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_right,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_return_output);

-- t16_MUX_uxn_opcodes_h_l2736_c7_6285
t16_MUX_uxn_opcodes_h_l2736_c7_6285 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2736_c7_6285_cond,
t16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue,
t16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse,
t16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2736_c7_6285
tmp16_MUX_uxn_opcodes_h_l2736_c7_6285 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_cond,
tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue,
tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse,
tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285
result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285
result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_cond,
result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285
result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285
result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285
result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_return_output);

-- n16_MUX_uxn_opcodes_h_l2736_c7_6285
n16_MUX_uxn_opcodes_h_l2736_c7_6285 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2736_c7_6285_cond,
n16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue,
n16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse,
n16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_left,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_right,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_return_output);

-- t16_MUX_uxn_opcodes_h_l2739_c7_c182
t16_MUX_uxn_opcodes_h_l2739_c7_c182 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2739_c7_c182_cond,
t16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue,
t16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse,
t16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2739_c7_c182
tmp16_MUX_uxn_opcodes_h_l2739_c7_c182 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_cond,
tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue,
tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse,
tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182
result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182
result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_cond,
result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182
result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_return_output);

-- n16_MUX_uxn_opcodes_h_l2739_c7_c182
n16_MUX_uxn_opcodes_h_l2739_c7_c182 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2739_c7_c182_cond,
n16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue,
n16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse,
n16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1
BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_left,
BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_right,
BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_left,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_right,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2743_c7_d286
tmp16_MUX_uxn_opcodes_h_l2743_c7_d286 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_cond,
tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue,
tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse,
tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286
result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286
result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_cond,
result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286
result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286
result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_return_output);

-- n16_MUX_uxn_opcodes_h_l2743_c7_d286
n16_MUX_uxn_opcodes_h_l2743_c7_d286 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2743_c7_d286_cond,
n16_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue,
n16_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse,
n16_MUX_uxn_opcodes_h_l2743_c7_d286_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_left,
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_right,
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97
tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_cond,
tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue,
tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse,
tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97
result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97
result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_cond,
result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97
result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97
result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97
result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output);

-- n16_MUX_uxn_opcodes_h_l2746_c7_ba97
n16_MUX_uxn_opcodes_h_l2746_c7_ba97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2746_c7_ba97_cond,
n16_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue,
n16_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse,
n16_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_left,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_right,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b
tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond,
tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b
result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b
result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b
result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output);

-- n16_MUX_uxn_opcodes_h_l2751_c7_6d8b
n16_MUX_uxn_opcodes_h_l2751_c7_6d8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond,
n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue,
n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse,
n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_left,
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_right,
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2754_c7_676f
tmp16_MUX_uxn_opcodes_h_l2754_c7_676f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_cond,
tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f
result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f
result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f
result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f
result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_return_output);

-- n16_MUX_uxn_opcodes_h_l2754_c7_676f
n16_MUX_uxn_opcodes_h_l2754_c7_676f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2754_c7_676f_cond,
n16_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue,
n16_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse,
n16_MUX_uxn_opcodes_h_l2754_c7_676f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10
BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_left,
BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_right,
BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55
BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_left,
BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_right,
BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048
BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_left,
BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_right,
BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36
BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_left,
BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_right,
BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_return_output);

-- MUX_uxn_opcodes_h_l2758_c32_62c5
MUX_uxn_opcodes_h_l2758_c32_62c5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2758_c32_62c5_cond,
MUX_uxn_opcodes_h_l2758_c32_62c5_iftrue,
MUX_uxn_opcodes_h_l2758_c32_62c5_iffalse,
MUX_uxn_opcodes_h_l2758_c32_62c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_left,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_right,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05
result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_cond,
result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_left,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_right,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e
result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2768_c34_aad3
CONST_SR_8_uxn_opcodes_h_l2768_c34_aad3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2768_c34_aad3_x,
CONST_SR_8_uxn_opcodes_h_l2768_c34_aad3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_left,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_right,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc
CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_return_output,
 t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output,
 tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output,
 n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_return_output,
 t16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output,
 tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_return_output,
 n16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_return_output,
 t16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output,
 n16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_return_output,
 t16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output,
 tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_return_output,
 n16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_return_output,
 t16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output,
 tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_return_output,
 n16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_return_output,
 n16_MUX_uxn_opcodes_h_l2743_c7_d286_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_return_output,
 tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output,
 n16_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_return_output,
 tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output,
 n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_return_output,
 n16_MUX_uxn_opcodes_h_l2754_c7_676f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_return_output,
 MUX_uxn_opcodes_h_l2758_c32_62c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output,
 CONST_SR_8_uxn_opcodes_h_l2768_c34_aad3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2725_c3_9f59 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2729_c3_5ac4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2728_c7_e056_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2734_c3_e587 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2737_c3_a24c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2736_c7_6285_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2741_c3_35d3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2743_c7_d286_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2739_c7_c182_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_ebd3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2743_c7_d286_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2749_c3_3e41 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2746_c7_ba97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_058b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2754_c7_676f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2754_c7_676f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2758_c32_62c5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2758_c32_62c5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2758_c32_62c5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2758_c32_62c5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2763_c3_11c5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2764_c24_8b7a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2767_c3_fb38 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2768_c34_aad3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2768_c34_aad3_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2768_c24_47d9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2731_l2754_l2728_DUPLICATE_2c53_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_c2f4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2760_l2731_l2728_DUPLICATE_eeac_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2770_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_26b4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2746_l2743_l2770_l2739_l2766_l2736_l2760_l2731_l2754_l2728_DUPLICATE_7dfe_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2740_l2747_l2732_l2755_DUPLICATE_acc5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2766_l2754_DUPLICATE_2c91_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2719_l2775_DUPLICATE_6992_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2763_c3_11c5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2763_c3_11c5;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_ebd3 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_ebd3;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2737_c3_a24c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2737_c3_a24c;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2729_c3_5ac4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2729_c3_5ac4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2749_c3_3e41 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2749_c3_3e41;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2741_c3_35d3 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2741_c3_35d3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2758_c32_62c5_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2767_c3_fb38 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2767_c3_fb38;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2725_c3_9f59 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2725_c3_9f59;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_058b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_058b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2734_c3_e587 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2734_c3_e587;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l2758_c32_62c5_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2768_c34_aad3_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l2768_c34_aad3] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2768_c34_aad3_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2768_c34_aad3_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2768_c34_aad3_return_output := CONST_SR_8_uxn_opcodes_h_l2768_c34_aad3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_cc08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_left;
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_return_output := BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_1a9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_5868] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_left;
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_return_output := BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2723_c6_3f51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_left;
     BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_return_output := BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_daf8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2746_l2743_l2770_l2739_l2766_l2736_l2760_l2731_l2754_l2728_DUPLICATE_7dfe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2746_l2743_l2770_l2739_l2766_l2736_l2760_l2731_l2754_l2728_DUPLICATE_7dfe_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2740_l2747_l2732_l2755_DUPLICATE_acc5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2740_l2747_l2732_l2755_DUPLICATE_acc5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2731_l2754_l2728_DUPLICATE_2c53 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2731_l2754_l2728_DUPLICATE_2c53_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2764_c24_8b7a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2764_c24_8b7a_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_b784] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_left;
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_return_output := BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2766_l2754_DUPLICATE_2c91 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2766_l2754_DUPLICATE_2c91_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_c2f4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_c2f4_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l2758_c32_0048] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_left;
     BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_return_output := BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2754_c11_242b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_ef61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_left;
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_return_output := BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2746_c11_fd24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_left;
     BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_return_output := BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_a763] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_left;
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_return_output := BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_558f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2760_l2731_l2728_DUPLICATE_eeac LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2760_l2731_l2728_DUPLICATE_eeac_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2770_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_26b4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2770_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_26b4_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_862e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_0048_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_3f51_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2728_c7_e056_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2728_c7_e056_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_cc08_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_a763_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2736_c7_6285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2736_c7_6285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_b784_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2739_c7_c182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2739_c7_c182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_ef61_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2743_c7_d286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_558f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2746_c7_ba97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_fd24_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_5868_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2754_c7_676f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_242b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1a9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_862e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2740_l2747_l2732_l2755_DUPLICATE_acc5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2740_l2747_l2732_l2755_DUPLICATE_acc5_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2740_l2747_l2732_l2755_DUPLICATE_acc5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2764_c24_8b7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2731_l2754_l2728_DUPLICATE_2c53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2731_l2754_l2728_DUPLICATE_2c53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2731_l2754_l2728_DUPLICATE_2c53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2731_l2754_l2728_DUPLICATE_2c53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2731_l2754_l2728_DUPLICATE_2c53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2731_l2754_l2728_DUPLICATE_2c53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2731_l2754_l2728_DUPLICATE_2c53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2731_l2754_l2728_DUPLICATE_2c53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2731_l2754_l2728_DUPLICATE_2c53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2746_l2743_l2770_l2739_l2766_l2736_l2760_l2731_l2754_l2728_DUPLICATE_7dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2746_l2743_l2770_l2739_l2766_l2736_l2760_l2731_l2754_l2728_DUPLICATE_7dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2746_l2743_l2770_l2739_l2766_l2736_l2760_l2731_l2754_l2728_DUPLICATE_7dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2746_l2743_l2770_l2739_l2766_l2736_l2760_l2731_l2754_l2728_DUPLICATE_7dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2746_l2743_l2770_l2739_l2766_l2736_l2760_l2731_l2754_l2728_DUPLICATE_7dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2746_l2743_l2770_l2739_l2766_l2736_l2760_l2731_l2754_l2728_DUPLICATE_7dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2746_l2743_l2770_l2739_l2766_l2736_l2760_l2731_l2754_l2728_DUPLICATE_7dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2746_l2743_l2770_l2739_l2766_l2736_l2760_l2731_l2754_l2728_DUPLICATE_7dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2746_l2743_l2770_l2739_l2766_l2736_l2760_l2731_l2754_l2728_DUPLICATE_7dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2746_l2743_l2770_l2739_l2766_l2736_l2760_l2731_l2754_l2728_DUPLICATE_7dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2746_l2743_l2770_l2739_l2766_l2736_l2760_l2731_l2754_l2728_DUPLICATE_7dfe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2760_l2731_l2728_DUPLICATE_eeac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2760_l2731_l2728_DUPLICATE_eeac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2760_l2731_l2728_DUPLICATE_eeac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2760_l2731_l2728_DUPLICATE_eeac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2760_l2731_l2728_DUPLICATE_eeac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2760_l2731_l2728_DUPLICATE_eeac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2760_l2731_l2728_DUPLICATE_eeac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2760_l2731_l2728_DUPLICATE_eeac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2736_l2760_l2731_l2728_DUPLICATE_eeac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2770_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_26b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2770_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_26b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2770_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_26b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2770_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_26b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2770_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_26b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2770_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_26b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2770_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_26b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2770_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_26b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2770_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_26b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2770_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_26b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2770_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_26b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2766_l2754_DUPLICATE_2c91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2766_l2754_DUPLICATE_2c91_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_c2f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_c2f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_c2f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_c2f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_c2f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_c2f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_c2f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_c2f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_c2f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2751_l2723_l2746_l2743_l2739_l2766_l2736_l2731_l2754_l2728_DUPLICATE_c2f4_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2740_c3_bcd1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_left;
     BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_return_output := BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2758_c32_ef36] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_left;
     BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_return_output := BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2766_c7_3a2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2768_c24_47d9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2768_c24_47d9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2768_c34_aad3_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2755_c3_9c10] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_left;
     BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_return_output := BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2770_c7_1d68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2760_c7_7b05] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2770_c7_1d68] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2758_c32_62c5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_ef36_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_bcd1_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_9c10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2768_c24_47d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_e1dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_1d68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_1d68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output;
     -- t16_MUX[uxn_opcodes_h_l2739_c7_c182] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2739_c7_c182_cond <= VAR_t16_MUX_uxn_opcodes_h_l2739_c7_c182_cond;
     t16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue;
     t16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output := t16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;

     -- MUX[uxn_opcodes_h_l2758_c32_62c5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2758_c32_62c5_cond <= VAR_MUX_uxn_opcodes_h_l2758_c32_62c5_cond;
     MUX_uxn_opcodes_h_l2758_c32_62c5_iftrue <= VAR_MUX_uxn_opcodes_h_l2758_c32_62c5_iftrue;
     MUX_uxn_opcodes_h_l2758_c32_62c5_iffalse <= VAR_MUX_uxn_opcodes_h_l2758_c32_62c5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2758_c32_62c5_return_output := MUX_uxn_opcodes_h_l2758_c32_62c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2760_c7_7b05] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2766_c7_3a2e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2766_c7_3a2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2766_c7_3a2e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2756_c11_bd55] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_return_output;

     -- n16_MUX[uxn_opcodes_h_l2754_c7_676f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2754_c7_676f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2754_c7_676f_cond;
     n16_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue;
     n16_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2754_c7_676f_return_output := n16_MUX_uxn_opcodes_h_l2754_c7_676f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2754_c7_676f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_bd55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue := VAR_MUX_uxn_opcodes_h_l2758_c32_62c5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2754_c7_676f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_676f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_3a2e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;
     -- t16_MUX[uxn_opcodes_h_l2736_c7_6285] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2736_c7_6285_cond <= VAR_t16_MUX_uxn_opcodes_h_l2736_c7_6285_cond;
     t16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue;
     t16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output := t16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2754_c7_676f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2754_c7_676f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_cond;
     tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_return_output := tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2754_c7_676f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2751_c7_6d8b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond;
     n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue;
     n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output := n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2751_c7_6d8b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2760_c7_7b05] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2760_c7_7b05] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2760_c7_7b05] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output := result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_676f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_676f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_7b05_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_676f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2754_c7_676f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2746_c7_ba97] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2746_c7_ba97_cond <= VAR_n16_MUX_uxn_opcodes_h_l2746_c7_ba97_cond;
     n16_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue;
     n16_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output := n16_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2746_c7_ba97] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2751_c7_6d8b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond;
     tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output := tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2754_c7_676f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2731_c7_b26e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond;
     t16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue;
     t16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output := t16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2751_c7_6d8b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2751_c7_6d8b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2754_c7_676f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_676f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_676f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_676f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output;
     -- t16_MUX[uxn_opcodes_h_l2728_c7_e056] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2728_c7_e056_cond <= VAR_t16_MUX_uxn_opcodes_h_l2728_c7_e056_cond;
     t16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue;
     t16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output := t16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2751_c7_6d8b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2743_c7_d286] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2746_c7_ba97] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_cond;
     tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output := tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2751_c7_6d8b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2743_c7_d286] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2743_c7_d286_cond <= VAR_n16_MUX_uxn_opcodes_h_l2743_c7_d286_cond;
     n16_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue;
     n16_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2743_c7_d286_return_output := n16_MUX_uxn_opcodes_h_l2743_c7_d286_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2751_c7_6d8b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2746_c7_ba97] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2746_c7_ba97] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2743_c7_d286_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_d286_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_6d8b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output;
     -- t16_MUX[uxn_opcodes_h_l2723_c2_7dfa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond <= VAR_t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond;
     t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue;
     t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output := t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2746_c7_ba97] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2746_c7_ba97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2739_c7_c182] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2746_c7_ba97] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output := result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2743_c7_d286] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_return_output;

     -- n16_MUX[uxn_opcodes_h_l2739_c7_c182] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2739_c7_c182_cond <= VAR_n16_MUX_uxn_opcodes_h_l2739_c7_c182_cond;
     n16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue;
     n16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output := n16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2743_c7_d286] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_cond;
     tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_return_output := tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2743_c7_d286] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_d286_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_d286_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_ba97_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_d286_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2736_c7_6285] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;

     -- n16_MUX[uxn_opcodes_h_l2736_c7_6285] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2736_c7_6285_cond <= VAR_n16_MUX_uxn_opcodes_h_l2736_c7_6285_cond;
     n16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue;
     n16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output := n16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2743_c7_d286] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2739_c7_c182] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2739_c7_c182] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2739_c7_c182] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_cond;
     tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output := tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2743_c7_d286] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_return_output := result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2743_c7_d286] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_d286_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_d286_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_d286_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2731_c7_b26e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2736_c7_6285] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_cond;
     tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output := tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2736_c7_6285] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;

     -- n16_MUX[uxn_opcodes_h_l2731_c7_b26e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond;
     n16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue;
     n16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output := n16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2736_c7_6285] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2739_c7_c182] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2739_c7_c182] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2739_c7_c182] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_return_output := result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_c182_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2728_c7_e056] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2736_c7_6285] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2731_c7_b26e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_cond;
     tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output := tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2736_c7_6285] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;

     -- n16_MUX[uxn_opcodes_h_l2728_c7_e056] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2728_c7_e056_cond <= VAR_n16_MUX_uxn_opcodes_h_l2728_c7_e056_cond;
     n16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue;
     n16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output := n16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2731_c7_b26e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2731_c7_b26e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2736_c7_6285] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_return_output := result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_6285_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2731_c7_b26e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2728_c7_e056] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_cond;
     tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output := tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;

     -- n16_MUX[uxn_opcodes_h_l2723_c2_7dfa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond <= VAR_n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond;
     n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue;
     n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output := n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2731_c7_b26e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2728_c7_e056] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2728_c7_e056] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2723_c2_7dfa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2731_c7_b26e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_b26e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2723_c2_7dfa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2728_c7_e056] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_return_output := result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2723_c2_7dfa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond;
     tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output := tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2728_c7_e056] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2728_c7_e056] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2723_c2_7dfa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_e056_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2723_c2_7dfa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output := result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2723_c2_7dfa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2723_c2_7dfa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2719_l2775_DUPLICATE_6992 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2719_l2775_DUPLICATE_6992_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_7dfa_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2719_l2775_DUPLICATE_6992_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2719_l2775_DUPLICATE_6992_return_output;
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
